Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IuyXZ-0002QH-Sj
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 17:59:36 -0500
Date: Wed, 21 Nov 2007 23:54:25 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Gregory CLEMENT <gclement00@gmail.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
Message-ID: <20071121225425.GA24327@lazybastard.org>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
	<20071121213257.GI20871@lazybastard.org>
	<305035a40711211433x9054a11r11636ad708a325cd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <305035a40711211433x9054a11r11636ad708a325cd@mail.gmail.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 November 2007 23:33:38 +0100, Gregory CLEMENT wrote:
> 
> That's mean that we can't have safe data on NAND flash device, isn't it?
> If data is corrupted between tow read even journalized are log file
> system will loose data.
> Either there is a mechanism I missed in this file system or 2 bits
> flipped are so rare that this event can be ignored.

It means that NAND needs scrubbing.

Jörn

-- 
Joern's library part 3:
http://inst.eecs.berkeley.edu/~cs152/fa05/handouts/clark-test.pdf
