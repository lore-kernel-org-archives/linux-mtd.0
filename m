Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OyzwZ-00010D-0h
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 04:31:31 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Mike Frysinger <vapier@gentoo.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Fri, 24 Sep 2010 05:31:26 +0100
Subject: RE: [PATCH 3/4] mtd-utils: new strtoX helpers
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093ED5FC9B@Cloud.RL.local>
In-Reply-To: <1285293221-25028-3-git-send-email-vapier@gentoo.org>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote:
> Simply usage of converting strings to numbers by adding some wrappers
> around the standard strtoX functions.  These helpers support both hex
> and dec numbers transparently, and the caller need only provide a ptr
> to an error integer if they want to be notified of problems.

> + */ +#define simple_strtoX(func, type) \
> +static inline type simple_##func(const char *snum, int *error) \ +{ \

Why inline? won't this bloat code, better to remove inline?

> +       if (snum[0] =3D=3D '0' && snum[1] =3D=3D 'x') \
> +               ret =3D func(snum, &endptr, 16); \
> +       else \
> +               ret =3D func(snum, &endptr, 10); \

Can just call strtol etc. with 0 instead of 10 or 16, it will autodetect
0xnnn as base 16.

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
