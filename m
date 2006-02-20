Received: from skyhigh.actrix.co.nz ([203.96.16.175])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBJey-0003ND-00
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 17:37:39 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org, tglx@linutronix.de
Date: Tue, 21 Feb 2006 11:40:29 +1300
References: <43EB96DC.3030900@eptar.com>
	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
In-Reply-To: <1140471467.2480.793.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602211140.30069.manningc2@actrix.gen.nz>
Cc: William Watson <wjw1961@gmail.com>, Vitaly Wool <vwool@ru.mvista.com>,
	yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 21 February 2006 10:37, Thomas Gleixner wrote:
> On Tue, 2006-02-21 at 09:42 +1300, Charles Manning wrote:
> > If a system does have spare oob and can use it for ffs use, then why deny
> > it?
>
> Emphasis on "does have spare oob". Thats the whole point. You can not
> rely on that. Whats the size you need ? 1, 2, ... 16, 32 bytes? There is
> no guarantee.

Sorry Thomas I don't buy that argument. If a system has a NAND device that 
does have spare OOB available then it does have spare OOB and I can rely on 
that. If a NAND chip is soldered to a board, and the system exposes the OOB  
it is there. YAFFS (or whatever) can then be used on this device.

Just going for the lowest common denominator all the time is like saying "run 
all serial links at 9600 and never use 115200 because 115200 might not be 
supported on all possible serial links", or "you can't run an ftdi USB serial 
port at 230k because most PC serial ports only go up to 115200".

>
> > Already, many people replace nand_base.c for performance reasons. People
> > with really odd-ball hardware write theirs from scratch. I expect that
> > this will increase with the proliferaation of hardware assitance for ECC
> > or DMA etc. Writing a nand driver is not a huge mission, and is easier
> > with clean interfaces. Often people will treat nand_base.c as
> > documentation.
>
> Great. Whats the benefit for those who put effort into generic solutions
> and clean interfaces?

Generic solutions are good for those that it fits with. It does not mean that 
the generic solution is going to be good for all people all the time.  It is 
impossible to write any body of code that is the best solution to all 
possible uses. It is however possible to write code that is good enough for 
many applications.

However, good clean interfaces are even more valuable because they allow 
people to easily plug in alternative solutions that interact well with the 
rest of the system.

The benefits of good clean interfaces are modularity. If you were to write a 
nand driver from scratch that obeys the interface then you can use it with 
mtdpart, mtdconcat, various fs etc. This is the major reason I don't like to 
have oobinfo hanging through the interface.

>
> > > You mean those controllers which insert the ECC automatically at some
> > > point into the data stream ? A great example why OOB usage is not a
> > > good idea at all. These controllers guarantee data size and nothing
> > > else. I have one on my desk which does not let you use OOB, because it
> > > does all the magic itself.
> >
> > Fine, if the hw makes it into a block device or hides the OOB completely,
> > then
>
> The hardware does not make it a block device. Where did I say that ?
>
> > use it as a block device and it cannot be used with a fs that wants oob
> > areas. However, this is no longer NAND even though it might have NAND
> > inside.
>
> Err. The controller hides oob. This is still NAND with all its
> restrictions. And it does not become a block device magically.

OK I got that wrong. I don't have the specs for the device you're looking at 
so I can't see all the details.

>
> > I lose no sleep that it does not work with YAFFS.
>
> Wake up please. Thats going to be reality for NAND based stuff in the
> future. The controllers will expose the raw FLASH but claim the OOB area
> for their own purpose - hardware based error correction.

Yes that is so for a few parts like OneNAND etc as well as some modules. 
However, there's still a lot of NAND out there that will provide OOB.

So far I think I've only heard one person ask about YAFFS on OneNAND. So far I 
have not heard anyone ask for YAFFS to run on the board sitting on your desk.

Perhaps opening up YAFFS to those people would be valuable. Would you like to 
see YAFFS run on your non-oob board?

I guess it could also make YAFFS easier to use for NOR people. Currently NOR 
folks have to do quite a bit of trickery. Enough people do this for me to 
think this could be valuable.

>
> > Having said that though, I guess there is one way to make YAFFS work with
> > no OOB and that is to put the tags in the page. eg. 2048-byte page
> > becomes 2032 bytes of data and 16 bytes of tags. Possible, but would
> > drive up copying costs due to the loss of page alignment.
>
> Well, whether you like it or not. That topic has to be discussed in the
> near future.

Perhaps this might be the way things go. Thinking about this more, I think it 
would not be so hard and it would be useful for people using OneNAND etc. 
YAFFS already has an internal cache which can take care of the page alignment 
with almost no work at all.

However, if that happens I'd still like to be able to use OOB if it is there 
(just like I want to be able to use 115200 if it is there) because OOB can 
make a more efficient fs with page alignment etc.


-- Charles
