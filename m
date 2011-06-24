Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qa7TN-0003Na-QF
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 14:35:06 +0000
Received: by iyn15 with SMTP id 15so2939590iyn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 07:34:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mxh78nai.fsf@macbook.be.48ers.dk>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<1306917381.4405.76.camel@localhost>
	<1306917455.4405.77.camel@localhost>
	<BANLkTikha6F8GbWDNpwB4Q-v1V36ARcVVA@mail.gmail.com>
	<87mxh78nai.fsf@macbook.be.48ers.dk>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 24 Jun 2011 10:33:55 -0400
Message-ID: <BANLkTimLY-EG7+3arz-w07UYYEaxLjPwSA@mail.gmail.com>
Subject: Re: [Ubi] Wrong major:minor
To: Peter Korsgaard <jacmet@sunsite.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Gilles <gilles.ganault@free.fr>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 24, 2011 at 07:46, Peter Korsgaard wrote:
>>>>>> "Mike" =3D=3D Mike Frysinger writes:
> =C2=A0>> Although I'm not sure - dynamic numbers were introduced because
> =C2=A0>> fixed numbers are PITA, so adding such a parameter would be a st=
ep
> =C2=A0>> backward. =C2=A0Not sure...
> >
> > yeah, i dont think there should be. =C2=A0at least nothing specific to
> > ubi. =C2=A0perhaps a general kernel thing where you could match the
> > registered name to a static #, but then that wouldnt be ubi's
> > problem. =C2=A0that'd be in the core logic and work for all devices.
>
> That already exists - CONFIG_DEVTMPFS.

while useful, that isnt what we were talking about.  that lets the
kernel populate /dev, that doesnt hardcode major/minor #s.
-mike
