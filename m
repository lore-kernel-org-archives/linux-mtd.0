Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178MB1-0003bI-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 15:24:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020516141410.72690.qmail@web21509.mail.yahoo.com> 
References: <20020516141410.72690.qmail@web21509.mail.yahoo.com> 
To: Studying MTD <studying_mtd@yahoo.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: FAT for NAND Flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 16 May 2002 15:24:17 +0100
Message-ID: <15117.1021559057@redhat.com>
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

studying_mtd@yahoo.com said:
>  1. Is it possible to use FAT filesystem with NAND Flash.

Not directly. You need to use a translation layer on the NAND flash to make 
it emulate a normal hard drive, on which you can put any normal file system.

> 2. What are the advantages and disadvantages of using FAT with NAND
> Flash.

You end up with a file system on top of another pseudo-filesystem which is 
doing the hard drive emulation for you. Ideally, both of them need to do 
their own journalling to ensure consistency at each level -- that's why 
it's better just to have a file system that's designed to run on flash.

We aren't running DOS any more. We don't need to pretend to be a hard drive 
just so that we can provide an INT 13h handler and have it 'just work'.

> 3. What is the difference between SmartMedia DOS-FAT and ordinary Fat
> filesystem. 

AFAIK nothing. SmartMedia has a translation layer just like FTL and NFTL, 
and you put a normal FAT file system on top of that.

--
dwmw2
