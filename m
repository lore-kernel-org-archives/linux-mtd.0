Received: from web52705.mail.yahoo.com ([206.190.39.156])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cn0jU-000506-Lb
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 15:29:18 -0500
Message-ID: <20050107202914.45709.qmail@web52705.mail.yahoo.com>
Date: Fri, 7 Jan 2005 12:29:14 -0800 (PST)
From: Michael <xemc@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1281056899-1105129754=:45464"
Subject: little mistake in nandwrite.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0-1281056899-1105129754=:45464
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline

Hi.
I'm pretty sure I've found a small mistake in 'nandwrite.c'.

Relevant code block:  (mistake is 5 lines in)

        // force oob layout for jffs2 or yaffs ?
        if (forcejffs2 || forceyaffs) {
                struct nand_oobinfo *oobsel = forcejffs2 ?
&jffs2_oobinfo : &yaffs_oobinfo;

                if (forceyaffs && meminfo.oobsize == 8) {
                        if (forceyaffs) {
                                fprintf (stderr, "YAFSS cannot
operate on 256 Byte page size");
                                goto restoreoob;
                        }
                        /* Adjust number of ecc bytes */
                        jffs2_oobinfo.eccbytes = 3;
                }

                if (ioctl (fd, MEMSETOOBSEL, oobsel) != 0) {
                        perror ("MEMSETOOBSEL");
                        goto restoreoob;
                }
        }

Patch is attached.
--0-1281056899-1105129754=:45464
Content-Type: application/octet-stream; name="nandwrite.c_patch"
Content-Transfer-Encoding: base64
Content-Description: nandwrite.c_patch
Content-Disposition: attachment; filename="nandwrite.c_patch"

LS0tIG5hbmR3cml0ZS5jLm9yaWcJMjAwNS0wMS0wNyAxNDoyMjo1NC4wMDAw
MDAwMDAgLTA2MDAKKysrIG5hbmR3cml0ZS5jCTIwMDUtMDEtMDcgMTQ6MjM6
MTAuMDAwMDAwMDAwIC0wNjAwCkBAIC0yNzEsNyArMjcxLDcgQEAKIAlpZiAo
Zm9yY2VqZmZzMiB8fCBmb3JjZXlhZmZzKSB7CiAJCXN0cnVjdCBuYW5kX29v
YmluZm8gKm9vYnNlbCA9IGZvcmNlamZmczIgPyAmamZmczJfb29iaW5mbyA6
ICZ5YWZmc19vb2JpbmZvOwogCQkKLQkJaWYgKGZvcmNleWFmZnMgJiYgbWVt
aW5mby5vb2JzaXplID09IDgpIHsKKwkJaWYgKG1lbWluZm8ub29ic2l6ZSA9
PSA4KSB7CiAgICAgCQkJaWYgKGZvcmNleWFmZnMpIHsKIAkJCQlmcHJpbnRm
IChzdGRlcnIsICJZQUZTUyBjYW5ub3Qgb3BlcmF0ZSBvbiAyNTYgQnl0ZSBw
YWdlIHNpemUiKTsKIAkJCQlnb3RvIHJlc3RvcmVvb2I7Cg==

--0-1281056899-1105129754=:45464--
