Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aw4Zj-00019c-LA
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 19:20:07 +0000
Mime-Version: 1.0
Message-Id: <a06002002bc62a398281f@[130.161.115.44]>
In-Reply-To: <1077731948.7826.792.camel@hades.cambridge.redhat.com>
References: <a06002001bc6281361918@[130.161.115.44]>
 <1077731948.7826.792.camel@hades.cambridge.redhat.com>
Date: Wed, 25 Feb 2004 20:19:54 +0100
To: David Woodhouse <dwmw2@infradead.org>
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
cc: linux-mtd@lists.infradead.org
cc: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Subject: Re: Handling multiple NAND chips -- take 2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 5:59 PM +0000 25/2/04, David Woodhouse wrote:
>Join us on IRC and tglx can heckle you too :)

Time to install an IRC client, I suppose.

<snip>

>  > * All detected devices are concatenated and represented as one large
>>  linear array of pages
>
>Look at the DiskOnChip Millennium Plus address-mangling code and
>comments above DoC_GetDataOffset().
>
>If we could support that it would perhaps be useful.

I'll have a look at it, thanks.

>  > * All devices are soldered to a motherboard. We are not interested in
>>  taking devices out of the array.
>
>Not sure. Look at how the new DiskOnChip driver has to screw around
>before the chip probing, so it can pretend this is true. T'would be nice
>to deal with a sparse array, at least.

Maybe. I don't have much of a problem of returning -EIO (or another 
more applicable error code) when higher layers access a non-present 
device. Then again, I don't see a useful response in such a scenario. 
What is a file system to do when part of the underlying (block) 
device is imply Not There ?

I'd very much like to keep this simplification. It makes the code 
much simpler: you can just rely on the fact that the array consists 
of all devices that were found during a probe. No config options 
needed, no 'raid blocks' on the NANDs.

>And if you mean hotplug -- think SmartMedia.

I'd rather not, thanks. Seriously though, I don't see many useful 
applications for a hot-swappable linear array.

Thanks,

JDB.
-- 
It was then I realized how dire my medical situation was.  Here I was,
a network admin, unable to leave, and here was someone with a broken
network.  And they didn't ask me to fix it.  They didn't even try to
casually pry a hint out of me.  -- Ryan Tucker , in the Monastery
