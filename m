Received: from dragon.actrix.co.nz ([203.96.16.164] helo=desire.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 191XTq-0006lh-OM
	for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2003 21:08:08 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: <jimzeus@vip.sina.com>, linux-mtd@lists.infradead.org
Date: Sat, 5 Apr 2003 08:08:24 +1200
References: <20030404062136.7806.qmail@vip.sina.com>
In-Reply-To: <20030404062136.7806.qmail@vip.sina.com>
MIME-Version: 1.0
Message-Id: <20030404200804.D416515471@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: [SPAM] FAT on NAND
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jim

As you see from David and Thomas, there is wide  agreement that FAT on NAND 
is not a good idea if you want reliable storage.

Some associates of mine using WinCE tried three different commercial 
FAT-on-NAND solutions before they gave up and moved to YAFFS for data 
integrity and speed reasons.

The easiest way to get FAT-on-NAND is to use SmartMedia. This is used by MP3 
players, cameras etc. It works OK, has wear levelling (of a sort - not 
explicit wear levelling). As Thomas says, this is not pure FAT but is very 
close and it looks like FAT from the operating system.  I would not trust it 
for any data I cared about or if I needed a fast file system.

I have had a look at what is required to get YAFFS working on Windows (98, 
2000, XP). I think this would be far easier, and give far better results, 
than trying to make FAT robust.

-- CHarles
