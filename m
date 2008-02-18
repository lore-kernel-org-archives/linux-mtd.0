Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRDVk-0003ee-UI
	for linux-mtd@lists.infradead.org; Mon, 18 Feb 2008 21:26:53 +0000
Date: Mon, 18 Feb 2008 22:26:21 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Frank Haverkamp <haver@vnet.ibm.com>
Subject: Re: ubi-utils: Moving mkpfi, pfiflash, ... to old-tools
In-Reply-To: <1203353343.8085.48.camel@august>
Message-ID: <alpine.LFD.1.00.0802182214000.7583@apollo.tec.linutronix.de>
References: <1203342580.8085.23.camel@august>
	<alpine.LFD.1.00.0802181656260.7583@apollo.tec.linutronix.de>
	<1203353343.8085.48.camel@august>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: "Artem B. Bityutskiy" <dedekind@oktetlabs.ru>,
	Andreas Arnez <arnez@de.ibm.com>, "Monte K. Copeland" <catboat@texas.net>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Alexander Schmidt1 <ALEXSCHM@de.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 Feb 2008, Frank Haverkamp wrote:
> Hi Thomas,
> 
> On Mon, 2008-02-18 at 17:01 +0100, Thomas Gleixner wrote:
> > I did not update for some time, but did now and noticed that my
> > packaging scripts need a real overhaul for no benefit.
> > 
> 
> I talked to Artem. He told me that the tools had deficiencies that
> prevented him using them.

I really give a sh*t whether Artem can use them or not. He is not the
center of the universe. If he needs them changed, then he should send
a patch or a suitable replacement for the tool, which does not force
others to fixup their scripts and build tools for no benefit. This is
not a sandbox, this are tools used in production environments.

Artem, please stop this nonsense right now. You can create your own
world if you have the urge to do so, but please keep stuff others use
intact. This "I don't like that old crap" attitude is an arrogant and
at the same time ignorant childish behaviour, which has no place in a
serious project.

> E.g. that he could not put the vid-hdr the
> offset he wanted it to put. He promissed me to write up the deficiencies
> so that we can work on them. I am sure that after fixing, we can move
> the tools back to their old location.

No, they go back to their place immediately, period.

Yours even more grumpy,

      tglx
