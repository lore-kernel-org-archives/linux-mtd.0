Received: from [206.45.72.50] (helo=exchange.iders.ca)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PTMWK-0006cU-BB
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 22:41:57 +0000
From: Scottie Shore <sshore@iders.ca>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: JFFS2 - increase MAX_SUMMARY_SIZE to address warning
Date: Thu, 16 Dec 2010 22:36:31 +0000
Message-ID: <E29897F6386BC843A2912780030A97F31CA0863F@exchange.iders.ca>
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_E29897F6386BC843A2912780030A97F31CA0863Fexchangeidersca_"
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--_002_E29897F6386BC843A2912780030A97F31CA0863Fexchangeidersca_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

We frequently see warnings in dmesg similar to the ones below when using JF=
FS2 on nand flash with 512KiB page size. According to the summary code, thi=
s means that the summary size for a page is over MAX_SUMMARY_SIZE of 64KiB,=
 so the summary is discarded.

JFFS2 warning: (549) jffs2_sum_write_data: Not enough space for summary, pa=
dsize =3D -3208
JFFS2 warning: (549) jffs2_sum_write_data: Not enough space for summary, pa=
dsize =3D -3352

The comments with MAX_SUMMARY_SIZE say that 64KiB was chosen so that kmallo=
c can be used, however other sources say that kmalloc can allocate up to 12=
8KiB. I've updated MAX_SUMMARY_SIZE to 128KiB according to the attached pat=
ch and tested on our hardware for about a week with frequent heavy read/wri=
te cycles. So far I've encountered no problems, and no further warnings. I'=
m concerned that a fix this easy may be wrong in a non-obvious way, though.

Are there platforms where this change would not work?
Does this change cause problems that might not be immediately visible?
If there's no concerns about same, could the patch be applied to the mainli=
ne code?

Regards,

Scottie Shore
Iders, Inc.
<html>
<body>
Scottie Shore Embedded Software Developer Iders Incorporated 27047 Oakwood =
Road Oakbank, MB R0E 1J2 Tel (204) 444-5200 ext 282 Fax: (204) 444-5900 [ht=
tp://www.iders.ca/IDERS_logo.jpg] ________________________________ Iders In=
corporated Confidential: ________________________________
 This message is intended solely for the use of the designated recipient(s)=
 and their appointed delegates, and may contain confidential information. A=
ny unauthorized disclosure, copying or distribution of its contents is stri=
ctly prohibited. If you have received
 this message in error, please destroy it and advise the sender immediately=
 by phone, Email or facsimile.
</body>
</html>

--_002_E29897F6386BC843A2912780030A97F31CA0863Fexchangeidersca_
Content-Type: text/x-patch; name="jffs2-summary.patch"
Content-Description: jffs2-summary.patch
Content-Disposition: attachment; filename="jffs2-summary.patch"; size=602;
	creation-date="Thu, 16 Dec 2010 22:19:53 GMT";
	modification-date="Thu, 16 Dec 2010 22:19:53 GMT"
Content-Transfer-Encoding: base64

LS0tIHN1bW1hcnkuaAkyMDEwLTEyLTE2IDE1OjI2OjE5LjM3OTQwOTIyMiAtMDYwMAorKysgc3Vt
bWFyeS5oCTIwMDktMDktMjIgMTE6MTk6MTEuMDAwMDAwMDAwIC0wNTAwCkBAIC0xMywxMSArMTMs
MTEgQEAKICNpZm5kZWYgSkZGUzJfU1VNTUFSWV9ICiAjZGVmaW5lIEpGRlMyX1NVTU1BUllfSAog
Ci0vKiBMaW1pdCBzdW1tYXJ5IHNpemUgdG8gMTI4S2lCIHNvIHRoYXQgd2UgY2FuIGttYWxsb2Mg
aXQuIElmIHRoZSBzdW1tYXJ5CisvKiBMaW1pdCBzdW1tYXJ5IHNpemUgdG8gNjRLaUIgc28gdGhh
dCB3ZSBjYW4ga21hbGxvYyBpdC4gSWYgdGhlIHN1bW1hcnkKICAgIGlzIGxhcmdlciB0aGFuIHRo
YXQsIHdlIGhhdmUgdG8ganVzdCBkaXRjaCBpdCBhbmQgYXZvaWQgdXNpbmcgc3VtbWFyeQogICAg
Zm9yIHRoZSBlcmFzZWJsb2NrIGluIHF1ZXN0aW9uLi4uIGFuZCBpdCBwcm9iYWJseSBkb2Vzbid0
IGh1cnQgdXMgbXVjaAogICAgYW55d2F5LiAqLwotI2RlZmluZSBNQVhfU1VNTUFSWV9TSVpFIDEz
MTA3MgorI2RlZmluZSBNQVhfU1VNTUFSWV9TSVpFIDY1NTM2CiAKICNpbmNsdWRlIDxsaW51eC91
aW8uaD4KICNpbmNsdWRlIDxsaW51eC9qZmZzMi5oPgo=

--_002_E29897F6386BC843A2912780030A97F31CA0863Fexchangeidersca_--
