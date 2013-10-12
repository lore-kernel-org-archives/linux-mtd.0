Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VV2M4-0007E6-1O
 for linux-mtd@lists.infradead.org; Sat, 12 Oct 2013 16:47:52 +0000
Date: Sat, 12 Oct 2013 13:47:22 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: MTD utils v1.5.0: MEMERASE64 ioctl failed error
Message-ID: <20131012164721.GA22305@localhost>
References: <566CE8F1DB913147957287757DA6396B3E9D5FD4@DBDE04.ent.ti.com>
 <20131011222459.GQ23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131011222459.GQ23337@ld-irv-0074.broadcom.com>
Cc: Mike Frysinger <vapier@gentoo.org>, "Mukherjee, Somnath" <somnath@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "Shah, Minal" <minal.shah@ti.com>, "Parikh,
 Urmil" <urmil@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 11, 2013 at 03:24:59PM -0700, Brian Norris wrote:
> Hi Minal,
> 
> On Wed, Oct 09, 2013 at 05:05:11AM +0000, Shah, Minal wrote:
> > I am using MTD utils version 1.5.0 for DRA7 (Vayu) platform.
> > 
> > I have bad blocks in some of my NAND partitions which I am not able to erase from linux kernel.
> 
> MTD does not allow erasing bad blocks. This is prohibited by NAND
> datasheets. There are occasions where, for debugging purposes, one might
> need to erase a "bad" block that is not actually bad, but MTD does not
> provide an interface for doing this. An interface for doing so was
> discussed a while back, but nothing was merged.
> 

Ah, interesting. As you know I'm doing some very intrusive debugging
while developing the Armada driver and I usually need to circumvent
(manually) the kernel bad block erase check. Sometimes my blocks are not
really bad, yet they are detected as bad.

I'd be interesting in having some way to remove the check easily, but
since this is of no benefit, unless you're developing a crazy driver
I'm not sure how to do this.

What do you think?

Maybe some hidden /sys/kernel/debug/mtd file to turn that option, just
for the use of a developer?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
