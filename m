Received: from mail-yx0-f177.google.com ([209.85.210.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mr9ti-0006xg-O7
	for linux-mtd@lists.infradead.org; Fri, 25 Sep 2009 12:27:42 +0000
Received: by yxe7 with SMTP id 7so2566810yxe.25
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Sep 2009 05:27:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4ABCAB8E.5070604@nokia.com>
References: <71cd59b00909241541y645c40farac56a7eadb84c02b@mail.gmail.com>
	<1253832477-29064-1-git-send-email-corentincj@iksaif.net>
	<4ABCAB8E.5070604@nokia.com>
Date: Fri, 25 Sep 2009 14:27:37 +0200
Message-ID: <71cd59b00909250527s462bf898w27890c1d52c06af4@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: Add /dev/ubiX_Y naming scheme in open_ubi
From: Corentin Chary <corentin.chary@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "util-linux-ng@vger.kernel.org" <util-linux-ng@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 25, 2009 at 1:37 PM, Adrian Hunter <adrian.hunter@nokia.com> wr=
ote:
> Corentin Chary wrote:
>>
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
>> @@ -1843,10 +1843,11 @@ const struct super_operations
>> ubifs_super_operations =3D {
>> =A0* @mode: UBI volume open mode
>> =A0*
>> =A0* There are several ways to specify UBI volumes when mounting UBIFS:
>> - * o ubiX_Y =A0 =A0- UBI device number X, volume Y;
>> - * o ubiY =A0 =A0 =A0- UBI device number 0, volume Y;
>> - * o ubiX:NAME - mount UBI device X, volume with name NAME;
>> - * o ubi:NAME =A0- mount UBI device 0, volume with name NAME.
>> + * o /dev/ubiX_Y - UBI device number X, volume Y;
>> + * o ubiX_Y =A0 =A0 =A0- UBI device number X, volume Y;
>> + * o ubiY =A0 =A0 =A0 =A0- UBI device number 0, volume Y;
>> + * o ubiX:NAME =A0 - mount UBI device X, volume with name NAME;
>> + * o ubi:NAME =A0 =A0- mount UBI device 0, volume with name NAME.
>> =A0*
>> =A0* Alternative '!' separator may be used instead of ':' (because some
>> shells
>> =A0* like busybox may interpret ':' as an NFS host name separator). This
>> function
>> @@ -1858,6 +1859,9 @@ static struct ubi_volume_desc *open_ubi(const char
>> *name, int mode)
>> =A0 =A0 =A0 =A0int dev, vol;
>> =A0 =A0 =A0 =A0char *endptr;
>> =A0+ =A0 =A0 =A0 if (!strncmp("/dev/", name, 5))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 name =3D name + 5;
>> +
>> =A0 =A0 =A0 =A0if (name[0] !=3D 'u' || name[1] !=3D 'b' || name[2] !=3D =
'i')
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ERR_PTR(-EINVAL);
>
> Is this for the kernel?
Yes

> I do not think UBIFS should interpret the file name. =A0It should
> work off the major and minor numbers from the device node
> irrespective of what its path name or file name is.

UBIFS is currently a "nodev" filesystem, it's why I did it that way.

Using name and kern_path we can find the corresponding inode (and
major/minor informations).
But I don't see a way to open the corresponding UBI volume with only
major/minor.
ubi_open_volume use ubi_num and vol_id.
vol_id is minor()-1, but major is not related to ubi_num.

UBI have a "ubi_major2num" internally, is it ok to export this symbol ?

Thanks

--=20
Corentin Chary
http://xf.iksaif.net
