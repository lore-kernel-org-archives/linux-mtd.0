Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Ka1e-00068M-00
	for <linux-mtd@lists.infradead.org>; Sat, 07 Dec 2002 08:09:27 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: David Woodhouse <dwmw2@infradead.org>,
	"Chantara Thlang" <thlang@iphase.com>
Subject: Re: need arguments to use JFFS2
Date: Sat, 7 Dec 2002 21:35:15 +1300
Cc: linux-mtd@lists.infradead.org
References: <049e01c29d0f$b3c52ff0$221faf9d@iphase.com> <28792.1039171331@passion.cambridge.redhat.com>
In-Reply-To: <28792.1039171331@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021207083957.9465F14AC1@dragon.actrix.co.nz>
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

It is virtually impossible to make any firm statements without understanding 
your needs a bit better.

A few others have already covered cramfs and JFFSx. I can tell you a bit 
about YAFFS.

YAFFS only works with NAND flash. YAFFS does not provide compression (like 
JFFS does). YAFFS is faster than JFFS2 in most situations and uses less RAM.
Mileage will vary though. Compression is not necessarily a huge advantage for 
JFFSx. Some people loop-mount a cramfs image stored on YAFFS to get the 
benefits of compression as well as the faster speed for other files.

If you have NAND, then most likely YAFFS will serve you better for larger 
flash arrays (say 16MB and bigger) and JFFS2 for smaller arrays.

YAFFS will do nothing for you if you only have NOR flash.

If you're designing a new board then consider including NAND flash for 
storage (rather than NOR). NAND is cheaper, smaller (physically), bigger (in 
bytes) and faster. You can then use YAFFS or JFFS2 (even both - by 
partitioning the device).


-- Charles
