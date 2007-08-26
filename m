Received: from fk-out-0910.google.com ([209.85.128.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IP7Ld-00053Q-5Y
	for linux-mtd@lists.infradead.org; Sat, 25 Aug 2007 21:56:27 -0400
Received: by fk-out-0910.google.com with SMTP id 19so1844991fkr
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Aug 2007 18:55:27 -0700 (PDT)
From: Jesper Juhl <jesper.juhl@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/4] mtd: cleanups and small bug fixes for init_msp_flash()
Date: Sun, 26 Aug 2007 03:52:33 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708260352.33343.jesper.juhl@gmail.com>
Cc: Denys Vlasenko <vda.linux@googlemail.com>,
	Marc St-Jean <stjeanma@pmc-sierra.com>, linux-mtd@lists.infradead.org,
	"Robert P. J. Day" <rpjday@mindspring.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here's a small series of patches to do a little cleanup + bug fixing
in drivers/mtd/maps/pmcmsp-flash.c::init_msp_flash().

The patches in this series are

 [PATCH 1/4] mtd: Don't cast kmalloc() return value in drivers/mtd/maps/pmcmsp-flash.c
 [PATCH 2/4] mtd: convert some kmalloc()+memset() calls to kcalloc() in drivers/mtd/maps/pmcmsp-flash.c
 [PATCH 3/4] mtd: Fix a potential NULL ptr deref bug and mem leak in init_msp_flash()
 [PATCH 4/4] mtd: Check for allocation failures and bail out appropriately in init_msp_flash()

Some of the patches touch the same line of code multiple times, but 
they are split this way to 
 a) to keep logical changes seperate and 
 b) to make the patch series 'git bisect' friendly 

There's still more that could be done to this function, such as 
rolling back mem allocations for devices already initialized in 
case a subsequent one fails or similar, but that will have to wait.
This is all I have time for at the moment.

Please consider merging :-)


Kind regards,
  Jesper Juhl <jesper.juhl@gmail.com>
