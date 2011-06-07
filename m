Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTyFY-0005RU-K5
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 15:31:25 +0000
Received: by fxm14 with SMTP id 14so4628358fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 08:31:22 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307432463.11104.65.camel@localhost>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-5-git-send-email-vapier@gentoo.org>
	<1307432463.11104.65.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Jun 2011 11:31:02 -0400
Message-ID: <BANLkTimY1DwxBBi=peQzqwoLktgVna-0KA@mail.gmail.com>
Subject: Re: [PATCH 5/6] mtdinfo: add regioninfo/sectormap display
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
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

On Tue, Jun 7, 2011 at 03:41, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote:
>> @@ -58,14 +60,15 @@ static const char optionsstr[] =3D
>> =C2=A0"-m, --mtdn=3D<MTD device number> =C2=A0MTD device number to get i=
nformation about\n"
>> =C2=A0"-u, --ubi-info =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0print what would UBI layout be if it was put\n"
>> =C2=A0" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on this MTD device\n"
>> +"-s, --sector-map =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0print sector map\n"
>> =C2=A0"-a, --all =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 print information about all MTD devices\n"
>> =C2=A0"-h, --help =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0print help message\n"
>> =C2=A0"-V, --version =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 print program version";
>>
>> =C2=A0static const char usage[] =3D
>> -"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-h] [-V] [--m=
tdn <MTD device number>]\n"
>> +"Usage 1: " PROGRAM_NAME " [-m <MTD device number>] [-u] [-s] [-h] [-V]=
 [--mtdn <MTD device number>]\n"
>> =C2=A0"\t\t[--ubi-info] [--help] [--version]\n"
>> -"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-h] [-V] [=
--ubi-info] [--help]\n"
>> +"Usage 2: " PROGRAM_NAME " <MTD device node file name> [-u] [-s] [-h] [=
-V] [--ubi-info] [--help]\n"
>> =C2=A0"\t\t[--version]\n"
>> =C2=A0"Example 1: " PROGRAM_NAME " - (no arguments) print general MTD in=
formation\n"
>> =C2=A0"Example 2: " PROGRAM_NAME " -m 1 - print information about MTD de=
vice number 1\n"
>> @@ -78,6 +81,7 @@ static const char usage[] =3D
>> =C2=A0static const struct option long_options[] =3D {
>> =C2=A0 =C2=A0 =C2=A0 { .name =3D "mtdn", =C2=A0 =C2=A0 =C2=A0.has_arg =
=3D 1, .flag =3D NULL, .val =3D 'm' },
>> =C2=A0 =C2=A0 =C2=A0 { .name =3D "ubi-info", =C2=A0.has_arg =3D 0, .flag=
 =3D NULL, .val =3D 'u' },
>> + =C2=A0 =C2=A0 { .name =3D "sector-map",.has_arg =3D 0, .flag =3D NULL,=
 .val =3D 's' },
>
> Is sector-map a good name?

it's what i'm used to calling it ;)

> May be we should call this feature "lock
> info" or something which suggests this is about detailed lock
> information? In this case you should also print an error message if the
> ISLOCKED ioctl is not supported. Probably adding a "islocked_supported"
> flag to 'struct mtd_info' (similarly to sysfs_supported) makes sense?
> Then you could just check this flag and refuse -s option?

honestly, i was more interested in the sector map than the ISLOCKED
info.  that was just a bonus for me.

> Also, could we avoid using term sector because it is overloaded and
> confusing. Could you please use term "eraseblock" instead (in prints and
> in internal names)?

ok

> Or you meant that this is like general per-sector info? So if we have
> more information to print, we add it there? In this case, could you
> please print "bad" or something for bad eraseblocks as well?

if MEMGETBADBLOCK provides that info, should be easy to add
-mike
