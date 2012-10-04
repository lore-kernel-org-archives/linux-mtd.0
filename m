Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TJmHl-0006lW-V2
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 14:20:23 +0000
In-Reply-To: <OF930A0EE5.DA214D86-ONC1257A8B.00673BC9-C1257A8B.0067E92C@transmode.se>
References: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
 <OF52EBAA51.F623F8FB-ONC1257A8B.005B88EA-C1257A8B.005BD53C@transmode.se>
 <OFF2FAA55C.4813D4C0-ONC1257A8B.0060F9EA-C1257A8B.00634CA4@transmode.se>
 <OF930A0EE5.DA214D86-ONC1257A8B.00673BC9-C1257A8B.0067E92C@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
MIME-Version: 1.0
Subject: Re: JFFS2 deadlock, kernel 3.4.11
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFD47DAD5E.85DB9677-ONC1257A8D.003FBACE-C1257A8D.004EC32A@rohde-schwarz.com>
Date: Thu, 4 Oct 2012 16:20:16 +0200
Content-Type: multipart/mixed; boundary="=_mixed 004EC2E3C1257A8D_="
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=_mixed 004EC2E3C1257A8D_=
Content-Type: text/plain; charset="US-ASCII"

Hello Joakim,

(sorry if the indentation is wrong, I have not yet found out how to do 
this in Lotus Notes):

[Joakim Tjernlund]
So maybe this will help(not even compile tested), don't know if 
jffs2_reserve_space()
can be called with f->sem held.
If this is bad, then perhaps move pg = 
grab_cache_page_write_begin(mapping, index, flags)
to later in this function somehow?
[/Joakim Tjernlund]

jffs2_reserve_space() must not be called with f->sem held because it 
acquires c->alloc_sem.

So I have moved mutex_lock(&f->sem) and grab_cache_page_write_begin() 
after jffs2_reserve_space(). Attached is my 3.4.11 patch (which is based 
on your patch) for review; I hope it is not mangled by Lotus Notes ...

The first tests (with proof of locking correctness enabled) were fine. The 
main tests will run until tomorrow evening, though; last time, it took me 
all day to reproduce the deadlock, and I want to be reasonably sure that 
it is gone -- and that no new deadlocks were introduced.

Best regards,
Thomas


--=_mixed 004EC2E3C1257A8D_=
Content-Type: application/octet-stream; name="jffs2_write_begin.patch"
Content-Disposition: attachment; filename="jffs2_write_begin.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtTmF1ciBsaW51eC0zLjQuMTEtb3JpZy9mcy9qZmZzMi9maWxlLmMgbGludXgtMy40LjEx
L2ZzL2pmZnMyL2ZpbGUuYwotLS0gbGludXgtMy40LjExLW9yaWcvZnMvamZmczIvZmlsZS5jCTIw
MTItMDktMTQgMjI6MTg6NTUuMDAwMDAwMDAwICswMDAwCisrKyBsaW51eC0zLjQuMTEvZnMvamZm
czIvZmlsZS5jCTIwMTItMTAtMDQgMTI6MTM6NTIuMDAwMDAwMDAwICswMDAwCkBAIC0xNDIsMTEg
KzE0Miw2IEBACiAJdWludDMyX3QgcGFnZW9mcyA9IGluZGV4IDw8IFBBR0VfQ0FDSEVfU0hJRlQ7
CiAJaW50IHJldCA9IDA7CiAKLQlwZyA9IGdyYWJfY2FjaGVfcGFnZV93cml0ZV9iZWdpbihtYXBw
aW5nLCBpbmRleCwgZmxhZ3MpOwotCWlmICghcGcpCi0JCXJldHVybiAtRU5PTUVNOwotCSpwYWdl
cCA9IHBnOwotCiAJamZmczJfZGJnKDEsICIlcygpXG4iLCBfX2Z1bmNfXyk7CiAKIAlpZiAocGFn
ZW9mcyA+IGlub2RlLT5pX3NpemUpIHsKQEAgLTE2Miw5ICsxNTcsMTkgQEAKIAkJcmV0ID0gamZm
czJfcmVzZXJ2ZV9zcGFjZShjLCBzaXplb2YocmkpLCAmYWxsb2NfbGVuLAogCQkJCQkgIEFMTE9D
X05PUk1BTCwgSkZGUzJfU1VNTUFSWV9JTk9ERV9TSVpFKTsKIAkJaWYgKHJldCkKLQkJCWdvdG8g
b3V0X3BhZ2U7CisJCQlyZXR1cm4gcmV0OwogCisJCS8qIE11c3Qgbm90IGNhbGwgamZmczJfcmVz
ZXJ2ZV9zcGFjZSgpIHdpdGggZi0+c2VtIGhlbGQuCisJCSAqIE11c3QgbG9jayBmLT5zZW0gYmVm
b3JlIHBhZ2VfbG9jaygpLiAqLwogCQltdXRleF9sb2NrKCZmLT5zZW0pOworCQlwZyA9IGdyYWJf
Y2FjaGVfcGFnZV93cml0ZV9iZWdpbihtYXBwaW5nLCBpbmRleCwgZmxhZ3MpOworCQlpZiAoIXBn
KSB7CisJCQlqZmZzMl9jb21wbGV0ZV9yZXNlcnZhdGlvbihjKTsKKwkJCW11dGV4X3VubG9jaygm
Zi0+c2VtKTsKKwkJCXJldHVybiAtRU5PTUVNOworCQl9CisJCSpwYWdlcCA9IHBnOworCiAJCW1l
bXNldCgmcmksIDAsIHNpemVvZihyaSkpOwogCiAJCXJpLm1hZ2ljID0gY3B1X3RvX2plMTYoSkZG
UzJfTUFHSUNfQklUTUFTSyk7CkBAIC0xOTEsNyArMTk2LDYgQEAKIAkJaWYgKElTX0VSUihmbikp
IHsKIAkJCXJldCA9IFBUUl9FUlIoZm4pOwogCQkJamZmczJfY29tcGxldGVfcmVzZXJ2YXRpb24o
Yyk7Ci0JCQltdXRleF91bmxvY2soJmYtPnNlbSk7CiAJCQlnb3RvIG91dF9wYWdlOwogCQl9CiAJ
CXJldCA9IGpmZnMyX2FkZF9mdWxsX2Rub2RlX3RvX2lub2RlKGMsIGYsIGZuKTsKQEAgLTIwNiwx
MiArMjEwLDE5IEBACiAJCQlqZmZzMl9tYXJrX25vZGVfb2Jzb2xldGUoYywgZm4tPnJhdyk7CiAJ
CQlqZmZzMl9mcmVlX2Z1bGxfZG5vZGUoZm4pOwogCQkJamZmczJfY29tcGxldGVfcmVzZXJ2YXRp
b24oYyk7Ci0JCQltdXRleF91bmxvY2soJmYtPnNlbSk7CiAJCQlnb3RvIG91dF9wYWdlOwogCQl9
CiAJCWpmZnMyX2NvbXBsZXRlX3Jlc2VydmF0aW9uKGMpOwogCQlpbm9kZS0+aV9zaXplID0gcGFn
ZW9mczsKLQkJbXV0ZXhfdW5sb2NrKCZmLT5zZW0pOworCX0KKwllbHNlIHsKKwkJbXV0ZXhfbG9j
aygmZi0+c2VtKTsKKwkJcGcgPSBncmFiX2NhY2hlX3BhZ2Vfd3JpdGVfYmVnaW4obWFwcGluZywg
aW5kZXgsIGZsYWdzKTsKKwkJaWYgKCFwZykgeworCQkJbXV0ZXhfdW5sb2NrKCZmLT5zZW0pOwor
CQkJcmV0dXJuIC1FTk9NRU07CisJCX0KKwkJKnBhZ2VwID0gcGc7CiAJfQogCiAJLyoKQEAgLTIy
MCwxOCArMjMxLDE4IEBACiAJICogY2FzZSBvZiBhIHNob3J0LWNvcHkuCiAJICovCiAJaWYgKCFQ
YWdlVXB0b2RhdGUocGcpKSB7Ci0JCW11dGV4X2xvY2soJmYtPnNlbSk7CiAJCXJldCA9IGpmZnMy
X2RvX3JlYWRwYWdlX25vbG9jayhpbm9kZSwgcGcpOwotCQltdXRleF91bmxvY2soJmYtPnNlbSk7
CiAJCWlmIChyZXQpCiAJCQlnb3RvIG91dF9wYWdlOwogCX0KKwltdXRleF91bmxvY2soJmYtPnNl
bSk7CiAJamZmczJfZGJnKDEsICJlbmQgd3JpdGVfYmVnaW4oKS4gcGctPmZsYWdzICVseFxuIiwg
cGctPmZsYWdzKTsKIAlyZXR1cm4gcmV0OwogCiBvdXRfcGFnZToKIAl1bmxvY2tfcGFnZShwZyk7
CiAJcGFnZV9jYWNoZV9yZWxlYXNlKHBnKTsKKwltdXRleF91bmxvY2soJmYtPnNlbSk7CiAJcmV0
dXJuIHJldDsKIH0KIAo=

--=_mixed 004EC2E3C1257A8D_=--
