Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aTMK-0004lZ-00
	for mtd-list@infradead.org; Wed, 07 Mar 2001 02:07:24 +0000
Received: from stm.lbl.gov ([131.243.16.51] ident=mail)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aTMI-0004lT-00
	for mtd@infradead.org; Wed, 07 Mar 2001 02:07:23 +0000
Date: Tue, 6 Mar 2001 18:07:00 -0800
From: David Schleef <ds@schleef.org>
To: Robert Kaiser <rob@sysgo.de>
Cc: mtd@infradead.org
Subject: Re: Using mtdblock as root device
Message-ID: <20010306180700.A5214@stm.lbl.gov>
Reply-To: David Schleef <ds@schleef.org>
References: <01030613110600.01913@rob> <7121.983884306@redhat.com> <01030614494400.02338@rob>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01030614494400.02338@rob>; from rob@sysgo.de on Tue, Mar 06, 2001 at 02:37:48PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, Mar 06, 2001 at 02:37:48PM +0100, Robert Kaiser wrote:
> Hi,
> 
> On Die, 06 Mär 2001 you wrote:
> > It's been submitted many many times. If you do submit it again, please add 
> > nftl[bcd] and ftl[abcd] too, and I don't think you actually need anything 
> > more than
> > 	{"mtdblock", 0x1f00},
> > 
> > for the mtdblock devices, because they're handled just like partitions.
> 
> Hmm, I for one have two mtd devices on my platform, both of which I'd like
> to be able to use as root device. But I agree that 16 is probably a bit
> overkill. How about:
> 
> 	{"mtdblock0", 0x1f00},
> 	{"mtdblock1", 0x1f01},
> or:
> 	{"mtdblock", 0x1f00},
> 	{"mtdblock0", 0x1f00},
> 	{"mtdblock1", 0x1f01},


Just {"mtdblock", 0x1f00} will suffice, because any number
appended will be converted to an integer and be added to the
base number given.

Check the implementation of name_to_kdev_t in init/main.c for
details.



dave...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
