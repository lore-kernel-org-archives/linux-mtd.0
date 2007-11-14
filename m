Received: from web43142.mail.sp1.yahoo.com ([216.252.121.72])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Is5vz-00049G-Qp
	for linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 19:16:55 -0500
Date: Tue, 13 Nov 2007 16:16:32 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
To: Justin Treon <justin_treon@yahoo.com>, Nicolas Pitre <nico@cam.org>,
	Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <230770.87331.qm@web43138.mail.sp1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <313657.36128.qm@web43142.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org, Justin Treon <justin_treon@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 
> I think the following patch should satisfy everyones concerns.  It has not been
> tested.  
> 
> 1. I have added a kernel config option to enable/disable automatic unlocking.  
> 2. The automatic unlocking can be disabled for a particular partition in the map
> or
> the command line.
> For the bit mask in the map it should look like:
> .mask_flags	= MTD_POWERUP_LOCK,
>    b. mtd_parts=0x80000(bootloader)lk
Minor correction to item 2.

For the bit mask in the map it should look like:
   .mask_flags	= MTD_POWERUP_LOCK,
For the command line parsing it should look like:
   mtdparts=0x80000(bootloader)lk


> 3. This will only unlock parts with instant individual block locking.
> 



      ____________________________________________________________________________________
Be a better pen pal. 
Text or chat with friends inside Yahoo! Mail. See how.  http://overview.mail.yahoo.com/
