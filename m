Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsR06-0005BD-A4
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 03:36:51 +0000
Received: by yhjj56 with SMTP id j56so370952yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 19:36:48 -0800 (PST)
MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <CAN8TOE9pJKD9aznYLDh2Se14og3nn-QHCvjQDXHQu2-dhbVavQ@mail.gmail.com>
References: <CALJbWeoznAvoSzdBp0Kunn+uxqB0XafrLmp7im=49ST340vSjw@mail.gmail.com>
 <CA+55aFzaErfoKG5KEyRMnjHS1=XbA7FNHRhF3J2iR8-m6PqtxQ@mail.gmail.com>
 <CALJbWep4pD69wP76Fcwupw0ppoztOpfHPnv7RvczW06Ko0E4YQ@mail.gmail.com>
 <CA+55aFyquFTUxgtHNRdz-rwha7H2bBocC6hw67a_g0FxG_=95Q@mail.gmail.com>
 <CALJbWeptUqUyVrNZOeQz-toE=akT31L8MLubMj8FKjKy05ppzg@mail.gmail.com>
 <CA+55aFzruneRNt28L5d_fX71-YSGmMXL=4kck_pQbxob4_2+8g@mail.gmail.com>
 <CAN8TOE9pJKD9aznYLDh2Se14og3nn-QHCvjQDXHQu2-dhbVavQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Jan 2012 19:36:25 -0800
Message-ID: <CA+55aFwMinLTj4Jf5D-LHR73vfPLn4EUHooaBGSrsDdrRWsrrw@mail.gmail.com>
Subject: Re: [GIT PULL] logfs: bug fixes
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: multipart/mixed; boundary=20cf30549a1f22a62004b7deca42
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Prasad Joshi <prasadjoshi.linux@gmail.com>,
 =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
 David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--20cf30549a1f22a62004b7deca42
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 31, 2012 at 7:07 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
>
> For your (hopefully temporary) resolution, mtd_can_have_bb() should
> return 1, not 0. Or better yet, do not change mtd_can_have_bb() right
> now. Always returning 0 is interpreted as "the MTD cannot have bad
> blocks," which is dangerous for MTD's that *do* support bad blocks.

Right you are. That was just a thinko on my part.

So together with the point that logfs should have dropped the use of
mtd_can_have_bb(), the fix to that merge should be the attached patch
- at least then things should hopefully work.

That still leaves the question of whether the MTD people want to
change the semantics in other ways. Sorry for the mis-merge,

                       Linus

--20cf30549a1f22a62004b7deca42
Content-Type: text/x-patch; charset=US-ASCII; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gy3sztzq0

IGZzL2xvZ2ZzL2Rldl9tdGQuYyAgICAgIHwgICAgNiAtLS0tLS0KIGluY2x1ZGUvbGludXgvbXRk
L210ZC5oIHwgICAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvbG9nZnMvZGV2X210ZC5jIGIvZnMvbG9nZnMvZGV2
X210ZC5jCmluZGV4IGU5NzQwNGQ2MTFlMC4uOWM1MDE0NDk0NTBkIDEwMDY0NAotLS0gYS9mcy9s
b2dmcy9kZXZfbXRkLmMKKysrIGIvZnMvbG9nZnMvZGV2X210ZC5jCkBAIC0xNTIsOSArMTUyLDYg
QEAgc3RhdGljIHN0cnVjdCBwYWdlICpsb2dmc19tdGRfZmluZF9maXJzdF9zYihzdHJ1Y3Qgc3Vw
ZXJfYmxvY2sgKnNiLCB1NjQgKm9mcykKIAlmaWxsZXJfdCAqZmlsbGVyID0gbG9nZnNfbXRkX3Jl
YWRwYWdlOwogCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gc3VwZXItPnNfbXRkOwogCi0JaWYgKCFt
dGRfY2FuX2hhdmVfYmIobXRkKSkKLQkJcmV0dXJuIE5VTEw7Ci0KIAkqb2ZzID0gMDsKIAl3aGls
ZSAobXRkX2Jsb2NrX2lzYmFkKG10ZCwgKm9mcykpIHsKIAkJKm9mcyArPSBtdGQtPmVyYXNlc2l6
ZTsKQEAgLTE3Miw5ICsxNjksNiBAQCBzdGF0aWMgc3RydWN0IHBhZ2UgKmxvZ2ZzX210ZF9maW5k
X2xhc3Rfc2Ioc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgdTY0ICpvZnMpCiAJZmlsbGVyX3QgKmZp
bGxlciA9IGxvZ2ZzX210ZF9yZWFkcGFnZTsKIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IHN1cGVy
LT5zX210ZDsKIAotCWlmICghbXRkX2Nhbl9oYXZlX2JiKG10ZCkpCi0JCXJldHVybiBOVUxMOwot
CiAJKm9mcyA9IG10ZC0+c2l6ZSAtIG10ZC0+ZXJhc2VzaXplOwogCXdoaWxlIChtdGRfYmxvY2tf
aXNiYWQobXRkLCAqb2ZzKSkgewogCQkqb2ZzIC09IG10ZC0+ZXJhc2VzaXplOwpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9tdGQvbXRkLmggYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAppbmRl
eCAyMjEyOTUyMDhmZDAuLjI2NmU5MGRjZWUzNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9t
dGQvbXRkLmgKKysrIGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKQEAgLTQ4OSw3ICs0ODksNyBA
QCBzdGF0aWMgaW5saW5lIGludCBtdGRfaGFzX29vYihjb25zdCBzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKIAogc3RhdGljIGlubGluZSBpbnQgbXRkX2Nhbl9oYXZlX2JiKGNvbnN0IHN0cnVjdCBtdGRf
aW5mbyAqbXRkKQogewotCXJldHVybiAwOworCXJldHVybiAxOwogfQogCiAJLyogS2VybmVsLXNp
ZGUgaW9jdGwgZGVmaW5pdGlvbnMgKi8K
--20cf30549a1f22a62004b7deca42--
