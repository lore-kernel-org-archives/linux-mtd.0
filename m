Received: from serverc.sea.theriver.com ([216.39.128.33])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178OB1-0003qK-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 17:32:27 +0100
Date: Thu, 16 May 2002 09:31:38 -0700 (PDT)
From: Paul <paul@oz.net>
To: David Woodhouse <dwmw2@infradead.org>
cc: Studying MTD <studying_mtd@yahoo.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: FAT for NAND Flash 
In-Reply-To: <20085.1021561697@redhat.com>
Message-ID: <Pine.LNX.4.44.0205160902230.24338-100000@localhost.localdomain>
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

On Thu, 16 May 2002, David Woodhouse wrote:

> Look at the FTL and NFTL code in drivers/mtd/ . Also look at the sddr09 
> driver for USB SmartMedia readers -- I think that has some of the actual 
> SmartMedia format implemented. 
> 
> > Are you supporting SmartMedia DOS-FAT .
> > From where i can get sources for SmartMedia DOS-FAT ,
> > Linux tree , your CVS or some where else.
> 
> We don't support the SmartMedia translation layer yet. Many people have 
> talked about implementing it; nobody's yet shown me code. There is some 
> code which may be useful in the SDDR-09 driver for USB SmartMedia readers, 
> though. 

Michael and I have been looking at the SDDR-09 driver.  I could be 
wrong, but as far as I can tell, the sddr09.c code does not grok FAT12.  
It only seems to have generic SCSI commands sent to the USB SCSI emulation 
layer (i.e. it seems to treat SmartMedia cards as generic block devices).  
I believe the actual FAT12 translation occurs in the firmware of the USB 
SmartMedia reader?

-- Paul
