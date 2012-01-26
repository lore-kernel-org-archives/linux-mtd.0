Received: from utopia.booyaka.com ([72.9.107.138])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqSQO-0002rR-2U
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 16:43:49 +0000
Date: Thu, 26 Jan 2012 09:43:47 -0700 (MST)
From: Paul Walmsley <paul@pwsan.com>
To: Orjan Friberg <of@flatfrog.com>
Subject: Re: CONFIG_PREEMPT and JFFS2 oops
In-Reply-To: <4F218140.1070808@flatfrog.com>
Message-ID: <alpine.DEB.2.00.1201260939260.32667@utopia.booyaka.com>
References: <4F206213.9070704@flatfrog.com>
 <alpine.DEB.2.00.1201251351500.5324@utopia.booyaka.com>
 <4F2127B8.9000005@flatfrog.com> <4F213ED8.2020500@flatfrog.com>
 <alpine.DEB.2.00.1201260801410.11174@utopia.booyaka.com>
 <4F218140.1070808@flatfrog.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Woodhouse <dwmw2@infradead.org>,
 Richard Purdie <rpurdie@openedhand.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 26 Jan 2012, Orjan Friberg wrote:

> Your patch works fine in that it doesn't oops, and I'm not seeing any BUGs
> from CONFIG_DEBUG_SPINLOCK.  I haven't verified *anything else* (performance
> etc).
> 
> We've had some discussions on the linux-mtd list during the day, starting at
> http://lists.infradead.org/pipermail/linux-mtd/2012-January/039442.html if
> you're interested (though that discussion didn't result in a patch).

Thanks for the pointer, I'm not subscribed.  That's good analysis.

As Joakim pointed out, that first patch had a pretty serious bug itself.  
So perhaps if you have the time, it might be worth trying this updated 
version:

http://marc.info/?l=linux-omap&m=132759610628997&w=2


- Paul
