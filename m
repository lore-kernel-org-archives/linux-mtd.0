Received: from mail13.speakeasy.net ([216.254.0.213] helo=mail.speakeasy.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kJCn-0004zQ-9k
	for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2003 08:59:33 +0100
From: Roger <rogerxxmaillist@speakeasy.net>
To: Selwyn Tang <selwyn@hectrix.com>, linux-mtd@lists.infradead.org
In-Reply-To: <3F3058C8.2060404@hectrix.com>
References: <3F2E3089.40904@hectrix.com>
	 <1059992609.7431.19.camel@localhost3.localdomain>
	 <3F2E38FE.8030800@hectrix.com>
	 <1060093933.3861.6.camel@localhost3.localdomain>
	 <3F3058C8.2060404@hectrix.com>
Message-Id: <1060156541.4912.9.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 06 Aug 2003 00:55:41 -0700
Content-Type: text/plain
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

On Tue, 2003-08-05 at 18:24, Selwyn Tang wrote:
> I used the MAKEDEV script provided by the mtd from cvs to create the 
> various device files (/dev/mtd*, /dev/nftl*, etc.) and now I can access 
> my DOC2000.
> 
> But concerning the unshadowing of the DIP socket, I do have a problem. 
> My Intel D845BG borad seems to be unable to detect my DOC development 
> board (M-Sys' PCI EVB), and even dinfo.exe in DOS cannot detect it. But 
> in Linux, I can still access it using M-Sys's Linux driver. I wonder if 
> it is the shadowing problem you are talking about. Right now, I am using 
> a ASUS board smoothly with DOC.

yup. the mtd device will remain invisible until unshadowed.  even the
dos utilites fail to see the mtd device (or bios DIP socket with DOC
inserted).

funny. i never tried the msys binary drivers that they provide -- i
believe that i was concerned i was using something out-dated and/or
wouldn't work with my kernel versioning.  maybe i should try it since
you've said you have had success with it. odd.

> 
> Selwyn
> 
> Roger wrote:
> > On both of my 440BX boards, Intel incorporated a shadow feature which
> > shadows the mtd devices (bios chip/DIP socket) from the normal mtd
> > drivers/modules.
> > 
> > I have to utilize the openbios/devbios module/code to unshadow the 440BX
> > DIP socket.
> > 
> > There are many other chipsets supported for unshadowing in that code.  I
> > believe the code only needs to be implemented into mtd somehow.
> > 
> > But basically, I get nothing found in dmesg when loading the DOC modules
> > and nothing showing in /proc/mtd* -- but mtdchar does show some info in
> > the /proc/mtd* files.
> > 
> > After unshadowing the 440BX DIP socket (using openbios/devbios -- i
> > hacked module to leave the DIP socket unshadowed after unloading;-), and
> > then loading the mtd/doc modules,  I get 'found DOC ...' in dmesg and I
> > get good info in the /proc/mtd* files. 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 

Roger
http://www.eskimo.com/~roger/index.html
