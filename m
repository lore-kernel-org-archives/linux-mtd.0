Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18O1y8-0004fk-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 20:36:05 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: David Woodhouse <dwmw2@infradead.org>, Wolfgang Denk <wd@denx.de>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts?
Date: Tue, 17 Dec 2002 10:02:02 +1300
Cc: Paul Nash <paulnash@wildseed.com>,
	"Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
References: <20021216095652.D4D24C6139@atlas.denx.de> <18190.1040039149@passion.cambridge.redhat.com>
In-Reply-To: <18190.1040039149@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021216210640.C31D314C2B@dragon.actrix.co.nz>
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

Ooooh flash, my favourite subject.

Yup, our Intel reps also put the hard sell on us too... Remember, Intel own 
NOR flash and are losing market share as more people switch to NAND. Already, 
most new WinCE devices are using NAND instead - at least for the bulk of 
their bytes.

In general, NOR flash is expensive, slow and not very dense. 

Because it is slow, you typically need to copy the image into RAM to get 
performance. This does not apply to synchronous flash which provides better 
bandwidth.

If you're going XIP and want performance, then you need a full bus-width of 
flash. The dollars and the board space start to stack up.

Intel's flash is expensive. Figure somwhere over $1 per MB.  NAND costs 
approx 30c/MB + SDRAM approx 20c/MB.  Intel's flash thus costs approx twice 
what a NAND/RAM image does.

One NAND flash footprint can give you up to 256MB of storage. 

NOR fully sucks for any sort of writeable file system performance. NAND runs 
a very usable fs with YAFFS or JFFS2.

The only benefit I can see in NOR is a faster boot. This is becoming less of 
an issue as more designs switch to sleep/resume models.

Now that the newer NAND devices support limited direct execution of code 
we're going to see the emergence of devices that have no NOR at all. 

IMHO, XIP is the past, not the future.

-- CHarles
