Received: from serv0.rtunet.com ([67.107.78.234])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECWNJ-0000B9-J0
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 01:52:11 -0400
From: Benny Chen <bennyc@rtunet.com>
To: David Jander <david.jander@protonic.nl>
In-Reply-To: <200509051346.54202.david.jander@protonic.nl>
References: <1125888149.24477.32.camel@Vigor4>
	<200509050845.00348.david.jander@protonic.nl>
	<ad39a30f05090501553458af6e@mail.gmail.com>
	<200509051346.54202.david.jander@protonic.nl>
Content-Type: text/plain
Message-Id: <1125985969.4419.63.camel@Vigor4>
Mime-Version: 1.0
Date: 06 Sep 2005 15:52:49 +1000
Content-Transfer-Encoding: 7bit
Cc: Leon Zhang <leoncamel@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: Mounting large JFFS2 causes other process to stop running!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,
Thanks for replying.

> I can't make up the MTD version out of your kernel version. Would it be the 
> last CVS for 2.4.x from March 2005, or older?

Yap, that is right. My mtd is quite old it is packaged with linux-2.4.21
kernel, so I checked the dates it is about 25/07/2002.  I guess
mtd-linux is not supporting 2.4.x anymore.  We will probably have to cop
this penalty until we upgrade our kernel.

Can you turn debug-level to 1 in the jffs2 (and mtd) driver and post
(relevant 
> parts of) console output here? I'm not sure if I can help, but MTD developers 
> might want to see what the kernel is busy with for so long.

Below are sniplets of the jffs2 debug level 1 message.  It loops through
the jffs2_scan_inode.node() for majority of the time.  This is also when
nothing else is running on the cpu.

Node is ino #2, version 43. Range 0x29000-0x2a000
jffs2_scan_inode_node(): Node at 0x0002ab80
Node is ino #2, version 44. Range 0x2a000-0x2b000
jffs2_scan_inode_node(): Node at 0x0002bbc4
Node is ino #2, version 45. Range 0x2b000-0x2c000
jffs2_scan_inode_node(): Node at 0x0002cc08
Node is ino #2, version 46. Range 0x2c000-0x2d000

Regards,
Benny

On Mon, 2005-09-05 at 21:46, David Jander wrote:
> On Monday 05 September 2005 10:55, Leon Zhang wrote:
> > Hi. there.
> > I confirm this bug.
> > My kernel is linux-2.4.29-vrs1-pxa1-intc4-col1. and my board CPU is PXA27x,
> > and the flash is on board flash.
> 
> I can't make up the MTD version out of your kernel version. Would it be the 
> last CVS for 2.4.x from March 2005, or older?
> 
> > I am burned a minimum jffs2 rooffs. about 2M, only a busybox in it.
> > But, if a burned a 10M size rootfs. The console respone slowly first, and
> > after a while, the console will respone nonthing.
> 
> Can you turn debug-level to 1 in the jffs2 (and mtd) driver and post (relevant 
> parts of) console output here? I'm not sure if I can help, but MTD developers 
> might want to see what the kernel is busy with for so long.
> I personally want to know if it has any relation with the architecture you are 
> running on. I have had problems in the past with 2.4.x on PowerPC and older 
> versions of MTD. Since I changed to CVS-march2005 I have not had any trouble, 
> but I want to know more, and I need to be as sure as possible that I will not 
> have any more trouble. The problem is, this kernel version is not officially 
> supported anymore by mtd developers, so we are a little bit left out in the 
> cold if there is trouble.
> 
> Best regards,
