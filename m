Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TB3aI-0004T1-7w
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2012 12:59:27 +0000
Received: by lagu2 with SMTP id u2so1069871lag.36
 for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2012 05:59:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN0F+aUuBUWN0_VMZ3rzPc5VNNDSLKivnFkW=32Cbi8eCf2QHA@mail.gmail.com>
References: <CAN0F+aWY_3GC4Arj+Zj97RJhy-7C7TT0dP2gERw=-WD3vhd6Sg@mail.gmail.com>
 <CACQ1gAgqBS-v5hSD5Lt7wWVzSC9BEiAfUU83uviBta63yWoAVQ@mail.gmail.com>
 <CAN0F+aUuBUWN0_VMZ3rzPc5VNNDSLKivnFkW=32Cbi8eCf2QHA@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 10 Sep 2012 14:59:02 +0200
Message-ID: <CACQ1gAg_s8S8V5AWN4pR9XKqctyeYZpW_mtD3XczDde5Y+9Y4A@mail.gmail.com>
Subject: Re: lseek32 and lseek64
To: Cheney Chen <cheneychencl2012@gmail.com>
Content-Type: multipart/mixed; boundary=f46d0408d7efe36fb304c9588687
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--f46d0408d7efe36fb304c9588687
Content-Type: text/plain; charset=UTF-8

2012/9/10 Cheney Chen <cheneychencl2012@gmail.com>:
> You are right. ubiformat is used on mtd devices. This bug was found a few
> month ago, now I'm available and this bug is reported. But I make a mistake
> for ubiformat /dev/ubi0_0. I just retry it again and print some log for you.
>
> # mtd utility original file's bin
> # ./ubiformat /dev/mtd/mtd13
> ubiformat: mtd13 (nand), size 6375342080 bytes (5.9 GiB), 1520 eraseblocks
> of 4194304 bytes (4.0 MiB), min. I/O size 16384 bytes
> libscan: scanning eraseblock 512 -- 33 % complete  libmtd: error!: cannot
> seek mtd13 to offset 18446744071562067968
>         error 22 (Invalid argument)
> ubiformat: error!: failed to scan mtd13 (/dev/mtd/mtd13)
>
> # add my patch as bin
> # ./ubiformat /dev/mtd/mtd13
> ubiformat: mtd13 (nand), size 6375342080 bytes (5.9 GiB), 1520 eraseblocks
> of 4194304 bytes (4.0 MiB), min. I/O size 16384 bytes
> libscan: scanning eraseblock 1519 -- 100 % complete
> ubiformat: 1495 eraseblocks are supposedly empty
> ubiformat: 22 bad eraseblocks found, numbers: 166, 313, 359, 556, 623, 624,
> 625, 626, 627, 628, 877, 1313, 1317, 1353, 1512, 1513, 1514, 1515
> , 1516, 1517, 1518, 1519
> ubiformat: warning!: 3 of 1498 eraseblocks contain non-ubifs data
> ubiformat: continue? (yes/no)  yes
> ubiformat: warning!: only 0 of 1498 eraseblocks have valid erase counter
> ubiformat: erase counter 0 will be used for all eraseblocks
> ubiformat: note, arbitrary erase counter value may be specified using -e
> option
> ubiformat: continue? (yes/no)  yes
> ubiformat: use erase counter 0 for all eraseblocks
> ubiformat: formatting eraseblock 1519 -- 100 % complete
>
> The attachment is my patch as a reference.

Please, cc the linux-mtd ML in your emails.

I had a look at your patch, and maybe something like that is better:
diff --git a/ubi-utils/libubigen.c b/ubi-utils/libubigen.c
index 9eaa7f5..d2a949b 100644
--- a/ubi-utils/libubigen.c
+++ b/ubi-utils/libubigen.c
@@ -279,7 +279,7 @@ int ubigen_write_layout_vol(const struct
ubigen_info *ui, int peb1, int peb2,
 	memset(outbuf + ui->data_offs + ui->vtbl_size, 0xFF,
 	       ui->peb_size - ui->data_offs - ui->vtbl_size);

-	seek = peb1 * ui->peb_size;
+	seek = (off_t) peb1 * ui->peb_size;
 	if (lseek(fd, seek, SEEK_SET) != seek) {
 		sys_errmsg("cannot seek output file");
 		goto out_free;
@@ -293,7 +293,7 @@ int ubigen_write_layout_vol(const struct
ubigen_info *ui, int peb1, int peb2,
 		goto out_free;
 	}

-	seek = peb2 * ui->peb_size;
+	seek = (off_t) peb2 * ui->peb_size;
 	if (lseek(fd, seek, SEEK_SET) != seek) {
 		sys_errmsg("cannot seek output file");
 		goto out_free;

because off_t is 64bits if _FILE_OFFSET_BITS=64, wich is the case by
default in common.mk
could you test it ?

--f46d0408d7efe36fb304c9588687
Content-Type: application/octet-stream; name="utils.patch"
Content-Disposition: attachment; filename="utils.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h6xii4wi1

ZGlmZiAtcnVOYSBvbGRfdWJpX3V0aWxzL2xpYnViaWdlbi5jIHViaS11dGlscy9saWJ1YmlnZW4u
YwotLS0gb2xkX3ViaV91dGlscy9saWJ1YmlnZW4uYwkyMDEyLTA5LTEwIDE5OjI2OjEwLjc4MTAw
MDYyMCArMDgwMAorKysgdWJpLXV0aWxzL2xpYnViaWdlbi5jCTIwMTItMDktMTAgMTk6MjY6MTku
NjUyOTk4MzgzICswODAwCkBAIC0yNTUsNyArMjU1LDcgQEAKIAlzdHJ1Y3QgdWJpZ2VuX3ZvbF9p
bmZvIHZpOwogCWNoYXIgKm91dGJ1ZjsKIAlzdHJ1Y3QgdWJpX3ZpZF9oZHIgKnZpZF9oZHI7Ci0J
b2ZmX3Qgc2VlazsKKwl1aW50NjRfdCBzZWVrOwogCiAJdmkuYnl0ZXMgPSB1aS0+bGViX3NpemUg
KiBVQklfTEFZT1VUX1ZPTFVNRV9FQlM7CiAJdmkuaWQgPSBVQklfTEFZT1VUX1ZPTFVNRV9JRDsK
QEAgLTI3OSw4ICsyNzksOCBAQAogCW1lbXNldChvdXRidWYgKyB1aS0+ZGF0YV9vZmZzICsgdWkt
PnZ0Ymxfc2l6ZSwgMHhGRiwKIAkgICAgICAgdWktPnBlYl9zaXplIC0gdWktPmRhdGFfb2ZmcyAt
IHVpLT52dGJsX3NpemUpOwogCi0Jc2VlayA9IHBlYjEgKiB1aS0+cGViX3NpemU7Ci0JaWYgKGxz
ZWVrKGZkLCBzZWVrLCBTRUVLX1NFVCkgIT0gc2VlaykgeworCXNlZWsgPSAodWludDY0X3QpcGVi
MSAqIHVpLT5wZWJfc2l6ZTsKKwlpZiAobHNlZWs2NChmZCwgc2VlaywgU0VFS19TRVQpICE9IHNl
ZWspIHsKIAkJc3lzX2Vycm1zZygiY2Fubm90IHNlZWsgb3V0cHV0IGZpbGUiKTsKIAkJZ290byBv
dXRfZnJlZTsKIAl9CkBAIC0yOTMsOCArMjkzLDggQEAKIAkJZ290byBvdXRfZnJlZTsKIAl9CiAK
LQlzZWVrID0gcGViMiAqIHVpLT5wZWJfc2l6ZTsKLQlpZiAobHNlZWsoZmQsIHNlZWssIFNFRUtf
U0VUKSAhPSBzZWVrKSB7CisJc2VlayA9ICh1aW50NjRfdClwZWIyICogdWktPnBlYl9zaXplOwor
CWlmIChsc2VlazY0KGZkLCBzZWVrLCBTRUVLX1NFVCkgIT0gc2VlaykgewogCQlzeXNfZXJybXNn
KCJjYW5ub3Qgc2VlayBvdXRwdXQgZmlsZSIpOwogCQlnb3RvIG91dF9mcmVlOwogCX0KZGlmZiAt
cnVOYSBvbGRfdWJpX3V0aWxzL3ViaW5pemUuYyB1YmktdXRpbHMvdWJpbml6ZS5jCi0tLSBvbGRf
dWJpX3V0aWxzL3ViaW5pemUuYwkyMDEyLTA5LTEwIDE5OjI2OjEwLjgwOTAwMDYxNSArMDgwMAor
KysgdWJpLXV0aWxzL3ViaW5pemUuYwkyMDEyLTA5LTEwIDE5OjI2OjE5LjY1Mjk5ODM4MyArMDgw
MApAQCAtNDU2LDcgKzQ1Niw3IEBACiAJc3RydWN0IHViaWdlbl9pbmZvIHVpOwogCXN0cnVjdCB1
YmlfdnRibF9yZWNvcmQgKnZ0Ymw7CiAJc3RydWN0IHViaWdlbl92b2xfaW5mbyAqdmk7Ci0Jb2Zm
X3Qgc2VlazsKKwl1aW50NjRfdCBzZWVrOwogCiAJZXJyID0gcGFyc2Vfb3B0KGFyZ2MsIGFyZ3Yp
OwogCWlmIChlcnIpCkBAIC01MTcsOCArNTE3LDggQEAKIAkgKiBTa2lwIDIgUEVCcyBhdCB0aGUg
YmVnaW5uaW5nIG9mIHRoZSBmaWxlIGZvciB0aGUgdm9sdW1lIHRhYmxlIHdoaWNoCiAJICogd2ls
bCBiZSB3cml0dGVuIGxhdGVyLgogCSAqLwotCXNlZWsgPSB1aS5wZWJfc2l6ZSAqIDI7Ci0JaWYg
KGxzZWVrKGFyZ3Mub3V0X2ZkLCBzZWVrLCBTRUVLX1NFVCkgIT0gc2VlaykgeworCXNlZWsgPSAo
dWludDY0X3QpdWkucGViX3NpemUgKiAyOworCWlmIChsc2VlazY0KGFyZ3Mub3V0X2ZkLCBzZWVr
LCBTRUVLX1NFVCkgIT0gc2VlaykgewogCQlzeXNfZXJybXNnKCJjYW5ub3Qgc2VlayBmaWxlIFwi
JXNcIiIsIGFyZ3MuZl9vdXQpOwogCQlnb3RvIG91dF9mcmVlOwogCX0K
--f46d0408d7efe36fb304c9588687--
