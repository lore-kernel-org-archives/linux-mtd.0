Received: from router.alerton.com ([206.63.253.200] helo=ls.alerton.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FOqS-0008BY-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 00:35:40 +0100
Received: from alerton.com (IDENT:roman@songdog.alerton.com [192.168.1.47])
	by ls.alerton.com (8.9.3/8.9.3) with ESMTP id QAA25321
	for <linux-mtd@lists.infradead.org>; Wed, 27 Jun 2001 16:41:11 -0700
Message-ID: <3B3A6F17.2CA185CF@alerton.com>
Date: Wed, 27 Jun 2001 16:41:11 -0700
From: Bill Roman <roman@alerton.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Block device as MTD
References: <E15FNP2-0000LQ-00@spoinky.secret.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Simon Evans wrote:
> 
> Basically it wont work. blkmtd isnt actually a driver more a translation
> layer. If you want to talk to CF cards directly, you'll have to write an
> MTD driver for it. I dont know much about CF cards as I have always used
> them as IDE drives, but you may want to look at the PCMCIA utils memory_cs
> driver. I think CF cards can appear as regular PCMCIA flash memory cards
> until a bit is enabled that puts them into IDE mode.
> 
> I tried a test once using the memory_cs driver on a CF and whilst it
> gave me some memory regions, they werent the correct size. Basically,
> you'll have to do some hacking around on the driver to get it to work
> but I dont know where to find specs for CF cards.

Compact Flash information is at http://www.compactflash.org/

A spec may be downloaded after registering at http://www.compactflash.org/specdl1.htm
