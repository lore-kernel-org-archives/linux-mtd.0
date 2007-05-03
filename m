Received: from mail-in-10.arcor-online.net ([151.189.21.50])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjOjT-0002HU-62
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 19:59:58 -0400
From: Segher Boessenkool <segher@kernel.crashing.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH rslib] Support non-canonical GF representations
Message-Id: <20070503000213.A3DF37F9062@schermpje.krocht>
Date: Thu,  3 May 2007 02:02:13 +0200 (CEST)
Cc: Thomas Gleixner <tglx@linutronix.de>, david@woodhou.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Segher Boessenkool <segher@kernel.crashing.org>
Acked-by: Thomas Gleixner <tglx@linutronix.de>

---
 include/linux/rslib.h           |    4 +
 lib/reed_solomon/reed_solomon.c |   84 ++++++++++++++++++++++++++------
 2 files changed, 73 insertions(+), 15 deletions(-)

Index: linux-2.6/include/linux/rslib.h
===================================================================
--- linux-2.6.orig/include/linux/rslib.h
+++ linux-2.6/include/linux/rslib.h
@@ -34,6 +34,7 @@
  * @prim:	Primitive element, index form
  * @iprim:	prim-th root of 1, index form
  * @gfpoly:	The primitive generator polynominal
+ * @gffunc:	Function to generate the field, if non-canonical representation
  * @users:	Users of this structure
  * @list:	List entry for the rs control list
 */
@@ -48,6 +49,7 @@
 	int 		prim;
 	int 		iprim;
 	int		gfpoly;
+	int		(*gffunc)(int);
 	int		users;
 	struct list_head list;
 };
@@ -77,6 +79,8 @@
 /* Create or get a matching rs control structure */
 struct rs_control *init_rs(int symsize, int gfpoly, int fcr, int prim,
 			   int nroots);
+struct rs_control *init_rs_non_canonical(int symsize, int (*func)(int),
+                                         int fcr, int prim, int nroots);
 
 /* Release a rs control structure */
 void free_rs(struct rs_control *rs);
Index: linux-2.6/lib/reed_solomon/reed_solomon.c
===================================================================
--- linux-2.6.orig/lib/reed_solomon/reed_solomon.c
+++ linux-2.6/lib/reed_solomon/reed_solomon.c
@@ -56,6 +56,7 @@
  * rs_init - Initialize a Reed-Solomon codec
  * @symsize:	symbol size, bits (1-8)
  * @gfpoly:	Field generator polynomial coefficients
+ * @gffunc:	Field generator function
  * @fcr:	first root of RS code generator polynomial, index form
  * @prim:	primitive element to generate polynomial roots
  * @nroots:	RS code generator polynomial degree (number of roots)
@@ -63,8 +64,8 @@
  * Allocate a control structure and the polynom arrays for faster
  * en/decoding. Fill the arrays according to the given parameters.
  */
-static struct rs_control *rs_init(int symsize, int gfpoly, int fcr,
-				   int prim, int nroots)
+static struct rs_control *rs_init(int symsize, int gfpoly, int (*gffunc)(int),
+                                  int fcr, int prim, int nroots)
 {
 	struct rs_control *rs;
 	int i, j, sr, root, iprim;
@@ -82,6 +83,7 @@
 	rs->prim = prim;
 	rs->nroots = nroots;
 	rs->gfpoly = gfpoly;
+	rs->gffunc = gffunc;
 
 	/* Allocate the arrays */
 	rs->alpha_to = kmalloc(sizeof(uint16_t) * (rs->nn + 1), GFP_KERNEL);
@@ -99,17 +101,26 @@
 	/* Generate Galois field lookup tables */
 	rs->index_of[0] = rs->nn;	/* log(zero) = -inf */
 	rs->alpha_to[rs->nn] = 0;	/* alpha**-inf = 0 */
-	sr = 1;
-	for (i = 0; i < rs->nn; i++) {
-		rs->index_of[sr] = i;
-		rs->alpha_to[i] = sr;
-		sr <<= 1;
-		if (sr & (1 << symsize))
-			sr ^= gfpoly;
-		sr &= rs->nn;
+	if (!gffunc) {
+		sr = 1;
+		for (i = 0; i < rs->nn; i++) {
+			rs->index_of[sr] = i;
+			rs->alpha_to[i] = sr;
+			sr <<= 1;
+			if (sr & (1 << symsize))
+				sr ^= gfpoly;
+			sr &= rs->nn;
+		}
+	} else {
+		sr = gffunc(0);
+		for (i = 0; i < rs->nn; i++) {
+			rs->index_of[sr] = i;
+			rs->alpha_to[i] = sr;
+			sr = gffunc(sr);
+		}
 	}
 	/* If it's not primitive, exit */
-	if(sr != 1)
+	if(sr != rs->alpha_to[0])
 		goto errpol;
 
 	/* Find prim-th root of 1, used in decoding */
@@ -173,18 +184,22 @@
 }
 
 /**
- * init_rs - Find a matching or allocate a new rs control structure
+ * init_rs_internal - Find a matching or allocate a new rs control structure
  *  @symsize:	the symbol size (number of bits)
  *  @gfpoly:	the extended Galois field generator polynomial coefficients,
  *		with the 0th coefficient in the low order bit. The polynomial
  *		must be primitive;
+ *  @gffunc:	pointer to function to generate the next field element,
+ *		or the multiplicative identity element if given 0.  Used
+ *		instead of gfpoly if gfpoly is 0
  *  @fcr:  	the first consecutive root of the rs code generator polynomial
  *		in index form
  *  @prim:	primitive element to generate polynomial roots
  *  @nroots:	RS code generator polynomial degree (number of roots)
  */
-struct rs_control *init_rs(int symsize, int gfpoly, int fcr, int prim,
-			   int nroots)
+static struct rs_control *init_rs_internal(int symsize, int gfpoly,
+                                           int (*gffunc)(int), int fcr,
+                                           int prim, int nroots)
 {
 	struct list_head	*tmp;
 	struct rs_control	*rs;
@@ -208,6 +223,8 @@
 			continue;
 		if (gfpoly != rs->gfpoly)
 			continue;
+		if (gffunc != rs->gffunc)
+			continue;
 		if (fcr != rs->fcr)
 			continue;
 		if (prim != rs->prim)
@@ -220,7 +237,7 @@
 	}
 
 	/* Create a new one */
-	rs = rs_init(symsize, gfpoly, fcr, prim, nroots);
+	rs = rs_init(symsize, gfpoly, gffunc, fcr, prim, nroots);
 	if (rs) {
 		rs->users = 1;
 		list_add(&rs->list, &rslist);
@@ -230,6 +247,42 @@
 	return rs;
 }
 
+/**
+ * init_rs - Find a matching or allocate a new rs control structure
+ *  @symsize:	the symbol size (number of bits)
+ *  @gfpoly:	the extended Galois field generator polynomial coefficients,
+ *		with the 0th coefficient in the low order bit. The polynomial
+ *		must be primitive;
+ *  @fcr:  	the first consecutive root of the rs code generator polynomial
+ *		in index form
+ *  @prim:	primitive element to generate polynomial roots
+ *  @nroots:	RS code generator polynomial degree (number of roots)
+ */
+struct rs_control *init_rs(int symsize, int gfpoly, int fcr, int prim,
+                           int nroots)
+{
+	return init_rs_internal(symsize, gfpoly, NULL, fcr, prim, nroots);
+}
+
+/**
+ * init_rs_non_canonical - Find a matching or allocate a new rs control
+ *                         structure, for fields with non-canonical
+ *                         representation
+ *  @symsize:	the symbol size (number of bits)
+ *  @gffunc:	pointer to function to generate the next field element,
+ *		or the multiplicative identity element if given 0.  Used
+ *		instead of gfpoly if gfpoly is 0
+ *  @fcr:  	the first consecutive root of the rs code generator polynomial
+ *		in index form
+ *  @prim:	primitive element to generate polynomial roots
+ *  @nroots:	RS code generator polynomial degree (number of roots)
+ */
+struct rs_control *init_rs_non_canonical(int symsize, int (*gffunc)(int),
+                                         int fcr, int prim, int nroots)
+{
+	return init_rs_internal(symsize, 0, gffunc, fcr, prim, nroots);
+}
+
 #ifdef CONFIG_REED_SOLOMON_ENC8
 /**
  *  encode_rs8 - Calculate the parity for data values (8bit data width)
@@ -321,6 +374,7 @@
 #endif
 
 EXPORT_SYMBOL_GPL(init_rs);
+EXPORT_SYMBOL_GPL(init_rs_non_canonical);
 EXPORT_SYMBOL_GPL(free_rs);
 
 MODULE_LICENSE("GPL");
