Received: from dcn237-231.dcn.davis.ca.us ([168.150.237.231]
	helo=rusty.jkmicro.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LVEec-0001Ed-Es
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 00:33:12 +0000
Message-ID: <498B852E.6010809@jkmicro.com>
Date: Thu, 05 Feb 2009 16:32:46 -0800
From: Adam Yergovich <ayergo@jkmicro.com>
MIME-Version: 1.0
To: hartleys <hartleys@visionengravers.com>
Subject: Re: Access entire device with mtdblock0
References: <4967F2B2.4060405@jkmicro.com>	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>	<878wpeclf1.fsf@macbook.be.48ers.dk>	<8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com><20090114115056.GD7994@leila.ping.de>	<49839668.20502@jkmicro.com>
	<BD79186B4FD85F4B8E60E381CAEE19090120BA94@mi8nycmail19.Mi8.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19090120BA94@mi8nycmail19.Mi8.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Wolfgang Wegner <wolfgang@leila.ping.de>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hartleys wrote:
> It appears this was originally thought about for mtd partitions.
> 
> In mdtpart.c, add_mtd_partitions() has a comment above it:
> 
> /*
>  * This function, given a master MTD object and a partition table,
> creates
>  * and registers slave MTD objects which are bound to the master
> according to
>  * the partition definitions.
>  * (Q: should we register the master MTD object as well?)
>  */
> 
> Maybe it was just never revisited?
> 

Could well be, some great sleuthing there.  I think the bigger question 
is "Does calling add_mtd_device() after the partitioning has been done 
work?"

I believe the answer to this is no, though some confirmation would be a 
good idea.

If that assumption is correct, I think it should be changed to either:

1) Call it before partitioning so it does add the device.

-or-

2) Change the function such that it works any time and thus the physmap 
call should work as originally written.

I'm not familiar enough with the intended function to know though.  The 
best i can say is that it seems to behave in this way, and it appears to 
me to have been intended to behave differently.

-Adam
