Received: from web20407.mail.yahoo.com ([216.136.226.126])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 174ZHL-0002Ve-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 May 2002 04:35:11 +0100
Message-ID: <20020506033508.1138.qmail@web20407.mail.yahoo.com>
Date: Sun, 5 May 2002 20:35:08 -0700 (PDT)
From: Zhiwei Yu <linux_vpn@yahoo.com>
Subject: Re: grub stuff
To: John Sutton <john@scl.co.uk>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <02050317250101.14339@diva.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--- John Sutton <john@scl.co.uk> wrote:
> Hi there
> 
> That's interesting!  I've been using netbooted
> diskless clients for some
> years but have never bothered to actually put a
> bootrom in a network card -
>  I just write the bootloader onto a floppy.  So I've
> no experience of
> actually booting from a real bootrom, but what you
> are saying (if I've
> understood correctly) is that a real bootrom on an
> ethercard always gets
> first bite of the cherry at boot time?  Regardless
> of the boot order
> you've configured in the BIOS setup screens? 
First thing to clarify is that, my hareware colleague
finnally use the bios code from manufactory.  In order
to cut cost, he write it into system bios instead of
bootrom, although etherboot code should work.  The
code using now locates at d0000h as bios extension and
give you an prompt to choose boot from network or
local disk.
> or the
> presence of a "grubbed"
> DiskOnChip?
Correct, but I am sure that on my box not yours. It
may depend on your bios setting
> 
> PS and very OT: After years of faffing about with
> proprietary packet
> drivers supplied by ethercard manufacturers and/or
> hoping to find a
> suitable packet driver on Russell Nelson's priceless
> www.crynwr.com, I
> recently discovered rom-o-matic.net.  Take a look at
> that!  Oh dear, the
Thank you for your recommendation!!
> time I've been a wasting...
No more wasting time, I have to work on the lcd
stuff.:) 

Zhiwei

__________________________________________________
Do You Yahoo!?
Yahoo! Health - your guide to health and wellness
http://health.yahoo.com
