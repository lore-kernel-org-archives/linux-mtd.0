Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gvU6-0007pi-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 22:54:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010911205853.21285.qmail@qis> 
References: <20010911205853.21285.qmail@qis>  <20010911201345.19481.qmail@qis> <20010911182623.15217.qmail@qis> <8583.1000239450@redhat.com> <9772.1000243426@redhat.com> 
To: "Nikolai Vladychevski" <niko@isl.net.mx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: duplicate DoC millenium with dd 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 Sep 2001 23:00:24 +0100
Message-ID: <10449.1000245624@redhat.com>
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

niko@isl.net.mx said:
>  yes, this is the problem... right now I'm leaving 1 Meg for the
> linuxBIOS  and kernel and right now there is left as little as 40 K
> bytes free space of  that meg. 

Use modules?


>  If I update the  software on the chip once a week (it's an automatic
> update via remote  server), will it survive for 2 years without
> errors, for example ?  

It doesn't degrade over time. Using it the first time may lose the 
bad-block information which is put on it by the NAND flash chip 
manufacturer (Toshiba or Samsung, not M-Systems). After that there's no 
difference.

>  Wow! that sounds cool! I have to try it, but would linuxBIOS conflict
> with  it?  

No, should be fine. You could have it appear as three MTD devices - one for 
LinuxBIOS, one for the kernel, and one for cramfs.

Using cramfs directly on the NAND flash gives you no error correction and 
no facility to work around bad blocks. I wouldn't wan to do it like that in 
production, although in practice it'll work unless you have a chip with bad 
blocks.

--
dwmw2
