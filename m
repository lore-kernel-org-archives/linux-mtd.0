Received: from [61.5.4.148] (helo=enterprise.terasign.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tinW-000852-00
	for <linux-mtd@lists.infradead.org>; Sat, 06 Apr 2002 06:31:35 +0100
Message-ID: <01C1DD63.67C132A0@SENLIANG>
From: Sulung Chang <sulung@terasign.com>
To: 'Stephen Bardsley' <sbardsley@rlwinc.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: bad block recovery 
Date: Sat, 6 Apr 2002 12:05:35 +0700
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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


Sorry to bother you all,

	Stephen seems like I've the same problem that you have , I'm already tried using nftl_format , and about the verifying things
	I've get rid of it, but I got a new ERROR Message :
	" Invalid ioctl 80404d01 ( MEMGETINFO = 80204d01)
	   ioctl ( MEMGETINFO): Invalid argument "

	I'm using  DoC Millenium 8MB with M-Sys PCI Eval Board, kernel 2.4.5 

	The BIOS and kernel can't detect DoCMillenium on boot, before I'm using erase_all or nftl_format ( I forget ) , it detects Ok.
	
	I'm appreciate your help, thanks.



	Sulung

-----Original Message-----
From:	Stephen Bardsley [SMTP:sbardsley@rlwinc.com]
Sent:	Monday, March 18, 2002 10:51 PM
To:	David Woodhouse
Cc:	linux-mtd@lists.infradead.org
Subject:	RE: bad block recovery 

> sbardsley@rlwinc.com said:
> >  I took a quick look at the code and see that meminfo.erasesize is
> > used to scale various values.  I don't see why 8Kb is a limit.  I have
> > found that my chip's erase size to be 16Kb; is there any way for me to
> > use nftl_format? If necessary, I don't mind modifying the code, but I
> > don't want to screw it up.  Any hints? 
> 
> You _ought_ to be able to just remove that check, if you first verify that 
> we'll do the right thing through the rest of the code rather than using a 
> hardcoded 8KiB. I put the check in just because I'd never tested the larger 
> erase size.

I don't know a great deal about this stuff, but the code seems to want to do
the "right thing".  So I removed the 8Kb check, and ntfl_format is running as
I write this; so far so good.

BTW -- It might be good to add a note to the FAQ regarding nftl_format and
driver debug options.  Debugging causes the format to crawl.  On my hardware
it is the difference between 20 minutes (without debug) and 4 hours (with debug)
(estimated times).

Thanks again.

Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
