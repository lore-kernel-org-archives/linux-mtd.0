Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 192rd9-0002RX-Bw
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 12:51:11 +0100
To: Jeremy Jackson <jerj@coplanar.net>
References: <m3znp0zqaw.fsf@lnxi.com>
	<1046982052.3713.6.camel@contact.skynet.coplanar.net>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 08 Apr 2003 05:52:42 -0600
In-Reply-To: <1046982052.3713.6.camel@contact.skynet.coplanar.net>
Message-ID: <m365ppjjed.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Sender: "Eric W. Biederman" <eric@lnxi.com>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: Q: MTD and NIC Roms...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jeremy Jackson <jerj@coplanar.net> writes:

> On Thu, 2003-02-13 at 00:45, Eric W. Biederman wrote:
> > Currently I have a patch to eepro100.c that adds an MTD map driver so
> > the onboard rom can be written.  Making code like etherboot easier to
> > flash etc. 
> > 
> 
> > Anyway here is the diff with respect to the eepro100.c in 2.4.17,
> > suggestions on how to do this cleanly are welcome.
> 
> Here it is diffed against 2.4.19.  I removed the local variable ioaddr
> in eepro100_remove_one() because it caused a compile warning when
> CONFIG_MTD was not set.
> 
> Did you have any mtd chip drivers to use with it?  I'm looking at
> devbios now to port it's NOR flash chip drivers.

Sorry for the delayed reply.  

Yes.  But that one is already in jedec_probe.c 

Eric
