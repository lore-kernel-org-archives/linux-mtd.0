Received: from web50802.mail.yahoo.com ([206.190.38.111])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bad2r-0008Rn-6Z
	for linux-mtd@lists.infradead.org; Wed, 16 Jun 2004 12:13:55 -0400
Message-ID: <20040616161345.33330.qmail@web50802.mail.yahoo.com>
Date: Wed, 16 Jun 2004 09:13:45 -0700 (PDT)
From: Slim <slimaffi@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E1BacpZ-0008CJ-KT@canuck.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH] Towards DiskOnChip support as a NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'd like to help test the driver for DOC 2000 dip, but I have a few
questions.  

>     - Add bad block table (read-only) support for INFTL-based devices
> (only
> 2000TSOP for the moment)

Is the doc2000 dip NFTL or INFTL?  With read only support, would I be
able to create a filesystem to read?

>     - Add hardware ECC support for DOC2000 and Millenium/2000TSOP
> (only
> tested on 2000TSOP and needs more testing!)

ECC - hardware error correction by the device?  Is this an optional
enable in the driver?

> Please realize that this needs a lot more testing.  I still haven't
> gotten
> JFFS2 to run properly with this 

Does it support other filesystems (ext2/3)? 

> Enjoy!

Thanks to everyone working on this.  I've needed a driver for doc2000
dip devices for a couple years now.

Slim



		
__________________________________
Do you Yahoo!?
Take Yahoo! Mail with you! Get it on your mobile phone.
http://mobile.yahoo.com/maildemo 
