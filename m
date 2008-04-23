Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoanH-0002PI-Rn
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 08:57:36 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1974598wff.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 01:57:34 -0700 (PDT)
Message-ID: <15577be70804230157g35941393m599fd5fc2ad895c3@mail.gmail.com>
Date: Wed, 23 Apr 2008 10:57:34 +0200
From: "Abel Bernabeu" <abel.bernabeu@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: PATCH: solving a hang while waiting in FL_STATUS
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_9501_14189474.1208941054867"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_9501_14189474.1208941054867
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am experimenting an infinite loop problem happening at
cfi_cmdset_0001.c:chip_ready.

Some kind of timeout while waiting  in FL_STATUS should be included.
Indeed, this timeout feature is not new at all.

The feature was present in 2.6.23.17 but disappeared in 2.6.24 (after
some refactoring work easily perceptible).

The present patch restores the "lost functionality" and solves my
problem. Please consider the patch to be included in the mtd code.

Yours, Abel.

------=_Part_9501_14189474.1208941054867
Content-Type: text/x-patch; name=chip_ready.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ffdoa849
Content-Disposition: attachment; filename=chip_ready.patch

LS0tIGxpbnV4LTIuNi4yNS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYwkyMDA4
LTA0LTE3IDA0OjQ5OjQ0LjAwMDAwMDAwMCArMDIwMAorKysgbGludXgtMi42LjI1LmhhY2tlZC9k
cml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYwkyMDA4LTA0LTIzIDEwOjI3OjEyLjAw
MDAwMDAwMCArMDIwMApAQCAtNzEyLDYgKzcxMiwxMiBAQAogCQkJaWYgKGNoaXAtPnByaXYgJiYg
bWFwX3dvcmRfYW5kZXF1YWwobWFwLCBzdGF0dXMsIHN0YXR1c19QV1MsIHN0YXR1c19QV1MpKQog
CQkJCWJyZWFrOwogCisJCQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1lbykpIHsKKwkJCQlw
cmludGsoS0VSTl9FUlIgIiVzOiBXYWl0aW5nIGZvciBjaGlwIHRvIGJlIHJlYWR5IHRpbWVkIG91
dC4gU3RhdHVzICVseFxuIiwKKwkJCQkJbWFwLT5uYW1lLCBzdGF0dXMueFswXSk7CisJCQkJcmV0
dXJuIC1FSU87CisJCQl9CisKIAkJCXNwaW5fdW5sb2NrKGNoaXAtPm11dGV4KTsKIAkJCWNmaV91
ZGVsYXkoMSk7CiAJCQlzcGluX2xvY2soY2hpcC0+bXV0ZXgpOwo=
------=_Part_9501_14189474.1208941054867--
