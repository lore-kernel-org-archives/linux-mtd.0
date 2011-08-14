Received: from m13-9.163.com ([220.181.13.9])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qsc1Q-00015N-Mm
	for linux-mtd@lists.infradead.org; Sun, 14 Aug 2011 14:50:42 +0000
Date: Sun, 14 Aug 2011 22:49:24 +0800 (CST)
From: troy_ct  <troy_ct@163.com>
To: linux-mtd@lists.infradead.org
Message-ID: <e857f43.a835.131c8c4c8b4.Coremail.troy_ct@163.com>
Subject: jffs2 oops
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_161582_2081548053.1313333364911"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_161582_2081548053.1313333364911
Content-Type: multipart/alternative;
	boundary="----=_Part_161584_1729441975.1313333364911"

------=_Part_161584_1729441975.1313333364911
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

Hi,

I did a test like this(smp system):
mount -t jffs2 /dev/mtdblock1 /mnt
mount -t jffs2 /dev/mtdblock2 /tmp
Then I write data to /mnt/file1, /tmp/file2 simultaneously, It's very often to see
a oops says 'comprbuf is NULL in ./fs/jffs2/write.c, line 376'.

In the jffs2 file system menuconfig, I enable the option 'Advanced compression option for JFFS2'.
It turns out that thread A malloc and use the buffer in the jffs2_compressor_list,  at the same time thread B can also use the
same buffer because of spin_unlock(&jffs2_compressor_list_lock).
Thread B get the best buffer pointer and change the best pointer to NULL.  Thread A's best buffer pointer became NULL too, so oops happens.




------=_Part_161584_1729441975.1313333364911
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: 7bit

<div style="line-height:1.7;color:#000000;font-size:14px;font-family:arial">Hi,<br><div style="line-height:1.7;color:#000000;font-size:14px;font-family:arial">I did a test like this(smp system):<br>mount -t jffs2 /dev/mtdblock1 /mnt<br>mount -t jffs2 /dev/mtdblock2 /tmp<br>Then I write data to /mnt/file1, /tmp/file2 simultaneously, It's very often to see<br>a oops says 'comprbuf is NULL in ./fs/jffs2/write.c, line 376'.<br><br>In the jffs2 file system menuconfig, I enable the option 'Advanced compression option for JFFS2'.<br>It turns out that thread A malloc and use the buffer in the jffs2_compressor_list,&nbsp; at the same time thread B can also use the<br>same buffer because of spin_unlock(&amp;jffs2_compressor_list_lock).<br>Thread B get the best buffer pointer and change the best pointer to NULL.&nbsp; Thread A's best buffer pointer became NULL too, so oops happens.<br></div><br><br><span title="neteasefooter"><span id="netease_mail_footer"></span></span></div><br><br><span title="neteasefooter"><span id="netease_mail_footer"></span></span>
------=_Part_161584_1729441975.1313333364911--

------=_Part_161582_2081548053.1313333364911
Content-Type: application/octet-stream;
 name="0001-jffs2-fix-bug-of-jffs2_compressor_list-s-race-condit.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jffs2-fix-bug-of-jffs2_compressor_list-s-race-condit.patch"

RnJvbSBkODk4MDQzNDliYzhhNzNmN2MyMjU0NWVjNjk2MDUxZTc1ZDZhYjRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB0cm95X2N0IDx0cm95X2N0QDE2My5jb20+CkRhdGU6IFN1biwg
MyBKdWwgMjAxMSAwMToyNzoxNCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGpmZnMyOiBmaXggYnVn
IG9mIGpmZnMyX2NvbXByZXNzb3JfbGlzdCdzIHJhY2UgY29uZGl0aW9uCgpXaGVuIHdlIHVzZSBK
RkZTMl9DT01QUl9NT0RFX0ZBVk9VUkxaTyBtb2RlIGZvciBqZmZzMiwgdGhlcmUKYXJlIHJhY2Ug
Y29uZGl0aW9uIG9mIGpmZnMyX2NvbXByZXNzb3JfbGlzdCwgYW5kIGJ1ZmZlcnMgaW4gdGhlCmxp
c3QuIFRoaXMgcGF0Y2ggZml4cyBpdC4KClNpZ25lZC1vZmYtYnk6IHRyb3lfY3QgPHRyb3lfY3RA
MTYzLmNvbT4KLS0tCiBmcy9qZmZzMi9jb21wci5jIHwgICAgNCArKysrCiAxIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9qZmZz
Mi9jb21wci5jIGIvZnMvamZmczIvY29tcHIuYwppbmRleCBkZTQyNDcwLi5iZDk3MjIxIDEwMDY0
NAotLS0gYS9mcy9qZmZzMi9jb21wci5jCisrKyBiL2ZzL2pmZnMyL2NvbXByLmMKQEAgLTE5LDYg
KzE5LDggQEAgc3RhdGljIERFRklORV9TUElOTE9DSyhqZmZzMl9jb21wcmVzc29yX2xpc3RfbG9j
ayk7CiAvKiBBdmFpbGFibGUgY29tcHJlc3NvcnMgYXJlIG9uIHRoaXMgbGlzdCAqLwogc3RhdGlj
IExJU1RfSEVBRChqZmZzMl9jb21wcmVzc29yX2xpc3QpOwogCitzdGF0aWMgREVGSU5FX01VVEVY
KGNvbXByZV9tdXRleCk7CisKIC8qIEFjdHVhbCBjb21wcmVzc2lvbiBtb2RlICovCiBzdGF0aWMg
aW50IGpmZnMyX2NvbXByZXNzaW9uX21vZGUgPSBKRkZTMl9DT01QUl9NT0RFX1BSSU9SSVRZOwog
CkBAIC0xMjAsNiArMTIyLDcgQEAgdWludDE2X3QgamZmczJfY29tcHJlc3Moc3RydWN0IGpmZnMy
X3NiX2luZm8gKmMsIHN0cnVjdCBqZmZzMl9pbm9kZV9pbmZvICpmLAogCQlicmVhazsKIAljYXNl
IEpGRlMyX0NPTVBSX01PREVfU0laRToKIAljYXNlIEpGRlMyX0NPTVBSX01PREVfRkFWT1VSTFpP
OgorCQltdXRleF9sb2NrKCZjb21wcmVfbXV0ZXgpOwogCQlvcmlnX3NsZW4gPSAqZGF0YWxlbjsK
IAkJb3JpZ19kbGVuID0gKmNkYXRhbGVuOwogCQlzcGluX2xvY2soJmpmZnMyX2NvbXByZXNzb3Jf
bGlzdF9sb2NrKTsKQEAgLTE3Niw2ICsxNzksNyBAQCB1aW50MTZfdCBqZmZzMl9jb21wcmVzcyhz
dHJ1Y3QgamZmczJfc2JfaW5mbyAqYywgc3RydWN0IGpmZnMyX2lub2RlX2luZm8gKmYsCiAJCQly
ZXQgPSBiZXN0LT5jb21wcjsKIAkJfQogCQlzcGluX3VubG9jaygmamZmczJfY29tcHJlc3Nvcl9s
aXN0X2xvY2spOworCQltdXRleF91bmxvY2soJmNvbXByZV9tdXRleCk7CiAJCWJyZWFrOwogCWRl
ZmF1bHQ6CiAJCXByaW50ayhLRVJOX0VSUiAiSkZGUzI6IHVua25vd24gY29tcHJlc3Npb24gbW9k
ZS5cbiIpOwotLSAKMS43LjQuMgoK
------=_Part_161582_2081548053.1313333364911--
