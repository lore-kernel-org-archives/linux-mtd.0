Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M49zP-0006gQ-HZ
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 08:39:06 +0000
Received: by rv-out-0708.google.com with SMTP id c5so385447rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 May 2009 01:38:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1242202348.27996.165.camel@localhost.localdomain>
References: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-2-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-3-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-4-git-send-email-corentincj@iksaif.net>
	<1242202348.27996.165.camel@localhost.localdomain>
Date: Wed, 13 May 2009 10:38:55 +0200
Message-ID: <71cd59b00905130138t7fc974ffub5efb8c78198388e@mail.gmail.com>
Subject: Re: [PATCH 3/3] mkfs.ubifs: use libubi to format UBI volume
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 13, 2009 at 10:12 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> Hi,
>
> On Sat, 2009-05-09 at 11:41 +0200, Corentin Chary wrote:
>> libubi is now used to format directly UBI volume.
>> Typing mkfs.ubifs /dev/ubi0_0 is now possible.
>> dtypes should be ok as they are taken from UBIFS code.
>
> Did you test that this works fine on UBI volume and there
> are no regressions when you output to a file?

I did some test with and without --root, it worked fine.
But I'll do some more test with the corrected patch.

>> =A0static const char *helptext =3D
>> -"Usage: mkfs.ubifs [OPTIONS]\n"
>> +"Usage: mkfs.ubifs [OPTIONS] [device]\n"
>> +"Example: mkfs.ubifs ubi0:test\n"
>> +" =A0 =A0 =A0 =A0 mkfs.ubifs -r /opt/img ubi0:test\n"
>> +" =A0 =A0 =A0 =A0 mkfs.ubifs -m 512 -e 128KiB -c 100 -r /opt/img -o ubi=
fs.img\n\n"
>> =A0"Make a UBIFS file system image from an existing directory tree\n\n"
>> =A0"Options:\n"
>> =A0"-r, -d, --root=3DDIR =A0 =A0 =A0 build file system from directory DI=
R\n"
>
> I think some more text in the help output which says you may direct
> the result to either a file or UBI volume would be nice to have.

Yep, and the first example is not valid anymore as this patch don't
handle "ubi:<name>" format.

>> @@ -357,11 +362,9 @@ static int validate_options(void)
>> =A0{
>> =A0 =A0 =A0 int tmp;
>>
>> - =A0 =A0 if (!root)
>> - =A0 =A0 =A0 =A0 =A0 =A0 return err_msg("root directory was not specifi=
ed");
>> =A0 =A0 =A0 if (!output)
>> - =A0 =A0 =A0 =A0 =A0 =A0 return err_msg("no output file specified");
>> - =A0 =A0 if (in_path(root, output))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return err_msg("no output file or UBI volume s=
pecified");
>> + =A0 =A0 if (root && in_path(root, output))
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return err_msg("output file cannot be in the=
 UBIFS root "
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"directory");
>
> Why you removed
>
> if (!root)
> =A0 =A0 =A0 =A0return err_msg("root directory was not specified");
>
> ?

Because I wanted mkfs.ubifs to work without this parameter, like other mkfs=
.*.
I know mounting an empty volume will works, but we should also be able
to use mkfs.ubifs to format
empty volumes.


> The comments are incorrect. 'ubi_get_vol_info()' does not depend on the
> name of the file at all. It looks at device's major/minor, then looks up
> the information in sysfs.

Yep, I forget to rewrite the comments.

>> =A0/**
>> - * write_leb - copy the image of a LEB to the output file.
>> + * write_leb - copy the image of a LEB to the output target
>
> You removed the "." from the end :-)

Oups ....

>> +
>> =A0/**
>> =A0 * write_empty_leb - copy the image of an empty LEB to the output fil=
e.

Write empty leb to the target, wich can be a file or an UBI volume ..
I'll clarify that.

>> @@ -1011,8 +1064,6 @@ static int add_inode_with_data(struct stat *st, in=
o_t inum, void *data,
>> =A0 =A0 =A0 ino->mtime_nsec =3D 0;
>> =A0 =A0 =A0 ino->uid =A0 =A0 =A0 =A0=3D cpu_to_le32(st->st_uid);
>> =A0 =A0 =A0 ino->gid =A0 =A0 =A0 =A0=3D cpu_to_le32(st->st_gid);
>> - =A0 =A0 ino->uid =A0 =A0 =A0 =A0=3D cpu_to_le32(st->st_uid);
>> - =A0 =A0 ino->gid =A0 =A0 =A0 =A0=3D cpu_to_le32(st->st_gid);
>> =A0 =A0 =A0 ino->mode =A0 =A0 =A0 =3D cpu_to_le32(st->st_mode);
>> =A0 =A0 =A0 ino->flags =A0 =A0 =A0=3D cpu_to_le32(use_flags);
>> =A0 =A0 =A0 ino->data_len =A0 =3D cpu_to_le32(data_len);
>
> Why the 2 lines are removed?

Theses should have been removed in another patch, but look, they are
here twice =3D).

>> +static int check_volume_empty()
> check_volume_empty(void)
>
> Comments are untidy.

Oups ..

>
> Yeah, I think you should either ask the user, or just refuse
> writing to it. Users may just 'ubiupdatevol -t' to erase the
> volume before invocating mkfs.ubifs.
>
> Probably it is easier for now to just remove whole
> 'erase_volume()' ?
>
mkfs.ext{2/3/4} and mkfs.vfat don't ask for confirmation
I believe mkfs.reiserfs does.
But I won't hurt to ask.
Maybe first we can remove erase_volume(), and then, in another patch,
add erase volume with confirmation.


New patch is comming at the end of the week ...
--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org
