Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BlCCo-0005yd-Bq
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2004 15:47:46 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: tharbaugh@lnxi.com
In-Reply-To: <1089918851.8696.191.camel@tubarao>
References: <77A9CE908F115440B48104747E2534220D0943@email1.acopianet.com>
	<1089918851.8696.191.camel@tubarao>
Content-Type: text/plain
Message-Id: <1089920860.14567.1348.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 15 Jul 2004 20:47:41 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brad Goodman <bgoodman@acopia.com>
Subject: RE: 2.4.26 MTD Patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-07-15 at 13:14 -0600, Thayne Harbaugh wrote:
> On Thu, 2004-07-15 at 14:32 -0400, Brad Goodman wrote:
> > You are correct.
> > 
> > The patch I made was for the code that appears in 2.4.26 of the kernel.
> > 
> > The stuff in the newere (2.6.7) kernels is totally different.
> > 
> > I thought this would be a good patch for the 2.4.27 kernel,
> 
> That's a question that gets raised a lot - why is 2.4.x so far behind
> the mtd CVS tree.

Because 2.4.x is obsolete. It's getting important bug fixes only.

The 2.6 kernel, on the other hand, should be almost entirely up to date
as soon as Linus honours my request to pull from
bk://linux-mtd/bkbits.net/mtd-2.6

> I think that reasonable maintenance should be done on 2.4, however.

That makes sense. I'm not sure whether it makes sense to take a branch
in CVS from the files which are in 2.4, as I've done for JFFS2 on the
jffs2-2_4-branch, or whether we should just let people submit fixes
directly to Marcelo and not bother to keep track of them in CVS. 

I suspect the latter -- so if you can forward me the patch _without_ a
disclaimer that says I'm not allowed to read it, I'll see if it's sane
and either give you my blessing to send it to Marcelo, or ask you to fix
whatever it is that offends me about it.

-- 
dwmw2
