Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRiPK-0002km-IG
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 10:12:11 +0000
Received: by fxm14 with SMTP id 14so4862443fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 03:12:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306917455.4405.77.camel@localhost>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<1306917381.4405.76.camel@localhost>
	<1306917455.4405.77.camel@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 1 Jun 2011 06:11:49 -0400
Message-ID: <BANLkTikha6F8GbWDNpwB4Q-v1V36ARcVVA@mail.gmail.com>
Subject: Re: [Ubi] Wrong major:minor
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Gilles <gilles.ganault@free.fr>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 1, 2011 at 04:37, Artem Bityutskiy wrote:
> On Wed, 2011-06-01 at 11:36 +0300, Artem Bityutskiy wrote:
>> On Sun, 2011-05-29 at 12:39 +0200, Gilles wrote:
>> > I used the following data to compile Ubi(fs) into a uClinux kernel:
>> >
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D device_table.txt
>> > #UBIFS nodes
>> > /dev/ubi_ctrl =C2=A0 =C2=A0 =C2=A0 c =C2=A0 =C2=A0 =C2=A0 644 =C2=A0 =
=C2=A0 0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 10 =C2=A0 =C2=A0 =C2=
=A063 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 -
>> > /dev/ubi0 =C2=A0 c =C2=A0 =C2=A0 =C2=A0 644 =C2=A0 =C2=A0 0 =C2=A0 =C2=
=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 253 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 =
0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 -
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> But I guess you may add an UBI module parameter which will ask UBI to
>> use major numbers you want - should be easy to do. E.g., if you add a
>> 'major_base=3D200' parameter then UBI will use 200:0 for ubi0, 201:0 for
>> ubi1, 200:1 for ubi0_0, 200:2 for ubi0_1, etc.
>
> Although I'm not sure - dynamic numbers were introduced because fixed
> numbers are PITA, so adding such a parameter would be a step backward.
> Not sure...

yeah, i dont think there should be.  at least nothing specific to ubi.
 perhaps a general kernel thing where you could match the registered
name to a static #, but then that wouldnt be ubi's problem.  that'd be
in the core logic and work for all devices.
-mike
