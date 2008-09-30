In-Reply-To: <OFD58EAD0A.B5E12235-ON882574D4.007AC780-882574D4.007B6DB9@selinc.com>
To: Bruce_Leonard@selinc.com
Subject: Re: UBIFS sync question
MIME-Version: 1.0
Message-ID: <OF792D2219.1FD9FBC5-ON882574D4.007D8AD7-882574D4.007DB86C@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Tue, 30 Sep 2008 15:53:12 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote on 09/30/2008 03:28:10 PM:

> Artem,
> 
> We've run into a side effect that we think is probably a design choice 
in 
> UBIFS, but we want to make sure before we start trying to troubleshoot a 

> "bug".  What we do is open an existing  file in a UBIFS formated UBI 
> volume on a NAND flash, add a few lines to it, close the file, then 
> WITHOUT un-mounting the file system, reboot the box (simulating a power 
> outage).  When the box reboots and we look at the file, it's zero length 

> and has no contents.  I suspect it's because UBIFS does less frequent 
> syncs than say ext2 for performance reasons, and we're just losing the 
> contents of the file because there's no sync before the reboot.
> 
> Is this correct or do we need to start digging for something broken?
> 
> Thanks.
> 
> Bruce
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Ummm, never mind.  Stupidity attack over.  If I would RTFM that you went 
to the trouble of writing all would be good with the world :).

Bruce
