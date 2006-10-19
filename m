Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GabJw-0002e9-2S
	for linux-mtd@lists.infradead.org; Thu, 19 Oct 2006 13:04:46 -0400
Subject: Re: [PATCH] [MTD] NAND: AT91 NAND driver
From: Artem Bityutskiy <dedekind@infradead.org>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1161275075.10090.77.camel@fuzzie.sanpeople.com>
References: <1161275075.10090.77.camel@fuzzie.sanpeople.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 19 Oct 2006 20:04:34 +0300
Message-Id: <1161277474.3260.138.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: tglx@linutronix.de, savin@epico.si, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Victor,

On Thu, 2006-10-19 at 18:24 +0200, Andrew Victor wrote:
> hi,
>=20
> I'd like to resubmit the AT91 NAND driver for inclusion in the MTD tree.
>=20
> This version only differs from version posted by Savin Zlobec (20 Jun
> 2006) in that the AT91RM9200-specific chip-select / bus setup code has
> been moved from the at91_nand.c driver into the processor-specific file.

FYI, I have added your patch to my "dunno" git tree which means nothing
except that it likely won't be forgotten. Note, it doesn't mean it is
accepted! This is just to help you.

git://git.infradead.org/~dedekind/dedekind-dunno-mtd-2.6.git
http://git.infradead.org/?p=3Dusers/dedekind/dedekind-dunno-mtd-2.6.git;a=
=3Dsummary

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
