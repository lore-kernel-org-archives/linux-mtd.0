Received: from bay17-f6.bay17.hotmail.com ([64.4.43.56] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DvXYV-00047e-LJ
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2005 05:41:37 -0400
Message-ID: <BAY17-F686BFC9A870BA327E73B7E8D60@phx.gbl>
From: =?gb2312?B?1dQgtrm2uQ==?= <zhao_fusheng@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 21 Jul 2005 17:23:26 +0800
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_60ab_4c3c_2bf8"
Subject: [PATCH]fix the RWCOMPAT_COPY handling in mount scan of JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_60ab_4c3c_2bf8
Content-Type: text/plain; charset=gb2312; format=flowed

Hi,

This patch fix the current wrong handling of RWCOMPAT_COPY
node in mount scan of JFFS2.

Thanks,
Forrest

_________________________________________________________________
享用世界上最大的电子邮件系统— MSN Hotmail。  http://www.hotmail.com  

------=_NextPart_000_60ab_4c3c_2bf8
Content-Type: application/octet-stream; name="rwcomat_copy.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="rwcomat_copy.patch"

LS0tIHNjYW4uYy5iYWsJMjAwNS0wNy0yMiAwMTowMToxOC40NzE2MTU3MjAg
KzA4MDAKKysrIHNjYW4uYwkyMDA1LTA3LTIyIDAwOjU5OjA1LjM0Mzg1NDIx
NiArMDgwMApAQCAtNjA4LDEwICs2MDgsMjkgQEAgc2Nhbl9tb3JlOgkKIAkJ
CQlicmVhazsKIAogCQkJY2FzZSBKRkZTMl9GRUFUVVJFX1JXQ09NUEFUX0NP
UFk6CisJCQl7CisJCQkJc3RydWN0IGpmZnMyX3Jhd19ub2RlX3JlZiAqcmVm
OwogCQkJCUQxKHByaW50ayhLRVJOX05PVElDRSAiVW5rbm93biBidXQgY29t
cGF0aWJsZSBmZWF0dXJlIG5vZGUgKDB4JTA0eCkgZm91bmQgYXQgb2Zmc2V0
IDB4JTA4eFxuIiwgamUxNl90b19jcHUobm9kZS0+bm9kZXR5cGUpLCBvZnMp
KTsKKworCQkJCXJlZiA9IGpmZnMyX2FsbG9jX3Jhd19ub2RlX3JlZigpOwor
CQkJCWlmICghcmVmKSB7CisJCQkJCXByaW50ayhLRVJOX05PVElDRSAiRmFp
bGVkIHRvIGFsbG9jYXRlIG5vZGUgcmVmIGZvciBSV0NPTVBBVF9DT1BZIG5v
ZGVcbiIpOworCQkJCQlyZXR1cm4gLUVOT01FTTsKKwkJCQl9CisJCQkJcmVm
LT5uZXh0X2luX2lubyA9IE5VTEw7CisJCQkJcmVmLT5uZXh0X3BoeXMgPSBO
VUxMOworCQkJCXJlZi0+Zmxhc2hfb2Zmc2V0ID0gb2ZzIHwgUkVGX1BSSVNU
SU5FOworCQkJCXJlZi0+X190b3RsZW4gPSBQQUQoamUzMl90b19jcHUobm9k
ZS0+dG90bGVuKSk7CisJCQkJaWYgKCFqZWItPmZpcnN0X25vZGUpCisJCQkJ
CWplYi0+Zmlyc3Rfbm9kZSA9IHJlZjsKKwkJCQlpZiAoamViLT5sYXN0X25v
ZGUpCisJCQkJCWplYi0+bGFzdF9ub2RlLT5uZXh0X3BoeXMgPSByZWY7CisJ
CQkJamViLT5sYXN0X25vZGUgPSByZWY7CiAJCQkJVVNFRF9TUEFDRShQQUQo
amUzMl90b19jcHUobm9kZS0+dG90bGVuKSkpOwogCQkJCW9mcyArPSBQQUQo
amUzMl90b19jcHUobm9kZS0+dG90bGVuKSk7CiAJCQkJYnJlYWs7CisKKwkJ
CX0KIAkJCX0KIAkJfQogCX0K


------=_NextPart_000_60ab_4c3c_2bf8--
