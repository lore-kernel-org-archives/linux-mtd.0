Received: from [212.58.137.10] (helo=trajan.ag-netcom.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFYMX-0005Xc-Rm
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 12:26:45 +0000
Received: from 192.168.0.4 (dsl-217-155-44-202.zen.co.uk [217.155.44.202])
	by trajan.ag-netcom.net (8.12.8p1/8.12.8) with ESMTP id h9VCQqRs044938
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 12:26:55 GMT
	(envelope-from david@avoncliff.com)
From: david stevenson <david@avoncliff.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 31 Oct 2003 12:25:19 +0000
References: <slrnbq4c10.qor.miernik@tarnica.ctnet.pl>
In-Reply-To: <slrnbq4c10.qor.miernik@tarnica.ctnet.pl>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200310311225.19498.david@avoncliff.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: "this device cannot be used for FTL" with a SMART PCMCIA linear
	flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 31 October 2003 9:49 am, Miernik wrote:
> I'm trying to get a "SMART Modular Technologies 4MB FAST FLASH CARD
> SM9FA2043IP280" PCMCIA linear flash Intel Series 2+ card working.

I am new round here so can not help directly with your problem, but do you 
know about wrflash utility that comes as part of the alios bootloader from
www.telos.info/ftp/linux/alios/alios-source-2.2.tar.gz
I use it to erase and write to /dev/mem0c0c.
David
