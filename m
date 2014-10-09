Received: from mail-yk0-f182.google.com ([209.85.160.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcBVF-0007oE-Oh
 for linux-mtd@lists.infradead.org; Thu, 09 Oct 2014 11:03:27 +0000
Received: by mail-yk0-f182.google.com with SMTP id 79so477602ykr.41
 for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2014 04:03:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20141009102546.GA2755@arch.hh.imgtec.org>
References: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>
 <20141009102546.GA2755@arch.hh.imgtec.org>
Date: Thu, 9 Oct 2014 12:03:02 +0100
Message-ID: <CAPcvp5FammqUr67rv_LvqWPoPegLsPMLBTT-mkQ2u=VCs2-_8g@mail.gmail.com>
Subject: Re: UBI_READWRITE constraint when opening volumes to rename
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On 9 October 2014 11:25, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> On 07 Oct 03:31 PM, Andrew Murray wrote:
>> Hello,
>>
>> I'd like to be able to safely rename a UBI volume that contains a
>> mounted UBIFS volume.
>>
>> This allows for firmware upgrade via the following steps:
>>
>> - ubimkvol rootfs_new
>> - ubiupdatevol rootfs_new
>> - ubirename rootfs rootfs_old rootfs_new rootfs
>> - reboot
>> - ubirmvol rootfs_old
>>
>> Such an approach makes upgrade of a root filesystem simple as there is
>> no need to unmount the root filesystem. I believe this question has
>> been asked before on this mailing list
>> (http://lists.infradead.org/pipermail/linux-mtd/2012-February/039743.htm=
l).
>>
>> This process isn't possible at the moment as 'rename_volumes' opens
>> the UBI volume with UBI_READWRITE. Unfortunately UBIFS always opens
>> UBI with UBI_READWRITE regardless to if the user mounts as read-only.
>
> How about making UBIFS honour the read-only mount flag?

Thanks for the suggestion, I didn't consider this as I assumed there
was a good reason for it being UBI_READWRITE - though it appears as
though it's always been UBI_READWRITE since the initial
implementation.

>
> A quick look to fs/ubifs/io.c shows that UBIFS will show an error message
> if a LEB erase/write operation is attempted on a read-only mounted or
> read-only media. So, hopefully, this is reasonable (the patch is complete=
ly
> untested!):

Is there any reason why UBIFS would need to write to UBI when the user
mounts UBIFS as R/O? I know that scrubbing can occur in the UBI layer
- will this still occur if the volume is opened as UBI_READONLY?

>
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 106bf20..ce445ce 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1998,11 +1998,16 @@ static int ubifs_fill_super(struct super_block *s=
b, void *data, int silent)
>  {
>         struct ubifs_info *c =3D sb->s_fs_info;
>         struct inode *root;
> -       int err;
> +       int err, mode;
> +
> +       /*
> +        * Re-open the UBI device in read-write mode, or keep it read-onl=
y if
> +        * explicitly requested.
> +        */
> +       mode =3D (sb->s_flags & MS_RDONLY) ? UBI_READONLY : UBI_READWRITE=
;
>
>         c->vfs_sb =3D sb;
> -       /* Re-open the UBI device in read-write mode */
> -       c->ubi =3D ubi_open_volume(c->vi.ubi_num, c->vi.vol_id, UBI_READW=
RITE);
> +       c->ubi =3D ubi_open_volume(c->vi.ubi_num, c->vi.vol_id, mode);
>         if (IS_ERR(c->ubi)) {
>                 err =3D PTR_ERR(c->ubi);
>                 goto out;
>

I will try this later and get back to you - this seems like the right fix.

To satisfy my curiosity - does the UBI rename function really need to
open the UBI volume as UBI_READWRITE to rename? Does it matter that a
UBIFS fileystem may be writing UBI whilst a UBI rename occurs - I've
assumed that UBIFS doesn't ever read/write the volume label - so it
doesn't matter if it changes beneath it? (I'm not too familiar with
UBI/UBIFS internals).

Thanks,

Andrew Murray

> --
> Ezequiel Garc=C3=ADa, Free Electrons
> Embedded Linux, Kernel and Android Engineering
> http://free-electrons.com



--=20
Andrew Murray, Director
Embedded Bits Limited
www.embedded-bits.co.uk

Embedded Bits Limited is a company registered in England and Wales
with company number 08178608 and VAT number 140658911. Registered
office: Embedded Bits Limited c/o InTouch Accounting Ltd. Bristol and
West House Post Office Road Bournemouth Dorset BH1 1BL
