Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KOIt-0005Bb-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 20:06:11 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: GRUB on DoC Millennium/2000 - Instructions
Date: Tue, 18 Jun 2002 15:03:32 -0400
Cc: linux-mtd@lists.infradead.org
References: <200206181253609.SM02488@there> <24299.1024423011@redhat.com>
In-Reply-To: <24299.1024423011@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200206181503578.SM02488@there>
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

David Woodhouse wrote:
> Mark, that's excellent documentation -- thanks. Is it OK for me to put that
> on the web site?

Absolutely!  

> I have only one suggestion -- rather than using fdisk to create a single
> partition and then formatting that as ext2, we might as well just put the
> ext2 file system on /dev/nftla (i.e. the whole device), and use (dc0) in
> Grub instead.

Agreed.  I vaguely recall questions related to multiple partitions on the DoC 
-- my thought was writing it up as one big /dev/nftla1 partition may make it 
more obvious for those wanting to extend that to nftla2, 3, etc.

> BTW, did your 'factory marked' bad blocks in step 10 really match the ones
> from step 2? I'm still suspicious of nftl_format. 

Yes, it did.  The /LOG option in DFORMAT stuffs the bad blocks, in hex, into 
a text file.  They matched the bad blocks reported by nftl_format.

> It would be _really_ nice
> if we could use DFORMAT -- either a Linux port of DFORMAT to replace
> nftl_format and/or working out how to turn our Grub image into a .EXB file
> so it can be loaded directly by DFORMAT.

The latest DFORMAT has an option "/BDKF:<boot image file>" that supposedly 
will place a boot image file in the "binary (BDK) partition".  I tried this 
with grub_firmware, and I think it actually worked.  I'll try again, and if I 
can make this work reliably, I'll post the details.

A Linux DFORMAT that would load the grub firmware and create one ext2 
partition all in one shot (like the DOS version does with the M-Sys firmware 
and FAT12 partition) would be nice!

Regards,

Mark
