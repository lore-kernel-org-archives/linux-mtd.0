Received: from skyhigh.actrix.co.nz ([203.96.16.175])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBHov-0002b2-JG
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 15:39:48 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: tglx@linutronix.de
Date: Tue, 21 Feb 2006 09:42:38 +1300
References: <43EB96DC.3030900@eptar.com> <43F74BF1.1080307@ru.mvista.com>
	<1140337326.2480.674.camel@localhost.localdomain>
In-Reply-To: <1140337326.2480.674.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602210942.38302.manningc2@actrix.gen.nz>
Cc: William Watson <wjw1961@gmail.com>, Vitaly Wool <vwool@ru.mvista.com>,
	yaffs@stoneboat.aleph1.co.uk, linux-mtd@lists.infradead.org
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > just two small notes from my side.
> > First, FWIW, YAFFS2 never writes OOB w/o data and that looks more proper
> > than JFFS2 style which means cleanmarkers for an empty page.
> > YAFFS2 just needs means to be agnostic about how OOB bytes are placed
> > within a page.
>
> I'm not too happy about this JFFS2 oddity and I would remove it better
> today than tomorrow.

All the NAND fs (yaffs, jffs2 and [in the future] jffs3) use free oob. It is a 
very handy place to put tags/metadata/whatever you want to call it and allows 
for far faster and more efficient flash file systems.

In systems that wrap up NAND as a block device you don't run a flash file 
system.

If a system does have spare oob and can use it for ffs use, then why deny it?

>
> The agnostic thing is fine, but it still is not solving the fundamental
> flaw of oob usage at all. The only guarantee of NAND is that you can
> store data size, but the size of the "free" bytes in OOB (due to ECC,
> bad block markers ...) is non constant and depends on hardware design,
> chip types ... So any self restriction of a filesystem, block emulation
> layer or whatever user of NAND flash to a small number of bytes it wants
> to put into OOB can not cover _all_ possible constellations.
>
> The kernel can only provide generic solutions and it makes absolutely no
> sense to rely on nifty tricks which require code bloat and can not cover
> every corner case.

I think you are looking at this in the wrong way.

We should focus on **clean interfaces** rather than trying to put everything 
into nand_base.c I think nand_base.c is a pretty good generic solution for 
certain classes of nand part, but it should not try to do all things for all 
NAND. Doing so will just slow it down and make it even more complex. I don't 
think anyone wants to make nand_base.c more complex.

Analogy: in serial driver world there are a lot of devices that fit the 16550 
model of operation and it makes sense to treat them similarly and use some 
common code. However, if youwant to support an weird UART like, say, the 
Atmel running in PDC mode then this no longer makes sense. You can however 
still use the same **interfaces**.

Already, many people replace nand_base.c for performance reasons. People with 
really odd-ball hardware write theirs from scratch. I expect that this will 
increase with the proliferaation of hardware assitance for ECC or DMA etc. 
Writing a nand driver is not a huge mission, and is easier with clean 
interfaces. Often people will treat nand_base.c as documentation.

Adding the ability to read fee oob data is trival compared to the rest of the 
effort doing ECC placement etc. Of course it can't be done if the hw denies 
access, but that is another matter.

>
> > Next, I took a look at rtc_from4.c and I'm not sure how to follow this
> > method if the NAND controller just doesn't have means to give the
> > caclulated ECC back to user. Thomas, could you please elaborate on that?
>
> -ENOPARSE. What does the NAND controller do with the calculated ECC, if
> it has no way to let the user read the ECC ?
> You mean those controllers which insert the ECC automatically at some
> point into the data stream ? A great example why OOB usage is not a good
> idea at all. These controllers guarantee data size and nothing else. I
> have one on my desk which does not let you use OOB, because it does all
> the magic itself.

Fine, if the hw makes it into a block device or hides the OOB completely, then 
use it as a block device and it cannot be used with a fs that wants oob 
areas. However, this is no longer NAND even though it might have NAND inside. 
I lose no sleep that it does not work with YAFFS.

I see no point in saying that because *some* systems cannot provide oob we 
should make an effort to deny this on *all* systems. To me this is as silly 
as suggesting we ban USB or ethernet or CAN from Linux because some systems 
don't support it.

Speaking for YAFFS: For the forseeable future, YAFFS will require and use OOB, 
or an adequate simulation. (eg. the way people do YAFFS on NOR).  As NAND 
changes, there will be a need to support new encoding schemes, but that's 
largely seperated off from YAFFS.

YAFFS does not try to be all things for all people. Perhaps YAFFS4 or more 
will not need OOB.  Sure, YAFFS **could** be redesigned to not need OOB but 
that would make it far less effective for its core user base. There are about 
40 Linux filesystems out there, they each exist because they do something 
special.

Having said that though, I guess there is one way to make YAFFS work with no 
OOB and that is to put the tags in the page. eg. 2048-byte page becomes 2032 
bytes of data and 16 bytes of tags. Possible, but would drive up copying 
costs due to the loss of page alignment.

-- CHarles
