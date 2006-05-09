Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FdUnx-0000Qy-NI
	for linux-mtd@lists.infradead.org; Tue, 09 May 2006 12:11:30 -0400
Message-ID: <4460BEEE.2070704@ak.jp.nec.com>
Date: Wed, 10 May 2006 01:10:22 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <445C476A.2090506@ak.jp.nec.com>	<20060507171601.GA7990@wohnheim.fh-wedel.de>	<445EA6D4.5000909@ak.jp.nec.com>
	<1147092567.2766.146.camel@pmac.infradead.org>
In-Reply-To: <1147092567.2766.146.camel@pmac.infradead.org>
Content-Type: multipart/mixed; boundary="------------050407070604080008020801"
Cc: jmorris@redhat.com, KaiGai Kohei <kaigai@ak.jp.nec.com>,
	russell@coker.com.au, lorenzo@gnu.org,
	linux-mtd@lists.infradead.org, sds@tycho.nsa.gov,
	=?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050407070604080008020801
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Some fixes and updates on the todo list are already
pushed to git://git.infradead.org/jffs2-xattr-2.6.git .

The broken-out patches are available at here:
http://www.kaigai.gr.jp/index.php?FrontPage#vd169842

01. jffs2-xattr-v5.1-01-remove_typedef_kernel.patch
02. jffs2-xattr-v5.1-02-remove_typedef_utils.patch
03. jffs2-xattr-v5.1-03-append_README.Locking.patch
04. jffs2-xattr-v5.1-04-remove_ilist_from_ic.patch
05. jffs2-xattr-v5.1-05-update_xattr_gc.patch
06. jffs2-xattr-v5.1-06-add_list.h.patch
07. jffs2-xattr-v5.1-07-unify_file_header.patch
08. jffs2-xattr-v5.1-08-remove_senseless_comment.patch
09. jffs2-xattr-v5.1-09-remove__KERNEL__.patch
10. jffs2-xattr-v5.1-10-remove_pointer_cast.patch

I hope to merge the second patch (jffs2-xattr-v5.1-02-remove_typedef_utils.patch),
because this patch is for mtd-utils.git, not jffs2-xattr-2.6.git.

P.S.
Thanks David for your introduction about git on infradead.org.

David Woodhouse wrote:
> On Mon, 2006-05-08 at 11:03 +0900, KaiGai Kohei wrote:
> 
>>[Current TODO list]
>>* Fix the declaration of jffs2_acl_header and so on by using 'struct'
>>   instead of 'typedef' in kernel space.
>>- Fix the declaration of jffs2_acl_header and so on by using 'struct'
>>   instead of 'typedef' in user space header.
>>* Add documentation about xattr_sem into README.Locking.
>>* Call jffs2_garbage_collect_xattr_datum/ref() from gc.c directly
>>   instead of jffs2_garbage_collect_xattr()
>>- Use unidirection list beween inode_chache and xattr_ref, instead of
>>   list_head.
>>- Add '#include <linux/list.h>' into xattr.h.
>>- Unify each file header part with any jffs2 files.
>>- Remove a senseless comment. ("/* forward refence */")
>>- Remove unneccesary pointer casts.
>>- Remove unneccesary '#ifdef __KERNEL__' on acl.h
>>
>>*: It has already prepared, but I've not publicated yet.
>>-: It has not prepated yet. I should work from now. 
> 
> 
> That's an excellent summary; thanks. It does serve to show that we've
> mostly picked on cosmetic details so far though :)
> 
> If you have patches committed into a git tree, you should be able to
> just 'git-push ssh://git.infradead.org/home/git/jffs2-xattr-2.6.git' to
> make it available.
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>

--------------050407070604080008020801
Content-Type: text/plain; name="jffs2-xattr-v5.1-02-remove_typedef_utils.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
	filename="jffs2-xattr-v5.1-02-remove_typedef_utils.patch"

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbXRkL2pmZnMyLXVzZXIuaCBiL2luY2x1ZGUvbXRkL2pm
ZnMyLXVzZXIuaAppbmRleCA4YjUzOTkwLi5iYzVkOTlhIDEwMDY0NAotLS0gYS9pbmNsdWRl
L210ZC9qZmZzMi11c2VyLmgKKysrIGIvaW5jbHVkZS9tdGQvamZmczItdXNlci5oCkBAIC01
MCwzMyArNTAsMzMgQEAgZXh0ZXJuIGludCB0YXJnZXRfZW5kaWFuOwogI2RlZmluZSBYQVRU
Ul9UUlVTVEVEX1BSRUZJWAkJInRydXN0ZWQuIgogI2RlZmluZSBYQVRUUl9UUlVTVEVEX1BS
RUZJWF9MRU4JKHNpemVvZiAoWEFUVFJfVFJVU1RFRF9QUkVGSVgpIC0gMSkKIAotdHlwZWRl
ZiBzdHJ1Y3Qgeworc3RydWN0IGpmZnMyX2FjbF9lbnRyeSB7CiAJamludDE2X3QJZV90YWc7
CiAJamludDE2X3QJZV9wZXJtOwogCWppbnQzMl90CWVfaWQ7Ci19IGpmZnMyX2FjbF9lbnRy
eTsKK307CiAKLXR5cGVkZWYgc3RydWN0IHsKK3N0cnVjdCBqZmZzMl9hY2xfZW50cnlfc2hv
cnQgewogCWppbnQxNl90CWVfdGFnOwogCWppbnQxNl90CWVfcGVybTsKLX0gamZmczJfYWNs
X2VudHJ5X3Nob3J0OworfTsKIAotdHlwZWRlZiBzdHJ1Y3Qgeworc3RydWN0IGpmZnMyX2Fj
bF9oZWFkZXIgewogCWppbnQzMl90CWFfdmVyc2lvbjsKLX0gamZmczJfYWNsX2hlYWRlcjsK
K307CiAKIC8qIGNvcGllZCBmcm9tIGluY2x1ZGUvbGludXgvcG9zaXhfYWNsX3hhdHRyLmgg
Ki8KICNkZWZpbmUgUE9TSVhfQUNMX1hBVFRSX1ZFUlNJT04gMHgwMDAyCiAKLXR5cGVkZWYg
c3RydWN0IHsKK3N0cnVjdCBwb3NpeF9hY2xfeGF0dHJfZW50cnkgewogCXVpbnQxNl90CQll
X3RhZzsKIAl1aW50MTZfdAkJZV9wZXJtOwogCXVpbnQzMl90CQllX2lkOwotfSBwb3NpeF9h
Y2xfeGF0dHJfZW50cnk7Cit9OwogCi10eXBlZGVmIHN0cnVjdCB7Ci0JdWludDMyX3QJCWFf
dmVyc2lvbjsKLQlwb3NpeF9hY2xfeGF0dHJfZW50cnkJYV9lbnRyaWVzWzBdOwotfSBwb3Np
eF9hY2xfeGF0dHJfaGVhZGVyOworc3RydWN0IHBvc2l4X2FjbF94YXR0cl9oZWFkZXIgewor
CXVpbnQzMl90CQkJYV92ZXJzaW9uOworCXN0cnVjdCBwb3NpeF9hY2xfeGF0dHJfZW50cnkJ
YV9lbnRyaWVzWzBdOworfTsKIAogI2VuZGlmIC8qIF9fSkZGUzJfVVNFUl9IX18gKi8KZGlm
ZiAtLWdpdCBhL21rZnMuamZmczIuYyBiL21rZnMuamZmczIuYwppbmRleCAwMmY1N2Y5Li5m
YTRhNWYzIDEwMDY0NAotLS0gYS9ta2ZzLmpmZnMyLmMKKysrIGIvbWtmcy5qZmZzMi5jCkBA
IC0xMDUyLDIyICsxMDUyLDIyIEBAIHN0YXRpYyBzdHJ1Y3QgewogCXsgMCwgTlVMTCwgMCB9
CiB9OwogCi1zdGF0aWMgdm9pZCBmb3JtYWxpemVfcG9zaXhfYWNsKGNoYXIgKnh2YWx1ZSwg
aW50ICp2YWx1ZV9sZW4pCitzdGF0aWMgdm9pZCBmb3JtYWxpemVfcG9zaXhfYWNsKHZvaWQg
Knh2YWx1ZSwgaW50ICp2YWx1ZV9sZW4pCiB7Ci0JcG9zaXhfYWNsX3hhdHRyX2hlYWRlciAq
cGFjbF9oZWFkZXI7Ci0JcG9zaXhfYWNsX3hhdHRyX2VudHJ5ICpwZW50LCAqcGxpbTsKLQlq
ZmZzMl9hY2xfaGVhZGVyICpqYWNsX2hlYWRlcjsKLQlqZmZzMl9hY2xfZW50cnkgKmplbnQ7
Ci0JamZmczJfYWNsX2VudHJ5X3Nob3J0ICpqZW50X3M7CisJc3RydWN0IHBvc2l4X2FjbF94
YXR0cl9oZWFkZXIgKnBhY2xfaGVhZGVyOworCXN0cnVjdCBwb3NpeF9hY2xfeGF0dHJfZW50
cnkgKnBlbnQsICpwbGltOworCXN0cnVjdCBqZmZzMl9hY2xfaGVhZGVyICpqYWNsX2hlYWRl
cjsKKwlzdHJ1Y3QgamZmczJfYWNsX2VudHJ5ICpqZW50OworCXN0cnVjdCBqZmZzMl9hY2xf
ZW50cnlfc2hvcnQgKmplbnRfczsKIAljaGFyIGJ1ZmZlcltYQVRUUl9CVUZGRVJfU0laRV07
CiAJaW50IG9mZnNldCA9IDA7CiAKLQlwYWNsX2hlYWRlciA9IChwb3NpeF9hY2xfeGF0dHJf
aGVhZGVyICopeHZhbHVlOzsKKwlwYWNsX2hlYWRlciA9IHh2YWx1ZTs7CiAJcGVudCA9IHBh
Y2xfaGVhZGVyLT5hX2VudHJpZXM7Ci0JcGxpbSA9IChwb3NpeF9hY2xfeGF0dHJfZW50cnkg
KikoeHZhbHVlICsgKnZhbHVlX2xlbik7CisJcGxpbSA9IHh2YWx1ZSArICp2YWx1ZV9sZW47
CiAKLQlqYWNsX2hlYWRlciA9IChqZmZzMl9hY2xfaGVhZGVyICopYnVmZmVyOwotCW9mZnNl
dCArPSBzaXplb2YoamZmczJfYWNsX2hlYWRlcik7CisJamFjbF9oZWFkZXIgPSAoc3RydWN0
IGpmZnMyX2FjbF9oZWFkZXIgKilidWZmZXI7CisJb2Zmc2V0ICs9IHNpemVvZihzdHJ1Y3Qg
amZmczJfYWNsX2hlYWRlcik7CiAJamFjbF9oZWFkZXItPmFfdmVyc2lvbiA9IGNwdV90b19q
ZTMyKEpGRlMyX0FDTF9WRVJTSU9OKTsKIAogCXdoaWxlIChwZW50IDwgcGxpbSkgewpAQCAt
MTA3NiwxNSArMTA3NiwxNSBAQCBzdGF0aWMgdm9pZCBmb3JtYWxpemVfcG9zaXhfYWNsKGNo
YXIgKnh2CiAJCWNhc2UgQUNMX0dST1VQX09CSjoKIAkJY2FzZSBBQ0xfTUFTSzoKIAkJY2Fz
ZSBBQ0xfT1RIRVI6Ci0JCQlqZW50X3MgPSAoamZmczJfYWNsX2VudHJ5X3Nob3J0ICopKGJ1
ZmZlciArIG9mZnNldCk7Ci0JCQlvZmZzZXQgKz0gc2l6ZW9mKGpmZnMyX2FjbF9lbnRyeV9z
aG9ydCk7CisJCQlqZW50X3MgPSAoc3RydWN0IGpmZnMyX2FjbF9lbnRyeV9zaG9ydCAqKShi
dWZmZXIgKyBvZmZzZXQpOworCQkJb2Zmc2V0ICs9IHNpemVvZihzdHJ1Y3QgamZmczJfYWNs
X2VudHJ5X3Nob3J0KTsKIAkJCWplbnRfcy0+ZV90YWcgPSBjcHVfdG9famUxNihsZTE2X3Rv
X2NwdShwZW50LT5lX3RhZykpOwogCQkJamVudF9zLT5lX3Blcm0gPSBjcHVfdG9famUxNihs
ZTE2X3RvX2NwdShwZW50LT5lX3Blcm0pKTsKIAkJCWJyZWFrOwogCQljYXNlIEFDTF9VU0VS
OgogCQljYXNlIEFDTF9HUk9VUDoKLQkJCWplbnQgPSAoamZmczJfYWNsX2VudHJ5ICopKGJ1
ZmZlciArIG9mZnNldCk7Ci0JCQlvZmZzZXQgKz0gc2l6ZW9mKGpmZnMyX2FjbF9lbnRyeSk7
CisJCQlqZW50ID0gKHN0cnVjdCBqZmZzMl9hY2xfZW50cnkgKikoYnVmZmVyICsgb2Zmc2V0
KTsKKwkJCW9mZnNldCArPSBzaXplb2Yoc3RydWN0IGpmZnMyX2FjbF9lbnRyeSk7CiAJCQlq
ZW50LT5lX3RhZyA9IGNwdV90b19qZTE2KGxlMTZfdG9fY3B1KHBlbnQtPmVfdGFnKSk7CiAJ
CQlqZW50LT5lX3Blcm0gPSBjcHVfdG9famUxNihsZTE2X3RvX2NwdShwZW50LT5lX3Blcm0p
KTsKIAkJCWplbnQtPmVfaWQgPSBjcHVfdG9famUzMihsZTMyX3RvX2NwdShwZW50LT5lX2lk
KSk7Cg==
--------------050407070604080008020801--
