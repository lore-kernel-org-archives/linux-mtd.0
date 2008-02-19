Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JROtV-0003wV-Gv
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 09:36:10 +0000
Subject: Re: ubi-utils: Moving mkpfi, pfiflash, ... to old-tools
From: Artem Bityutskiy <dedekind@infradead.org>
To: haver@vnet.ibm.com
In-Reply-To: <1203353343.8085.48.camel@august>
References: <1203342580.8085.23.camel@august>
	<alpine.LFD.1.00.0802181656260.7583@apollo.tec.linutronix.de>
	<1203353343.8085.48.camel@august>
Content-Type: text/plain; charset=utf-8
Date: Tue, 19 Feb 2008 11:34:17 +0200
Message-Id: <1203413657.3758.25.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "Artem B. Bityutskiy" <dedekind@oktetlabs.ru>,
	"Monte K. Copeland" <catboat@texas.net>, Andreas Arnez <arnez@de.ibm.com>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alexander Schmidt1 <ALEXSCHM@de.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-02-18 at 17:49 +0100, Frank Haverkamp wrote:
> I talked to Artem. He told me that the tools had deficiencies that
> prevented him using them. E.g. that he could not put the vid-hdr the
> offset he wanted it to put. He promissed me to write up the deficiencies
> so that we can work on them. I am sure that after fixing, we can move
> the tools back to their old location.
>=20
> Of course it would be nice, if we could move the tools back even before
> the fixup, to avoid changing our build scripts. Let us discuss that with
> Artem tomorrow.

I can return the tools to the state they were before I touched them, is
it OK for you?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
