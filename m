Received: from h-67-102-66-132.snfccasy.covad.net ([67.102.66.132]
	helo=hheld.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7brP-00050X-T7
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 13:47:27 -0400
From: "David Byron" <dbyron@hheld.com>
To: "'Josh Boyer'" <jwboyer@gmail.com>
Subject: RE: autoconf for mtd-utils
Date: Mon, 31 Jul 2006 10:47:12 -0700
Message-ID: <002301c6b4c9$5aa3d3b0$a134800a@RudiDell>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0024_01C6B48E.AE44FBB0"
In-Reply-To: AAAAAJOKoN+ryO5OkOyypB2eX+5E9yEA
Cc: linux-mtd@lists.infradead.org
Reply-To: dbyron@hheld.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0024_01C6B48E.AE44FBB0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2006-07-30 at 11:10a, Josh Boyer wrote:

> Something like that.  But leave the definition of CROSS alone.  It's
> better to leave the trailing '-' at the end so that if other cross
> tools are needed, you just specify $(CROSS)ld, etc.

How's this?

-DB

------=_NextPart_000_0024_01C6B48E.AE44FBB0
Content-Type: application/octet-stream;
	name="Makefile.patch.3"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Makefile.patch.3"

diff --git a/Makefile b/Makefile=0A=
index 37cd7f7..683ddbf 100644=0A=
--- a/Makefile=0A=
+++ b/Makefile=0A=
@@ -10,7 +10,14 @@ #CROSS=3Darm-linux-=0A=
 CC :=3D $(CROSS)gcc=0A=
 CFLAGS :=3D -I./include -O2 -Wall=0A=
 =0A=
-TARGETS =3D ftl_format flash_erase flash_eraseall nanddump doc_loadbios =
\=0A=
+ifeq ($(origin CROSS),undefined)=0A=
+  BUILDDIR :=3D .=0A=
+else=0A=
+# Remove the trailing slash to make the directory name=0A=
+  BUILDDIR :=3D $(CROSS:-=3D)=0A=
+endif=0A=
+=0A=
+RAWTARGETS =3D ftl_format flash_erase flash_eraseall nanddump =
doc_loadbios \=0A=
 	mkfs.jffs ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \=0A=
 	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite \=0A=
 	jffs2dump \=0A=
@@ -18,40 +25,48 @@ TARGETS =3D ftl_format flash_erase flash_e=0A=
 	rfddump rfdformat \=0A=
 	sumtool #jffs2reader=0A=
 =0A=
+TARGETS =3D $(foreach target,$(RAWTARGETS),$(BUILDDIR)/$(target))=0A=
+=0A=
 SYMLINKS =3D=0A=
 =0A=
 %: %.o=0A=
-	$(CC) $(LDFLAGS) -g -o $@ $^=0A=
+	$(CC) $(CFLAGS) $(LDFLAGS) -g -o $@ $^=0A=
 =0A=
-%.o: %.c=0A=
-	$(CC) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,.$<.dep=0A=
+$(BUILDDIR)/%.o: %.c=0A=
+	mkdir -p $(BUILDDIR)=0A=
+	$(CC) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,$(BUILDDIR)/.$(<F).dep=0A=
 =0A=
 .SUFFIXES:=0A=
 =0A=
 all: $(TARGETS)=0A=
 =0A=
-IGNORE=3D${wildcard .*.c.dep}=0A=
+IGNORE=3D${wildcard $(BUILDDIR)/.*.c.dep}=0A=
 -include ${IGNORE}=0A=
 =0A=
 clean:=0A=
-	rm -f *.o $(TARGETS) .*.c.dep $(SYMLINKS)=0A=
+	rm -f $(BUILDDIR)/*.o $(TARGETS) $(BUILDDIR)/.*.c.dep $(SYMLINKS)=0A=
+	if [ "$(BUILDDIR)x" !=3D ".x" ]; then rm -rf $(BUILDDIR); fi=0A=
 =0A=
 $(SYMLINKS):=0A=
 	ln -sf ../fs/jffs2/$@ $@=0A=
 =0A=
-mkfs.jffs2: crc32.o compr_rtime.o mkfs.jffs2.o compr_zlib.o compr.o=0A=
+$(BUILDDIR)/mkfs.jffs2: $(BUILDDIR)/crc32.o \=0A=
+			$(BUILDDIR)/compr_rtime.o \=0A=
+			$(BUILDDIR)/mkfs.jffs2.o \=0A=
+			$(BUILDDIR)/compr_zlib.o \=0A=
+			$(BUILDDIR)/compr.o=0A=
 	$(CC) $(LDFLAGS) -o $@ $^ -lz=0A=
 =0A=
-flash_eraseall: crc32.o flash_eraseall.o=0A=
+$(BUILDDIR)/flash_eraseall: $(BUILDDIR)/crc32.o =
$(BUILDDIR)/flash_eraseall.o=0A=
 	$(CC) $(LDFLAGS) -o $@ $^=0A=
 =0A=
-jffs2reader: jffs2reader.o=0A=
+$(BUILDDIR)/jffs2reader: $(BUILDDIR)/jffs2reader.o=0A=
 	$(CC) $(LDFLAGS) -o $@ $^ -lz=0A=
 =0A=
-jffs2dump: jffs2dump.o crc32.o=0A=
+$(BUILDDIR)/jffs2dump: $(BUILDDIR)/jffs2dump.o $(BUILDDIR)/crc32.o=0A=
 	$(CC) $(LDFLAGS) -o $@ $^=0A=
 =0A=
-sumtool: sumtool.o crc32.o=0A=
+$(BUILDDIR)/sumtool: $(BUILDDIR)/sumtool.o $(BUILDDIR)/crc32.o=0A=
 	$(CC) $(LDFLAGS) -o $@ $^=0A=
 =0A=
 install: ${TARGETS}=0A=

------=_NextPart_000_0024_01C6B48E.AE44FBB0--
