Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BzdBY-0007Zm-Vh
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2004 11:26:10 -0400
Sender: dmarlin@redhat.com
Message-ID: <412B5DE0.9862593B@redhat.com>
Date: Tue, 24 Aug 2004 10:25:20 -0500
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <412B451E.2000807@bergeron.com>
	<1093355721.14552.12456.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: can't connect to cvs.infradead.org (phoenix.infradead.org)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


David:

So have you given up on trying to get IPv4 to work again?  
Back on 24 May you said:

David Woodhouse wrote:
	:
> The CVS server, cvs.infradead.org aka phoenix.infradead.org, is
> currently IPv6-only on 2002:c1ed:8229:10:2c0:f0ff:fe31:e18 and will
> remain IPv6-only on a 64K ISDN line for the next couple of weeks until
> its new home is ready. 

It has been at least a "couple of weeks".  ;-)


d.marlin 
=========


David Woodhouse wrote:
> 
> On Tue, 2004-08-24 at 09:39 -0400, Christopher M Bergeron wrote:
> > Does anyone know why I can't connect to cvs.infradead.org?  I'm not able
> > to see it via ns0.infradead.org or ns1.infradead.org.  I've tried
> > connecting a few times in the past few months, and I always get the same
> > result.
> 
> Works for me.
> 
> PING phoenix.infradead.org(2002:c1ed:8229:10:2c0:f0ff:fe31:e18) 56 data bytes
> 64 bytes from 2002:c1ed:8229:10:2c0:f0ff:fe31:e18: icmp_seq=0 ttl=63 time=319 ms
> 
> It's IPv6-only. Get IPv6. It's trivial.
> http://yyz.us/ipv6-fc2-howto.html (which has links to non-Fedora
> howtos).
> 
> --
> dwmw2
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
