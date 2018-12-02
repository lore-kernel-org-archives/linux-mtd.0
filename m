Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTSe0-0007OO-Uk
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 14:22:50 +0000
Date: Sun, 2 Dec 2018 15:22:32 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial erase issue
In-Reply-To: <20181202082918.3b5f303a@bbrezillon>
Message-ID: <alpine.DEB.2.21.1812021519300.3969@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1811292207570.1657@nanos.tec.linutronix.de>
 <20181202082918.3b5f303a@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2 Dec 2018, Boris Brezillon wrote:
> First of all, I'd like to thank you for sharing this patch. I'm
> pretty sure this will save days of painful debug sessions to a lot of
> people.

Yeah. It's painful because it's a sporadic failure.

> On Thu, 29 Nov 2018 22:12:50 +0100 (CET)
> Thomas Gleixner <tglx@linutronix.de> wrote:
> > P.S.: This was debugged on an older kernel version (sigh) and ported
> >       forward without actual testing on mainline. My MTD foo is a bit
> >       rusty, so I won't be surprised if there are better ways to do that.
> 
> Let's first wait for Bean's feedback before discussing implementation
> details. BTW, do you remember the part number(s) of the flash(es)
> impacted by this problem in your case?

MT29F8G08 is one of them. The other one I can't tell right now due to
traveling.

Thanks,

	Thomas
