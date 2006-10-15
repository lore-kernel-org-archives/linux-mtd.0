Received: from 208.101.48.4-static.reverse.softlayer.com ([208.101.48.4]
	helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GYv5x-0006Im-Cz
	for linux-mtd@lists.infradead.org; Sun, 15 Oct 2006 02:47:18 +0100
Received: from [125.22.73.135] (helo=vaishnavi.localdomain.localdomain)
	by chtn01.999servers.com with esmtpa (Exim 4.52) id 1GYv5n-0001v2-MA
	for linux-mtd@lists.infradead.org; Sat, 14 Oct 2006 20:47:09 -0500
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17713.39216.632541.647030@vaishnavi.localdomain>
Date: Sun, 15 Oct 2006 07:43:04 +0530
To: linux-mtd@lists.infradead.org
Subject: [PATCH] NAND: nandsim coding style fix
From: Vijay Kumar <vijaykumar@bravegnu.org>
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removes line break after return type in function definitions, to be
consistent with the Linux coding style.

Signed-off-by: Vijay Kumar <vijaykumar@bravegnu.org>

Index: linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c
===================================================================
--- linux-2.6-mtd-quilt.orig/drivers/mtd/nand/nandsim.c	2006-10-14 21:14:01.000000000 +0530
+++ linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c	2006-10-14 21:10:39.000000000 +0530
@@ -349,8 +349,7 @@
  *
  * RETURNS: 0 if success, -ENOMEM if memory alloc fails.
  */
-static int
-alloc_device(struct nandsim *ns)
+static int alloc_device(struct nandsim *ns)
 {
 	int i;
 
@@ -369,8 +368,7 @@
 /*
  * Free any allocated pages, and free the array of page pointers.
  */
-static void
-free_device(struct nandsim *ns)
+static void free_device(struct nandsim *ns)
 {
 	int i;
 
@@ -388,8 +386,7 @@
  *
  * RETURNS: 0 if success, -ERRNO if failure.
  */
-static int
-init_nandsim(struct mtd_info *mtd)
+static int init_nandsim(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
 	struct nandsim   *ns   = (struct nandsim *)(chip->priv);
@@ -505,8 +502,7 @@
 /*
  * Free the nandsim structure.
  */
-static void
-free_nandsim(struct nandsim *ns)
+static void free_nandsim(struct nandsim *ns)
 {
 	kfree(ns->buf.byte);
 	free_device(ns);
@@ -517,8 +513,7 @@
 /*
  * Returns the string representation of 'state' state.
  */
-static char *
-get_state_name(uint32_t state)
+static char *get_state_name(uint32_t state)
 {
 	switch (NS_STATE(state)) {
 		case STATE_CMD_READ0:
@@ -576,8 +571,7 @@
  *
  * RETURNS: 1 if wrong command, 0 if right.
  */
-static int
-check_command(int cmd)
+static int check_command(int cmd)
 {
 	switch (cmd) {
 
@@ -603,8 +597,7 @@
 /*
  * Returns state after command is accepted by command number.
  */
-static uint32_t
-get_state_by_command(unsigned command)
+static uint32_t get_state_by_command(unsigned command)
 {
 	switch (command) {
 		case NAND_CMD_READ0:
@@ -640,8 +633,7 @@
 /*
  * Move an address byte to the correspondent internal register.
  */
-static inline void
-accept_addr_byte(struct nandsim *ns, u_char bt)
+static inline void accept_addr_byte(struct nandsim *ns, u_char bt)
 {
 	uint byte = (uint)bt;
 
@@ -659,8 +651,7 @@
 /*
  * Switch to STATE_READY state.
  */
-static inline void
-switch_to_ready_state(struct nandsim *ns, u_char status)
+static inline void switch_to_ready_state(struct nandsim *ns, u_char status)
 {
 	NS_DBG("switch_to_ready_state: switch to %s state\n", get_state_name(STATE_READY));
 
@@ -719,8 +710,7 @@
  *          -1 - several matches.
  *           0 - operation is found.
  */
-static int
-find_operation(struct nandsim *ns, uint32_t flag)
+static int find_operation(struct nandsim *ns, uint32_t flag)
 {
 	int opsfound = 0;
 	int i, j, idx = 0;
@@ -887,8 +877,7 @@
  *
  * RETURNS: 0 if success, -1 if error.
  */
-static int
-do_state_action(struct nandsim *ns, uint32_t action)
+static int do_state_action(struct nandsim *ns, uint32_t action)
 {
 	int num;
 	int busdiv = ns->busw == 8 ? 1 : 2;
@@ -1020,8 +1009,7 @@
 /*
  * Switch simulator's state.
  */
-static void
-switch_state(struct nandsim *ns)
+static void switch_state(struct nandsim *ns)
 {
 	if (ns->op) {
 		/*
@@ -1162,8 +1150,7 @@
 	}
 }
 
-static u_char
-ns_nand_read_byte(struct mtd_info *mtd)
+static u_char ns_nand_read_byte(struct mtd_info *mtd)
 {
         struct nandsim *ns = (struct nandsim *)((struct nand_chip *)mtd->priv)->priv;
 	u_char outb = 0x00;
@@ -1236,8 +1223,7 @@
 	return outb;
 }
 
-static void
-ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
+static void ns_nand_write_byte(struct mtd_info *mtd, u_char byte)
 {
         struct nandsim *ns = (struct nandsim *)((struct nand_chip *)mtd->priv)->priv;
 
@@ -1400,15 +1386,13 @@
 		ns_nand_write_byte(mtd, cmd);
 }
 
-static int
-ns_device_ready(struct mtd_info *mtd)
+static int ns_device_ready(struct mtd_info *mtd)
 {
 	NS_DBG("device_ready\n");
 	return 1;
 }
 
-static uint16_t
-ns_nand_read_word(struct mtd_info *mtd)
+static uint16_t ns_nand_read_word(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
 
@@ -1417,8 +1401,7 @@
 	return chip->read_byte(mtd) | (chip->read_byte(mtd) << 8);
 }
 
-static void
-ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
+static void ns_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
         struct nandsim *ns = (struct nandsim *)((struct nand_chip *)mtd->priv)->priv;
 
@@ -1445,8 +1428,7 @@
 	}
 }
 
-static void
-ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
         struct nandsim *ns = (struct nandsim *)((struct nand_chip *)mtd->priv)->priv;
 
@@ -1499,8 +1481,7 @@
 	return;
 }
 
-static int
-ns_nand_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
+static int ns_nand_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
 	ns_nand_read_buf(mtd, (u_char *)&ns_verify_buf[0], len);
