Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16rxDk-0001G1-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2002 09:31:20 +0100
Date: Mon, 1 Apr 2002 10:31:17 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: jg zhao <zhao8116@yahoo.com.cn>
Cc: linux-mtd@lists.infradead.org
Subject: Re: About 28f320c3
Message-ID: <20020401103117.B18676@wohnheim.fh-wedel.de>
References: <20020401012946.28635.qmail@web15003.mail.bjs.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020401012946.28635.qmail@web15003.mail.bjs.yahoo.com>; from zhao8116@yahoo.com.cn on Mon, Apr 01, 2002 at 09:29:46AM +0800
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

Hi!

>   I have some questions about the TE28F320C3TA110. I
> configed it as a intel CFI chip. The size of it is
> 4M,and the address is from 1000000 to 1400000. 1100000
> to 1200000 is my kernel code and I want to put my jffs
> to the 1300000-1380000. My kernel burned and running
> is OK. But when I add the MTD into it ,after this
> message:
>        
>   physmap flash device: 80000 at 1300000  
> 
> my board was dead. The  kernel is running from the
> flash . The code and jffs is on the same chip.Did it
> work?Thanks for giving me some suggestion!

(Doing this from memory, better check it yourself)

The message you quoted it printed out before the actual probing takes
place. There will be another message, if either the probing fails or
it detects more than one chip in the provided range. It will not
however print another message, if all goes well.
You should edit drivers/mtd/maps/physmap.c and add an unconditional
printk after the ioremap and after the actual probe, to see, which one
fails. My bet is the ioremap.

Jörn

-- 
Release early. Release often. And listen to your customers.
-- Eric Raymond in "The cathedral and the bazaar"
