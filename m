Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173g0F-0005OO-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 17:33:51 +0100
Date: Fri, 3 May 2002 17:33:49 +0100
Subject: Re: grub stuff
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v481)
Cc: linux-mtd@lists.infradead.org
To: John Sutton <john@scl.co.uk>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <02050317250101.14339@diva.localdomain>
Message-Id: <8C3BA0CE-5EB3-11D6-B6D6-000502893FA1@regolith.co.uk>
Content-Transfer-Encoding: 7bit
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

On Friday, May 3, 2002, at 04:58 PM, John Sutton wrote:
> That's interesting!  I've been using netbooted diskless clients for some
> years but have never bothered to actually put a bootrom in a network 
> card -
>  I just write the bootloader onto a floppy.  So I've no experience of
> actually booting from a real bootrom, but what you are saying (if I've
> understood correctly) is that a real bootrom on an ethercard always gets
> first bite of the cherry at boot time?  Regardless of the boot order
> you've configured in the BIOS setup screens? or the presence of a 
> "grubbed"
> DiskOnChip?
>

Nnno.

It depends which order your BIOS does things in, and whether you have 
your
Grub set to extend the bootstrap int or the netboot int.  (If it's using
the netboot int, then it'll depend which order your BIOS loaded the ROMs
in.)

That said, as long as you have the grub second stage intact, there should
never be any need to do such things, as the grub command line will let
you boot the system any which way you like.  (If, like me, you're scared
of trashing your system by plugging and unplugging chips while the system
is running, then doc_loadbios should *always* be the *last* stage in the
formatting of a new DoC-  that way there will always be a working Grub.)

Jas.
