Received: from an-out-0708.google.com ([209.85.132.250])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsEnH-0002hV-SC
	for linux-mtd@lists.infradead.org; Mon, 28 Sep 2009 11:53:32 +0000
Received: by an-out-0708.google.com with SMTP id c38so1586657ana.27
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Sep 2009 04:53:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1254137943.3778.60.camel@localhost>
References: <71cd59b00909241541y645c40farac56a7eadb84c02b@mail.gmail.com>
	<1253832477-29064-1-git-send-email-corentincj@iksaif.net>
	<1254137943.3778.60.camel@localhost>
Date: Mon, 28 Sep 2009 13:53:25 +0200
Message-ID: <71cd59b00909280453w31fcd22co4c41167e125b9188@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: Add /dev/ubiX_Y naming scheme in open_ubi
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: util-linux-ng@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 28, 2009 at 1:39 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Fri, 2009-09-25 at 00:47 +0200, Corentin Chary wrote:
>> This is needed to use $ mount /dev/ubi0_0 /mnt/nand
>> You'll also need a recent libblkid with UBI and UBIFS
>> support.
>>
>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>> ---
>> =A0fs/ubifs/super.c | =A0 12 ++++++++----
>> =A01 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 7e2b3d4..38320ad 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -1843,10 +1843,11 @@ const struct super_operations ubifs_super_operat=
ions =3D {
>> =A0 * @mode: UBI volume open mode
>> =A0 *
>> =A0 * There are several ways to specify UBI volumes when mounting UBIFS:
>> - * o ubiX_Y =A0 =A0- UBI device number X, volume Y;
>> - * o ubiY =A0 =A0 =A0- UBI device number 0, volume Y;
>> - * o ubiX:NAME - mount UBI device X, volume with name NAME;
>> - * o ubi:NAME =A0- mount UBI device 0, volume with name NAME.
>> + * o /dev/ubiX_Y - UBI device number X, volume Y;
>> + * o ubiX_Y =A0 =A0 =A0- UBI device number X, volume Y;
>> + * o ubiY =A0 =A0 =A0 =A0- UBI device number 0, volume Y;
>> + * o ubiX:NAME =A0 - mount UBI device X, volume with name NAME;
>> + * o ubi:NAME =A0 =A0- mount UBI device 0, volume with name NAME.
>> =A0 *
>> =A0 * Alternative '!' separator may be used instead of ':' (because some=
 shells
>> =A0 * like busybox may interpret ':' as an NFS host name separator). Thi=
s function
>> @@ -1858,6 +1859,9 @@ static struct ubi_volume_desc *open_ubi(const char=
 *name, int mode)
>> =A0 =A0 =A0 int dev, vol;
>> =A0 =A0 =A0 char *endptr;
>>
>> + =A0 =A0 if (!strncmp("/dev/", name, 5))
>> + =A0 =A0 =A0 =A0 =A0 =A0 name =3D name + 5;
>> +
>> =A0 =A0 =A0 if (name[0] !=3D 'u' || name[1] !=3D 'b' || name[2] !=3D 'i'=
)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ERR_PTR(-EINVAL);
>
> But UBI volume may have arbitrary names. Could we invent something
> better?


Using name and kern_path we can find the corresponding inode (and
major/minor informations).
ubi_open_volume use ubi_num and vol_id.
vol_id is minor()-1, but major is not related to ubi_num.

UBI have a "ubi_major2num" internally, is it ok to export this symbol ?

Then we could do something like
ubi_open_volume(ubi_major2num(major()), minor()-1)

--=20
Corentin Chary
http://xf.iksaif.net
