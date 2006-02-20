Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBIi9-0002yU-0x
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 16:36:50 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <200602210942.38302.manningc2@actrix.gen.nz>
References: <43EB96DC.3030900@eptar.com> <43F74BF1.1080307@ru.mvista.com>
	<1140337326.2480.674.camel@localhost.localdomain>
	<200602210942.38302.manningc2@actrix.gen.nz>
Content-Type: text/plain
Date: Mon, 20 Feb 2006 22:37:47 +0100
Message-Id: <1140471467.2480.793.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: William Watson <wjw1961@gmail.com>, Vitaly Wool <vwool@ru.mvista.com>,
	yaffs@stoneboat.aleph1.co.uk, linux-mtd@lists.infradead.org
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-02-21 at 09:42 +1300, Charles Manning wrote:
> If a system does have spare oob and can use it for ffs use, then why deny it?

Emphasis on "does have spare oob". Thats the whole point. You can not
rely on that. Whats the size you need ? 1, 2, ... 16, 32 bytes? There is
no guarantee.

> Already, many people replace nand_base.c for performance reasons. People with 
> really odd-ball hardware write theirs from scratch. I expect that this will 
> increase with the proliferaation of hardware assitance for ECC or DMA etc. 
> Writing a nand driver is not a huge mission, and is easier with clean 
> interfaces. Often people will treat nand_base.c as documentation.

Great. Whats the benefit for those who put effort into generic solutions
and clean interfaces?

> > You mean those controllers which insert the ECC automatically at some
> > point into the data stream ? A great example why OOB usage is not a good
> > idea at all. These controllers guarantee data size and nothing else. I
> > have one on my desk which does not let you use OOB, because it does all
> > the magic itself.
> 
> Fine, if the hw makes it into a block device or hides the OOB completely, then 

The hardware does not make it a block device. Where did I say that ?

> use it as a block device and it cannot be used with a fs that wants oob 
> areas. However, this is no longer NAND even though it might have NAND inside. 

Err. The controller hides oob. This is still NAND with all its
restrictions. And it does not become a block device magically.

> I lose no sleep that it does not work with YAFFS.

Wake up please. Thats going to be reality for NAND based stuff in the
future. The controllers will expose the raw FLASH but claim the OOB area
for their own purpose - hardware based error correction.

> YAFFS does not try to be all things for all people. Perhaps YAFFS4 or more 
> will not need OOB.  Sure, YAFFS **could** be redesigned to not need OOB but 
> that would make it far less effective for its core user base. There are about 
> 40 Linux filesystems out there, they each exist because they do something 
> special.

Right, but I doubt that the majority of them relies on non guaranteed
hardware features.

> Having said that though, I guess there is one way to make YAFFS work with no 
> OOB and that is to put the tags in the page. eg. 2048-byte page becomes 2032 
> bytes of data and 16 bytes of tags. Possible, but would drive up copying 
> costs due to the loss of page alignment.

Well, whether you like it or not. That topic has to be discussed in the
near future.

	tglx
