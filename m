Received: from dsl-64-129-131-125.telocity.com ([64.129.131.125] helo=cfowler.linuxiceberg.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LYSO-0001mg-00
	for <linux-mtd@lists.infradead.org>; Sat, 22 Jun 2002 01:08:48 +0100
Subject: Re: X Windows Performance with DOC 2000
From: Christopher Fowler <cfowler@outpostsentinel.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.44.0206211931530.18637-100000@server.superbt.com>
References: <Pine.LNX.4.44.0206211931530.18637-100000@server.superbt.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 21 Jun 2002 20:15:23 -0400
Message-Id: <1024704926.2582.1.camel@devel>
Mime-Version: 1.0
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

Even if I could get it to work, I'm still going with CF.  M-SYS really
needs to change the name Disk on Chip to Chip on Chip.  It is not
seamless as their marketing department would like you to believe.

Chris

On Fri, 2002-06-21 at 20:01, Ilguiz Latypov wrote:
> 
> I found one message of March 6, 2002 where the MTD-patched GRUB displayed 
> the prompt.  I think this was half a success as I am an optimist :-)
> 
> I believe you did create a file system on top of NFTL layer and put the 
> /boot/grub/menu.lst configuration file there.  This file tells GRUB which 
> partition to open and which kernel to load.
> 
> The difficulties with reformatting DoC by using the M-Sys'es DFORMAT might 
> be due to grub_firmware indeed.
> 
> > So I do a dformat /win:D000 /s:DOC504.exb /FIRST /NOFORMAT /Y and I get
> > the following error:
> > 
> > Error writing EXB
> > Status code 26 (flUnknownMedia) received from flPlaceExbByBuffer.
> > Format Failed.
> 
> Perhaps, running the same utility with /s:* and without /noformat may help 
> in erasing the ext2 partitions.
> 
> See pages 5 and 7 of
> 
>     http://www.m-sys.com/files/Manuals%5Cdoc%5CDOC_Tool.pdf
> 
> Ilguiz
> 
> On 21 Jun 2002, cfowler wrote:
> 
> > #2) Grub destroyed my first DOC.  I use doc-lilo.  Everytime I flash a  
> >     new kernel on the DOC I have to re-run doc-lilo.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
