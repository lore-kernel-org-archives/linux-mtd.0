Received: from fep15.mx.upcmail.net ([62.179.121.35])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RGBc8-0004Dz-9o
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 15:30:01 +0000
Received: from edge01.upcmail.net ([192.168.13.236]) by viefep15-int.chello.at
	(InterMail vM.8.01.02.02 201-2260-120-106-20100312) with ESMTP
	id <20111018152952.ZEDK1538.viefep15-int.chello.at@edge01.upcmail.net>
	for <linux-mtd@lists.infradead.org>; Tue, 18 Oct 2011 17:29:52 +0200
Message-ID: <4E9D9B6A.6010902@swissonline.ch>
Date: Tue, 18 Oct 2011 17:29:46 +0200
From: Daniel Kuhn <cheeef@swissonline.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS recovery fails
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
In-Reply-To: <1318882668.2172.10.camel@koala>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for the immediate responses.

> If you just have precious data which you need - I think:
> 1. Make a dump of the flash.
> 2. Verify that on another device you can flash it and reproduce this
> issue.
> 3. Just hack the function in kernel that fails to return 0 instead
> of error for that case, and I think you will be able to mount your
> flash and copy your data.

Luckily I could restore the data on the volume (a single file) after 
some tests with
various code changes. Finally I succeeded by uncommenting the journal 
replay function call in the file "super.c". Changing return codes to 
zero in several other places lead to new errors in other code parts.

> This issue looks like one of the MLC-specific ones. Unfortunately,
> no one really invested time into making UBIFS support MLC very well.
> It needs some more work. It also have some issues related to unstable
> bits in modern SLC.
>
The NAND Flash I'm using is a Samsung SLC NAND K9WBG08U1M. So this isn't 
MLC-specific.
It seems strange to me that a whole data block gets empty during 
operation or as a result of a power failure. The device on which this 
error occured is a prototype on which I run various tests during 
development and the original bad block markers from the manufacturer 
were overwritten by low level tests with an embedded FPGA-Softcore CPU. 
So maybe the failed LEB 3550 was originally a bad eraseblock but I can't 
tell for sure.

Any further ideas to improve the UBIFS data security is really appreciated.

Thanks,
Daniel Kuhn
