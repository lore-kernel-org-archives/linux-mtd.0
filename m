Received: from mail-qy0-f183.google.com ([209.85.221.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O7JGo-0003wO-AE
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 02:14:31 +0000
Received: by qyk13 with SMTP id 13so19895833qyk.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Apr 2010 19:14:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1272439453.7750.20.camel@localhost>
References: <i2ncf7b913c1004152036t3b23af53h339b16092ecdd812@mail.gmail.com>
	<1272439453.7750.20.camel@localhost>
Date: Thu, 29 Apr 2010 10:14:29 +0800
Message-ID: <i2rcf7b913c1004281914kbe0c0c18xeee2e1bbcc375012@mail.gmail.com>
Subject: Re: [PATCH] ubifs: add update vfs super block infomation when remount
	to ro mode
From: Zhang JieJing <kzjeef@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(resend since HTML mail rejected by linux-fsdevel.)
Hi Artem,

I just clone the  git://git.infradead.org/ubifs-2.6.git, and git am my
patch, It is very clean patched, so, maybe your git repo code is very
new, so the patch can't cleaned apply.

This is my first patch give back to upstream, even I read the kernel
document 'how-to send patch' but still something leaked.
If I did something wrong, Please show me the right way or something like th=
at,
Thanks for your time.

---
Best regards,
Zhang Jiejing



2010/4/28 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2010-04-16 at 11:36 +0800, ZhangJieJing wrote:
>> If some read/write error happens(eg.CRC error), ubifs make self a read
>> only mode,
>> but the vfs infomation still not update.
>> This patch add this also make /proc/mounts update.
>>
>> Signed-off-by: Zhang Jiejing <kzjeef@gmail.com>
>> ---
>> =C2=A0fs/ubifs/io.c | =C2=A0 =C2=A01 +
>> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>> diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
>> index 0168271..d33c233 100644
>> --- a/fs/ubifs/io.c
>> +++ b/fs/ubifs/io.c
>> @@ -63,6 +63,7 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!c->ro_media) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c->ro_media =3D 1=
;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c->no_chk_data_cr=
c =3D 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c->vfs_sb->s_flags |=
=3D MS_RDONLY;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ubifs_warn("switc=
hed to read-only mode, error %d", err);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dbg_dump_stack();
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> --
>> 1.6.3.3
>
> Your patch is not applicable. Try to save your own e-mail and apply the
> patch with 'git am'.
>
> Applying: UBIFS: mark VFS SB RO too
> fatal: corrupt patch at line 9
> Patch failed at 0001 UBIFS: mark VFS SB RO too
> When you have resolved this problem run "git am -i --resolved".
> If you would prefer to skip this patch, instead run "git am -i --skip".
> To restore the original branch and stop patching run "git am -i
> --abort".
> [dedekind@sauron ubifs-2.6]\$ patch -p1 < .git/rebase-apply/patch
> patching file fs/ubifs/io.c
> patch: **** malformed patch at line 9: =EF=BF=BD=EF=BF=BD =EF=BF=BD =EF=
=BF=BD if (!c->ro_media) {
>
>
> But I've fixed this up and applied manually. It is now in the
> ubifs-2.6.git tree, thanks.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
