Received: from rwcrmhc51.attbi.com ([204.127.198.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17luSg-0005yr-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2002 17:54:02 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: 48meg DOC
Date: Mon, 2 Sep 2002 12:52:08 -0400
Cc: Henrik =?iso-8859-1?q?Nordstr=F6m?= <hno@marasystems.com>,
 linux-mtd@lists.infradead.org
References: <20020902132838.NFAO11061.sccrmhc01.attbi.com@there> <Pine.LNX.4.44.0209011654210.31089-100000@filer.marasystems.com> <8501.1030982130@redhat.com>
In-Reply-To: <8501.1030982130@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020902165330.BHCJ12451.rwcrmhc51.attbi.com@there>
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

Yes, I was experimenting with using DFORMAT to load Grub around the time I 
wrote up the DoC/GRUB Howto.

Henrik is correct that "dformat /win:xxxx /BDKF0:grub_firmware" will install 
GRUB properly, but the UnitSizeFactor issue confuses the NFTL code in Grub.  
I haven't found an easy way to format using version 4.2 and install the grub 
code at the same time.

When the UnitSizeFactor issue is resolved, we should be able to use DFORMAT 
to install GRUB, and doc_loadbios would no longer be needed.  We probably 
wouldn't even need to generate a .EXB file, as the /BDKF option seems to be 
OK with grub_firmware in its raw binary format.

If the UnitSizeFactor thing has been fixed in the latest CVS code, I'd be 
glad to apply the changes to the GRUB code.  If not, can you point us in the 
right direction to fix it?  

David Woodhouse wrote:
> mark@lakeshoremicro.com said:
> >  I have not found a reliable way to use DFORMAT to load the Grub
> > firmware.
>
> Oh, have you been trying? At first glance it looked like it should be
> fairly simple to generate a .EXB file with our Grub in it instead of their
> firmware -- are there problems?
>
> Being able to use DFORMAT to load Grub would be very useful.
