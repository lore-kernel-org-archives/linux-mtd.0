Received: from mail-vb0-x234.google.com ([2607:f8b0:400c:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VxyDy-0008K1-CP
 for linux-mtd@lists.infradead.org; Tue, 31 Dec 2013 12:15:07 +0000
Received: by mail-vb0-f52.google.com with SMTP id p5so6127917vbn.25
 for <linux-mtd@lists.infradead.org>; Tue, 31 Dec 2013 04:14:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A770B3733@NTXXIAMBX02.xacn.micron.com>
References: <71CF8D7F32C5C24C9CD1D0E02D52498A770B3733@NTXXIAMBX02.xacn.micron.com>
Date: Tue, 31 Dec 2013 13:14:41 +0100
Message-ID: <CAFLxGvx8v2qQ83o9sdDxYYstKu+KAKa7BeXx2bjfWVn3SaSQLw@mail.gmail.com>
Subject: Re: [PATCH 1/1] MTD: UBI: try to avoid program data to NOR flash
 after erasure interrupted
From: Richard Weinberger <richard.weinberger@gmail.com>
To: =?UTF-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: quoted-printable
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 7, 2013 at 9:18 AM, Qi Wang =A4=FD=B0_ (qiwang) <qiwang@micron.=
com> wrote:
> Hi:
> As we talked in mail before, please check my patch as below:
>
> From: Qi Wang <qiwang@micron.com>
>
> nor_erase_prepare() will be called before erase a NOR flash, it will prog=
ram '0'
> into a block to mark this block. But program data into a erasure interrup=
ted block
> can cause program timtout(several minutes at most) error, could impact ot=
her
> operation on NOR flash. So UBIFS can read this block first to avoid unnee=
ded
> program operation.
>
> This patch try to put read operation at head of write operation in
> nor_erase_prepare(), read out the data.
> If the data is already corrupt, then no need to program any data into thi=
s block,
> just go to erase this block.
>
> Signed-off-by: Qi Wang <qiwang@qiwang@micron.com>

This email address is malformed.

> ---
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index bf79def..0a6343d 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -499,6 +499,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, =
int pnum)
>         size_t written;
>         loff_t addr;
>         uint32_t data =3D 0;
> +       struct ubi_ec_hdr ec_hdr;
>         /*
>          * Note, we cannot generally define VID header buffers on stack,
>          * because of the way we deal with these buffers (see the header
> @@ -509,49 +510,38 @@ static int nor_erase_prepare(struct ubi_device *ubi=
, int pnum)
>         struct ubi_vid_hdr vid_hdr;
>
>         /*
> +        * If VID or EC is valid, need to corrupt it before erase operati=
on.
>          * It is important to first invalidate the EC header, and then th=
e VID
>          * header. Otherwise a power cut may lead to valid EC header and
>          * invalid VID header, in which case UBI will treat this PEB as
>          * corrupted and will try to preserve it, and print scary warning=
s.
>          */
>         addr =3D (loff_t)pnum * ubi->peb_size;
> -       err =3D mtd_write(ubi->mtd, addr, 4, &written, (void *)&data);
> -       if (!err) {
> -               addr +=3D ubi->vid_hdr_aloffset;
> -               err =3D mtd_write(ubi->mtd, addr, 4, &written, (void *)&d=
ata);
> -               if (!err)
> -                       return 0;
> +       err =3D ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
> +       if (err !=3D UBI_IO_BAD_HDR_EBADMSG && err !=3D UBI_IO_BAD_HDR &&
> +           err !=3D UBI_IO_FF){
> +               err1 =3D mtd_write(ubi->mtd, addr, 4, &written, (void *)&=
data);
> +               if(err1)
> +                       goto error;
>         }
>
> -       /*
> -        * We failed to write to the media. This was observed with Spansi=
on
> -        * S29GL512N NOR flash. Most probably the previously eraseblock e=
rasure
> -        * was interrupted at a very inappropriate moment, so it became
> -        * unwritable. In this case we probably anyway have garbage in th=
is
> -        * PEB.
> -        */
> -       err1 =3D ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
> -       if (err1 =3D=3D UBI_IO_BAD_HDR_EBADMSG || err1 =3D=3D UBI_IO_BAD_=
HDR ||
> -           err1 =3D=3D UBI_IO_FF) {
> -               struct ubi_ec_hdr ec_hdr;
> -
> -               err1 =3D ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
> -               if (err1 =3D=3D UBI_IO_BAD_HDR_EBADMSG || err1 =3D=3D UBI=
_IO_BAD_HDR ||
> -                   err1 =3D=3D UBI_IO_FF)
> -                       /*
> -                        * Both VID and EC headers are corrupted, so we c=
an
> -                        * safely erase this PEB and not afraid that it w=
ill be
> -                        * treated as a valid PEB in case of an unclean r=
eboot.
> -                        */
> -                       return 0;
> +       err =3D ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
> +       if (err !=3D UBI_IO_BAD_HDR_EBADMSG && err !=3D UBI_IO_BAD_HDR &&
> +           err !=3D UBI_IO_FF){
> +               addr +=3D ubi->vid_hdr_aloffset;
> +               err1 =3D mtd_write(ubi->mtd, addr, 4, &written, (void *)&=
data);
> +               if (err1)
> +                       goto error;
>         }
> +       return 0;
>
> +error:
>         /*
> -        * The PEB contains a valid VID header, but we cannot invalidate =
it.
> +        * The PEB contains a valid VID or EC header, but we cannot inval=
idate it.
>          * Supposedly the flash media or the driver is screwed up, so ret=
urn an
>          * error.
>          */
> -       ubi_err("cannot invalidate PEB %d, write returned %d read returne=
d %d",
> +       ubi_err("cannot invalidate PEB %d, read returned %d write returne=
d %d",
>                 pnum, err, err1);
>         ubi_dump_flash(ubi, pnum, 0, ubi->peb_size);
>         return -EIO;
> ---
>
> I have tested this patch on Micron NOR flash, part number is=A1GJS28F512M=
29EWHA.

Please add this information to the commit message.

> If have any questions, please let me know.

>From UBIs point of view the patch seems OK to me, but it is malformed,
I was unable to apply it using git-am.
Did you use MS Outlook? :)
Please send it using git send-mail or any other sane mailer.

> Thank you
>
> Best Regards,
> Qi Wang =A4=FD=B0_
> ESG APAC AE
> Tel: 86-021-38997158
> Mobile: 86-15201958202
> Email: qiwang@micron.com
> Address: No 601 Fasai Rd, Pudong, Shanghai, China, 200131



--=20
Thanks,
//richard
