Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy1m5-0003nN-TW
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 03:26:27 -0400
Date: Wed, 5 Jul 2006 10:26:14 +0300
From: Ville Herva <vherva@vianova.fi>
To: linux-mtd@lists.infradead.org
Subject: block2mtd: Overrun end of disk in cache readahead
Message-ID: <20060705072614.GQ6240@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I get 
	block2mtd: Overrun end of disk in cache readahead

each time I mount a JFFS2 created with

	mkfs.jffs2 -o IMAGE -d skeleton --pad=999161856 -v
	dd if=IMAGE of=/dev/hdc2

Afaict, the fs should fit onto the device:

	du --block-size=512 --apparent-size IMAGE
	1951488 IMAGE
	blockdev --getsize /dev/hdc2             
	1951488
	blockdev --getsize /dev/mtdblock0        
	1951488

Should I leave some blocks worth of space in the end nevertheless?




-- v -- 

v@iki.fi
