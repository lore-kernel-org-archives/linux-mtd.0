Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13dPiM-0001N8-00
	for mtd-list@infradead.org; Mon, 25 Sep 2000 05:18:02 +0100
Received: from sis.com.tw ([203.67.208.2] helo=fw11.sis.com.tw)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13dPiE-0001N1-00
	for mtd@infradead.org; Mon, 25 Sep 2000 05:17:55 +0100
Message-ID: <39CED0CE.7407D992@sis.com.tw>
Date: Mon, 25 Sep 2000 12:13:02 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Andreas Micklei <ami@ivistar.de>
CC: Juergen Beisert <jbeisert@eurodsn.de>, mtd@infradead.org
Subject: Re: Choosing DiskOnChip driver
References: <3.0.6.32.20000922120218.007c5650@eurodsn.de> <20000922134751.E908@bomberman.ivistar.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Andreas Micklei wrote:
> 
> Hi,
> 
> On Fri, Sep 22, 2000 at 12:02:18PM +0200, Juergen Beisert wrote:
> > I develop a small PC board with a DiskOnChip Millenium chip. Because it should be an embedded system I do not want use a standard BIOS like desktop pc (I need a very fast boot). Instead I want load linux direct with a small ROM routine from the DiskOnChip (this small routine do the system initializing, too). So my question:
> >
> > Is this possible with the MTD software? Which parts of grub and mtd I have to use to solve it? Can anybody help me?
> 
> I asked a similar question some time ago and was referred to the following
> project:
> 
> http://freebios.sourceforge.net/
> 
> Seems like a good starting point.
> 

Yes, you are right. We have just successfully boot Linux with LinuxBIOS + Doc
Millennium on SiS 630. The whole system has only DoC Millennium as its sotrage device. No HD nor any other flash device
is required. We can even put a tiny
file system to run Microwindows "mdemo" demo program.

If things go fine, we will demo this in ALS.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
