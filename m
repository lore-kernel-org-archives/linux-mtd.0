Received: from nz-out-0102.google.com ([64.233.162.197])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GUO3G-0007SK-02
	for linux-mtd@lists.infradead.org; Mon, 02 Oct 2006 14:41:47 +0100
Received: by nz-out-0102.google.com with SMTP id s1so471306nze
	for <linux-mtd@lists.infradead.org>;
	Mon, 02 Oct 2006 06:40:43 -0700 (PDT)
Message-ID: <ee47688c0610020640uf9783fbu816006bed26c15c5@mail.gmail.com>
Date: Mon, 2 Oct 2006 15:40:41 +0200
From: "Radoslaw Bisewski" <radbis@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 appears to "freeze" during erase
In-Reply-To: <F6AD7E21CDF4E145A44F61F43EE6D9399B4CB1@tmnt04.transmode.se>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_5458_20426253.1159796441924"
References: <F6AD7E21CDF4E145A44F61F43EE6D9399B4CB1@tmnt04.transmode.se>
Cc: Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_5458_20426253.1159796441924
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm sending this message once again - this time in plain text format.
Could someone review these changes before putting them into the MTD?
With current desing erase_free_sem is locked every time the flash
block is being erased. For NOR flashes - ~1 second is needed to erase
single flash block. In the worst case scenario erase_free_sem may be
locked for a couple of seconds when the number of blocks is being
erased (e.g. after large file was removed). When erase_free_sem is
locked all read/write operations for given JFFS2 partition are locked
too - in effect from time to time access to the JFFS2 partition is
locked for a number of seconds. This fix makes critical section in
flash erasing procedure shorter - now erase_free_sem is locked around
erase_completion_lock spinlock only.

Regards
R.

On 9/29/06, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
> >
> >
> >
> > On 9/21/06, Joakim Tjernlund <Joakim.Tjernlund@transmode.se > wrote:
> >
> >       Radoslaw Bisewski wrote:
> >       > This bug is caused by the use of erase_free_sem
> > semaphore. Block erasing
> >       > function jffs2_erase_block is called with
> > erase_free_sem locked, i.e.
> >       > erase_free_sem will be locked for the time needed to
> > erase flash block (
> >       > ~1 s for typical NOR chip), in the worst scenario
> > access to file system
> >       > may be blocked for a numer of seconds when the number
> > of blocks is being
> >       > erased. Workaround for this bug is simple -
> > erase_free_sem cannot be
> >       > locked when jffs2_erase_block function is called. See
> > attached patch.
> >       >
> >       Me again
> >
> >       I think there is a bug in jffs2_erase_pending_blocks()
> > after applying your patch:
> >              spin_unlock(&c->erase_completion_lock);
> >       done:
> >              D1(printk(KERN_DEBUG "jffs2_erase_pending_blocks
> > completed\n"));
> >
> >              up(&c->erase_free_sem);
> >
> >       the up(&c->erase_free_sem); needs to move to before done:
> >
> >       Jocke
> >
> >
> >
> > Joakim,
> >
> > yes, you are right. attached is the corrected version.
> >
> > Regards
> > R.
> >
>
> Why isn't this patch in MTD yet?
> David, can you please comment?
>
>  Jcoke
>

------=_Part_5458_20426253.1159796441924
Content-Type: text/plain; name=jffs2-erase-patch.patch; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_esswrhs1
Content-Disposition: attachment; filename="jffs2-erase-patch.patch"

LS0tIGVyYXNlLmMJMjAwNi0wOS0yMSAxMDoyMTo0OC4wMDAwMDAwMDAgKzAyMDAKKysrIGVyYXNl
LWZpeGVkLmMJMjAwNi0wOS0yMSAxNDoyNDoyMy4wMDAwMDAwMDAgKzAyMDAKQEAgLTUzLDYgKzUz
LDcgQEAKIAlpbnN0ciA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBlcmFzZV9pbmZvKSArIHNpemVv
ZihzdHJ1Y3QgZXJhc2VfcHJpdl9zdHJ1Y3QpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWluc3RyKSB7
CiAJCXByaW50ayhLRVJOX1dBUk5JTkcgImttYWxsb2MgZm9yIHN0cnVjdCBlcmFzZV9pbmZvIGlu
IGpmZnMyX2VyYXNlX2Jsb2NrIGZhaWxlZC4gUmVmaWxpbmcgYmxvY2sgZm9yIGxhdGVyXG4iKTsK
KyAgICAgICAgZG93bigmYy0+ZXJhc2VfZnJlZV9zZW0pOyAgICAgICAgCiAJCXNwaW5fbG9jaygm
Yy0+ZXJhc2VfY29tcGxldGlvbl9sb2NrKTsKIAkJbGlzdF9kZWwoJmplYi0+bGlzdCk7CiAJCWxp
c3RfYWRkKCZqZWItPmxpc3QsICZjLT5lcmFzZV9wZW5kaW5nX2xpc3QpOwpAQCAtNjAsNiArNjEs
NyBAQAogCQljLT5kaXJ0eV9zaXplICs9IGMtPnNlY3Rvcl9zaXplOwogCQlqZWItPmRpcnR5X3Np
emUgPSBjLT5zZWN0b3Jfc2l6ZTsKIAkJc3Bpbl91bmxvY2soJmMtPmVyYXNlX2NvbXBsZXRpb25f
bG9jayk7CisgICAgICAgIHVwKCZjLT5lcmFzZV9mcmVlX3NlbSk7CiAJCXJldHVybjsKIAl9CiAK
QEAgLTg2LDEzICs4OCwxNSBAQAogCWlmIChyZXQgPT0gLUVOT01FTSB8fCByZXQgPT0gLUVBR0FJ
TikgewogCQkvKiBFcmFzZSBmYWlsZWQgaW1tZWRpYXRlbHkuIFJlZmlsZSBpdCBvbiB0aGUgbGlz
dCAqLwogCQlEMShwcmludGsoS0VSTl9ERUJVRyAiRXJhc2UgYXQgMHglMDh4IGZhaWxlZDogJWQu
IFJlZmlsaW5nIG9uIGVyYXNlX3BlbmRpbmdfbGlzdFxuIiwgamViLT5vZmZzZXQsIHJldCkpOwot
CQlzcGluX2xvY2soJmMtPmVyYXNlX2NvbXBsZXRpb25fbG9jayk7CisgICAgICAgIGRvd24oJmMt
PmVyYXNlX2ZyZWVfc2VtKTsKKyAgICAgICAgc3Bpbl9sb2NrKCZjLT5lcmFzZV9jb21wbGV0aW9u
X2xvY2spOwogCQlsaXN0X2RlbCgmamViLT5saXN0KTsKIAkJbGlzdF9hZGQoJmplYi0+bGlzdCwg
JmMtPmVyYXNlX3BlbmRpbmdfbGlzdCk7CiAJCWMtPmVyYXNpbmdfc2l6ZSAtPSBjLT5zZWN0b3Jf
c2l6ZTsKIAkJYy0+ZGlydHlfc2l6ZSArPSBjLT5zZWN0b3Jfc2l6ZTsKIAkJamViLT5kaXJ0eV9z
aXplID0gYy0+c2VjdG9yX3NpemU7CiAJCXNwaW5fdW5sb2NrKCZjLT5lcmFzZV9jb21wbGV0aW9u
X2xvY2spOworICAgICAgICB1cCgmYy0+ZXJhc2VfZnJlZV9zZW0pOwogCQlyZXR1cm47CiAJfQog
CkBAIC0xMTksNyArMTIzLDggQEAKIAkJCWplYiA9IGxpc3RfZW50cnkoYy0+ZXJhc2VfY29tcGxl
dGVfbGlzdC5uZXh0LCBzdHJ1Y3QgamZmczJfZXJhc2VibG9jaywgbGlzdCk7CiAJCQlsaXN0X2Rl
bCgmamViLT5saXN0KTsKIAkJCXNwaW5fdW5sb2NrKCZjLT5lcmFzZV9jb21wbGV0aW9uX2xvY2sp
OwotCQkJamZmczJfbWFya19lcmFzZWRfYmxvY2soYywgamViKTsKKyAgICAgICAgICAgICAgICAg
ICAgICAgIHVwKCZjLT5lcmFzZV9mcmVlX3NlbSk7CisgICAgICAgICAgICAgICAgICAgICAgICBq
ZmZzMl9tYXJrX2VyYXNlZF9ibG9jayhjLCBqZWIpOwogCiAJCQlpZiAoIS0tY291bnQpIHsKIAkJ
CQlEMShwcmludGsoS0VSTl9ERUJVRyAiQ291bnQgcmVhY2hlZC4gamZmczJfZXJhc2VfcGVuZGlu
Z19ibG9ja3MgbGVhdmluZ1xuIikpOwpAQCAtMTM5LDYgKzE0NCw3IEBACiAJCQlqZmZzMl9mcmVl
X2FsbF9ub2RlX3JlZnMoYywgamViKTsKIAkJCWxpc3RfYWRkKCZqZWItPmxpc3QsICZjLT5lcmFz
aW5nX2xpc3QpOwogCQkJc3Bpbl91bmxvY2soJmMtPmVyYXNlX2NvbXBsZXRpb25fbG9jayk7Cisg
ICAgICAgICAgICAgICAgICAgICAgICB1cCgmYy0+ZXJhc2VfZnJlZV9zZW0pOwogCiAJCQlqZmZz
Ml9lcmFzZV9ibG9jayhjLCBqZWIpOwogCkBAIC0xNDgsMTQgKzE1NCwxNSBAQAogCiAJCS8qIEJl
IG5pY2UgKi8KIAkJY29uZF9yZXNjaGVkKCk7CisgICAgICAgIAorICAgICAgICAgICAgICAgIGRv
d24oJmMtPmVyYXNlX2ZyZWVfc2VtKTsKIAkJc3Bpbl9sb2NrKCZjLT5lcmFzZV9jb21wbGV0aW9u
X2xvY2spOwogCX0KIAogCXNwaW5fdW5sb2NrKCZjLT5lcmFzZV9jb21wbGV0aW9uX2xvY2spOwor
ICAgICAgICB1cCgmYy0+ZXJhc2VfZnJlZV9zZW0pOwogIGRvbmU6CiAJRDEocHJpbnRrKEtFUk5f
REVCVUcgImpmZnMyX2VyYXNlX3BlbmRpbmdfYmxvY2tzIGNvbXBsZXRlZFxuIikpOwotCi0JdXAo
JmMtPmVyYXNlX2ZyZWVfc2VtKTsKIH0KIAogc3RhdGljIHZvaWQgamZmczJfZXJhc2Vfc3VjY2Vl
ZGVkKHN0cnVjdCBqZmZzMl9zYl9pbmZvICpjLCBzdHJ1Y3QgamZmczJfZXJhc2VibG9jayAqamVi
KQpAQCAtNDI1LDYgKzQzMiw4IEBACiAJCWplYi0+d2FzdGVkX3NpemUgPSAwOwogCX0KIAorCWRv
d24oJmMtPmVyYXNlX2ZyZWVfc2VtKTsKKwogCXNwaW5fbG9jaygmYy0+ZXJhc2VfY29tcGxldGlv
bl9sb2NrKTsKIAljLT5lcmFzaW5nX3NpemUgLT0gYy0+c2VjdG9yX3NpemU7CiAJYy0+ZnJlZV9z
aXplICs9IGplYi0+ZnJlZV9zaXplOwpAQCAtNDM4LDIyICs0NDcsMjggQEAKIAljLT5ucl9mcmVl
X2Jsb2NrcysrOwogCXNwaW5fdW5sb2NrKCZjLT5lcmFzZV9jb21wbGV0aW9uX2xvY2spOwogCXdh
a2VfdXAoJmMtPmVyYXNlX3dhaXQpOworICAgIAl1cCgmYy0+ZXJhc2VfZnJlZV9zZW0pOworCiAJ
cmV0dXJuOwogCiBmaWxlYmFkOgorICAgCWRvd24oJmMtPmVyYXNlX2ZyZWVfc2VtKTsKIAlzcGlu
X2xvY2soJmMtPmVyYXNlX2NvbXBsZXRpb25fbG9jayk7CiAJLyogU3RpY2sgaXQgb24gYSBsaXN0
IChhbnkgbGlzdCkgc28gZXJhc2VfZmFpbGVkIGNhbiB0YWtlIGl0CiAJICAgcmlnaHQgb2ZmIGFn
YWluLiAgU2lsbHksIGJ1dCBzaG91bGRuJ3QgaGFwcGVuIG9mdGVuLiAqLwogCWxpc3RfYWRkKCZq
ZWItPmxpc3QsICZjLT5lcmFzaW5nX2xpc3QpOwogCXNwaW5fdW5sb2NrKCZjLT5lcmFzZV9jb21w
bGV0aW9uX2xvY2spOworICAgIHVwKCZjLT5lcmFzZV9mcmVlX3NlbSk7CiAJamZmczJfZXJhc2Vf
ZmFpbGVkKGMsIGplYiwgYmFkX29mZnNldCk7CiAJcmV0dXJuOwogCiByZWZpbGU6CiAJLyogU3Rp
Y2sgaXQgYmFjayBvbiB0aGUgbGlzdCBmcm9tIHdoZW5jZSBpdCBjYW1lIGFuZCBjb21lIGJhY2sg
bGF0ZXIgKi8KIAlqZmZzMl9lcmFzZV9wZW5kaW5nX3RyaWdnZXIoYyk7CisJZG93bigmYy0+ZXJh
c2VfZnJlZV9zZW0pOyAgICAKIAlzcGluX2xvY2soJmMtPmVyYXNlX2NvbXBsZXRpb25fbG9jayk7
CiAJbGlzdF9hZGQoJmplYi0+bGlzdCwgJmMtPmVyYXNlX2NvbXBsZXRlX2xpc3QpOwogCXNwaW5f
dW5sb2NrKCZjLT5lcmFzZV9jb21wbGV0aW9uX2xvY2spOworCXVwKCZjLT5lcmFzZV9mcmVlX3Nl
bSk7ICAgIAogCXJldHVybjsKIH0K
------=_Part_5458_20426253.1159796441924--
