Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kD0p-00047M-QI
	for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2003 02:22:48 +0100
Message-ID: <3F3058C8.2060404@hectrix.com>
Date: Wed, 06 Aug 2003 09:24:24 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <3F2E3089.40904@hectrix.com>
	<1059992609.7431.19.camel@localhost3.localdomain>
	<3F2E38FE.8030800@hectrix.com>
	<1060093933.3861.6.camel@localhost3.localdomain>
In-Reply-To: <1060093933.3861.6.camel@localhost3.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Problems with DOC 2000 on 2.4.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I used the MAKEDEV script provided by the mtd from cvs to create the 
various device files (/dev/mtd*, /dev/nftl*, etc.) and now I can access 
my DOC2000.

But concerning the unshadowing of the DIP socket, I do have a problem. 
My Intel D845BG borad seems to be unable to detect my DOC development 
board (M-Sys' PCI EVB), and even dinfo.exe in DOS cannot detect it. But 
in Linux, I can still access it using M-Sys's Linux driver. I wonder if 
it is the shadowing problem you are talking about. Right now, I am using 
a ASUS board smoothly with DOC.

Selwyn

Roger wrote:
> On both of my 440BX boards, Intel incorporated a shadow feature which
> shadows the mtd devices (bios chip/DIP socket) from the normal mtd
> drivers/modules.
> 
> I have to utilize the openbios/devbios module/code to unshadow the 440BX
> DIP socket.
> 
> There are many other chipsets supported for unshadowing in that code.  I
> believe the code only needs to be implemented into mtd somehow.
> 
> But basically, I get nothing found in dmesg when loading the DOC modules
> and nothing showing in /proc/mtd* -- but mtdchar does show some info in
> the /proc/mtd* files.
> 
> After unshadowing the 440BX DIP socket (using openbios/devbios -- i
> hacked module to leave the DIP socket unshadowed after unloading;-), and
> then loading the mtd/doc modules,  I get 'found DOC ...' in dmesg and I
> get good info in the /proc/mtd* files. 
