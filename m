Received: from e31.co.us.ibm.com ([32.97.110.129])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfM0V-0007Y0-3f
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 12:35:12 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id iBHHZ5jd444752
	for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2004 12:35:06 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iBHHZ5ee306026
	for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2004 10:35:05 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	iBHHZ5J4026629
	for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2004 10:35:05 -0700
Message-ID: <41C318C8.4030702@us.ibm.com>
Date: Fri, 17 Dec 2004 11:35:04 -0600
From: Josh Boyer <jdub@us.ibm.com>
MIME-Version: 1.0
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>	
	<41C0D3AC.3050801@us.ibm.com>	
	<1103158974.15929.37.camel@squizzey.bult.co.uk>	
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>	
	<1103232128.15927.70.camel@squizzey.bult.co.uk>	
	<41C1FDFF.3020308@us.ibm.com>	
	<1103233669.15929.81.camel@squizzey.bult.co.uk>	
	<1103288058.3018.4.camel@weaponx.rchland.ibm.com>	
	<1103297611.15917.184.camel@squizzey.bult.co.uk>	
	<41C3030D.8040607@us.ibm.com>	
	<1103302002.15927.198.camel@squizzey.bult.co.uk>	
	<41C31307.70909@us.ibm.com>
	<1103304360.15914.210.camel@squizzey.bult.co.uk>
In-Reply-To: <1103304360.15914.210.camel@squizzey.bult.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gareth Bult (Encryptec) wrote:
> 
> 
> Sure, ext2 and ext3 work just fine .. however .. as far as I'm aware,
> although ext3 is log structured, it's not optimised to run in a linear
> fashion and doesn't worry about repeatedly writing to the same block ..
> which is likely to cause the USB flash controller to execute an erase
> prior to write .. which will quickly wear down the device [?!]
> 
> (Am I wrong? in which case why isn't everyone using ext3 instead of
> JFFS?)

Most of the controllers for these devices do the wear leveling 
themselves.  At least that was my understanding.

We don't deal much with these devices, so I'm not sure what everyone 
else uses.  Alot of the CF devices are FAT formatted to work with 
Windows, etc.

> 
> The other requirement of course is inline compression, which last time I
> looked ext3 didn't do out of the box (?)

No, it doesn't.  There are patches for ext2 to make it use compression 
(e2compr), but then you lose the journaling.

> 
> I'm going to deliberately wear down some blocks on a key a little later
> (at block level) to see what the OS makes of it ... (and whether it
> takes 100,000 or 1,000,000 cycles .. I see conflicting specs ..

That probably depends on the actual flash chips used within the device. 
  Not all of them use the same type of flash.

> 
> I guess the basic spec for a USB flash key (you may call them
> abominations, but you should see the sales stats!) would be;

Hey, they certainly are handy.  I'm not arguing with that :).

> 
> a. purely log structured fs with linear / circular operation
> b. write blocks aligned to 2k (or 4k might be smarter to fit with buffer
> page sizes)
> c. erase blocks @ 128k
> d. inline compression

Again, most controllers do all the wear leveling, erasing for you.  So 
you are left with compression, right?

And that is certainly a lacking thing.  A block-based, writeable, 
compressed filesystem that does journalling.  Sounds like a good 
opportunity to me :).

josh
