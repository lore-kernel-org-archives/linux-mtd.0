Received: from tomts10.bellnexxia.net ([209.226.175.54] helo=tomts10-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LYKy-0001lT-00
	for <linux-mtd@lists.infradead.org>; Sat, 22 Jun 2002 01:01:08 +0100
Date: Fri, 21 Jun 2002 20:01:06 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: cfowler <cfowler@outpostsentinel.com>
cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: X Windows Performance with DOC 2000
In-Reply-To: <1024669698.7895.19.camel@moses.outpostsentinel.com>
Message-ID: <Pine.LNX.4.44.0206211931530.18637-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I found one message of March 6, 2002 where the MTD-patched GRUB displayed 
the prompt.  I think this was half a success as I am an optimist :-)

I believe you did create a file system on top of NFTL layer and put the 
/boot/grub/menu.lst configuration file there.  This file tells GRUB which 
partition to open and which kernel to load.

The difficulties with reformatting DoC by using the M-Sys'es DFORMAT might 
be due to grub_firmware indeed.

> So I do a dformat /win:D000 /s:DOC504.exb /FIRST /NOFORMAT /Y and I get
> the following error:
> 
> Error writing EXB
> Status code 26 (flUnknownMedia) received from flPlaceExbByBuffer.
> Format Failed.

Perhaps, running the same utility with /s:* and without /noformat may help 
in erasing the ext2 partitions.

See pages 5 and 7 of

    http://www.m-sys.com/files/Manuals%5Cdoc%5CDOC_Tool.pdf

Ilguiz

On 21 Jun 2002, cfowler wrote:

> #2) Grub destroyed my first DOC.  I use doc-lilo.  Everytime I flash a  
>     new kernel on the DOC I have to re-run doc-lilo.
