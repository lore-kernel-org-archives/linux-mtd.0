Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QekCX-0007ig-FM
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 08:44:50 +0000
Date: Thu, 7 Jul 2011 10:44:48 +0200
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBIFS: fix master node recovery
Message-ID: <20110707104448.7f6f0cea@wker>
In-Reply-To: <1310025429.3149.133.camel@sauron>
References: <1309944626-30195-1-git-send-email-agust@denx.de>
	<1310019990.3149.105.camel@sauron> <20110707094324.24128229@wker>
	<1310025429.3149.133.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 07 Jul 2011 10:57:05 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2011-07-07 at 09:43 +0200, Anatolij Gustschin wrote:
> > Yes, in our case we have 511 valid master nodes + 384 bytes free
> > space in LEB 2 and one valid master node in LEB 1 + free space.
> > 
> > > What we want to check is that there is no room for another master node
> > > in the second LEB. We have to take offs2, add sz, and make sure that LEB
> > > size minus that is less than sz, i.e., exactly what you have done.
> > > 
> > > And  offs2 + sz >= c->leb_size seems to be completely incorrect and
> > > should be removed, AFAICS. Can you confirm that?
> > 
> > Yes, offs2 + sz >= c->leb_size check is not correct, I think.
> 
> I also think so. Could you send v2 of your patch - kill the incorrect
> check and add your correct check instead.

Thinking more about this I can imagine the situation where
off2 + sz == c->leb_size condition is true (depending on LEB size,
node alignment, etc.), so we should check for this condition also.
off2 + sz > c->leb_size can't be the case since off2 is the offset
of a valid node. So we should check for
off2 + sz == c->leb_size || (c->leb_size - offs2 - sz) < sz.

> I do not have time for testing this now, so I'd ask you go test it. But
> I realize that power cut testing can take a lot of time, and your patch
> looks right to me, so I'm happy to take your patch right away, but I'd
> anyway ask you to conduct some testing anyway and inform about your
> results later.
> 
> BTW, you can try the power cut emulation testing. If you care a lot
> about power-cut robustness, it is helpful. The integck test now can do
> power cut emulation testing with UBIFS. But there still some small
> issues, though.

Thanks,
Anatolij
