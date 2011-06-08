Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUNSR-0002Bv-41
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 18:26:24 +0000
Received: by fxm14 with SMTP id 14so715064fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 11:26:21 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307540151.31223.85.camel@localhost>
References: <1307427548-29306-5-git-send-email-vapier@gentoo.org>
	<1307461999-6483-1-git-send-email-vapier@gentoo.org>
	<1307540151.31223.85.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 8 Jun 2011 14:26:01 -0400
Message-ID: <BANLkTinQMzCWy+1nWf5ev4VJW-2kOfoQ7g@mail.gmail.com>
Subject: Re: [PATCH v2] mtdinfo: add regioninfo/eraseblock map display
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

On Wed, Jun 8, 2011 at 09:35, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 11:53 -0400, Mike Frysinger wrote:
>> @@ -110,6 +114,10 @@ static int parse_opt(int argc, char * const argv[])
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 warnmsg("-m/--mtdn is depecated, will be removed in mtd-utils-1.4.6"=
);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;
>>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 'M':
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
args.map =3D 1;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
break;
>> +
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 'h':
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 printf("%s\n\n", doc);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 printf("%s\n\n", usage);
>
> Would you also please add the following code near the end of the
> 'parse_opt()' function:
>
> + =C2=A0 =C2=A0 =C2=A0 if (args.map && !args.node)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return errmsg("-M requ=
ires MTD device node name");
>
> This will anyway be true when we remove -m, a the checks like "if
> (args.node)" will be not needed.

the -a/--all option will need reworking, but that'll have to happen
anyways once we punt -m

>> @@ -196,8 +235,26 @@ static int print_dev_info(libmtd_t libmtd, const st=
ruct mtd_info *mtd_info, int
>> =C2=A0 =C2=A0 =C2=A0 if (mtd.oob_size > 0)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf("OOB size: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=
d bytes\n",
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mtd.oob_size);
>> - =C2=A0 =C2=A0 if (mtd.region_cnt > 0)
>> + =C2=A0 =C2=A0 if (mtd.region_cnt > 0) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf("Additional eras=
e regions: =C2=A0 =C2=A0 =C2=A0 %d\n", mtd.oob_size);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (args.node)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
fd =3D open(args.node, O_RDONLY | O_CLOEXEC);
>
> We do want to print error message if open fails. E.g., I use -M and I do
> not see any eraseblock map - because I am not root!
>
> If open fails, we need to print something like "cannot fetch information
> about regions - error blah (blah blah)". And may be we can just
> continue.

i can add a warning when the open() fails

i have some ideas for the rest, so i'll just send a new patch which
should make us both happy i think
-mike
