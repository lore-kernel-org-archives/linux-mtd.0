Received: from mail-gw0-f43.google.com ([74.125.83.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R3PMr-0005rA-Gx
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2011 09:33:26 +0000
Received: by gwm11 with SMTP id 11so333464gwm.16
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2011 02:33:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1315738766.18731.9.camel@sauron>
References: <CAMjE+nUOxOm4bBWKp1xAcVDjP-Pepd_GuJ=DcQ4jUcsohn-K=g@mail.gmail.com>
	<1315738766.18731.9.camel@sauron>
Date: Tue, 13 Sep 2011 11:33:20 +0200
Message-ID: <CAMjE+nUNBEgOFsbLShSTRwEXmYAf9HXi59Kj3O78PEfgzeyWfA@mail.gmail.com>
Subject: Re: mtd-utils: ubiformat: writing images on flash with badblocks.
From: Anton Olofsson <anol.martinsson@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Great patch!

As it turns out this issue was a symptom of our nand driver not working 100=
%.
Reverting to the faulty driver I was able to recreate the error and
check your patch.

As far as I can see this works as expected for both file and pipe input
and image is written correctly.

Best Regards
Anton Olofsson

On Sun, Sep 11, 2011 at 12:59 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Thu, 2011-08-25 at 10:26 +0200, Anton Olofsson wrote:
>> Hi!
>>
>> We encountered some problems with ubiformat
>> and writing ubi-images onto flash with badblocks.
>>
>> If a badblock was encountered during write ubiformat would
>> skip writing that =93file-block=94 altogether, and this would eventually
>> result in EOF while trying to read the image file.
>>
>> The quick fix was to rewind the filedescriptor for the next pass.
>>
>> Im not sure if others have encountered this problem
>> or even if this is the correct way to handle this situation.
>>
>> Here is the change made though:
>
>
> Hi, thanks for the fix, but I have few notes:
>
> 1. The patch does not have your Signed-off-by:
> 2. The patch is line-wrapped, so does not apply.
>
>
>> --- a/ubi-utils/ubiformat.c
>> +++ b/ubi-utils/ubiformat.c
>> @@ -546,6 +546,11 @@ static int flash_image(libmtd_t libmtd, const
>> struct mtd_dev_info *mtd,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (mark=
_bad(mtd, si, eb))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 goto out_close;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*rewind fd so next read_a=
ll(...) reads correct block*/
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (lseek(fd, -mtd->eb_siz=
e, SEEK_CUR) =3D=3D -1) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sys_errmsg=
("unable to rewind file");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_c=
lose;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>
> But most importantly, I think this will break the case when the input
> is stdout (pipe), not a file. So I quickly cooked the below patch
> instead. I did not test it - would it be possible for you to give it a
> test and let me know if it is ok, in which case I'll push it to the
> mtd-utils repository.
>
> From 737ca8095332bf2d8110135de6e522fdb07a42df Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <artem.bityutskiy@intel.com>
> Date: Sun, 11 Sep 2011 13:52:08 +0300
> Subject: [PATCH] ubiformat: handle write errors correctly
>
> This issue was reported and analyzed by
> Anton Olofsson <anol.martinsson@gmail.com>:
>
> when ubiformat encounters a write error while flashing the UBI image (whi=
ch may
> come from a file of from stdout), it correctly marks the faulty erasebloc=
k as
> bad and skips it. However, it also incorrectly drops the data buffer whic=
h was
> supposed to be written, and reads next block of data.
>
> This patch fixes this issue - in case of a write error, we preserve the c=
urrent
> data and write it to the next eraseblock, instead of dropping it.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@intel.com>
> ---
> =A0ubi-utils/ubiformat.c | =A0 22 ++++++++++++++++------
> =A01 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
> index bfa1730..c396b09 100644
> --- a/ubi-utils/ubiformat.c
> +++ b/ubi-utils/ubiformat.c
> @@ -442,7 +442,7 @@ static int mark_bad(const struct mtd_dev_info *mtd, s=
truct ubi_scan_info *si, in
> =A0static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd=
,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct ubigen_info *ui,=
 struct ubi_scan_info *si)
> =A0{
> - =A0 =A0 =A0 int fd, img_ebs, eb, written_ebs =3D 0, divisor;
> + =A0 =A0 =A0 int fd, img_ebs, eb, written_ebs =3D 0, divisor, skip_data_=
read =3D 0;
> =A0 =A0 =A0 =A0off_t st_size;
>
> =A0 =A0 =A0 =A0fd =3D open_file(&st_size);
> @@ -501,12 +501,15 @@ static int flash_image(libmtd_t libmtd, const struc=
t mtd_dev_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D read_all(fd, buf, mtd->eb_size);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (err) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sys_errmsg("failed to read =
eraseblock %d from \"%s\"",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0writ=
ten_ebs, args.image);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_close;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!skip_data_read) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D read_all(fd, buf, m=
td->eb_size);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (err) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sys_errmsg(=
"failed to read eraseblock %d from \"%s\"",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0written_ebs, args.image);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_cl=
ose;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 skip_data_read =3D 0;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (args.override_ec)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ec =3D args.ec;
> @@ -546,6 +549,13 @@ static int flash_image(libmtd_t libmtd, const struct=
 mtd_dev_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (mark_b=
ad(mtd, si, eb))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0goto out_close;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* We have to make sure t=
hat we do not read next block
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* of data from the input=
 image or stdin - we have to
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* write buf first instea=
d.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 skip_data_read =3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (++written_ebs >=3D img_ebs)
> --
> 1.7.6
>
> --
> Best Regards,
> Artem Bityutskiy
>
>
