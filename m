Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Gsy9-0004Uv-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Nov 2002 03:34:33 +0000
Date: Wed, 27 Nov 2002 05:05:00 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: fred <fred@sc23.sc.mcel.mot.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: does compressed JFFS filesystem need ramdisk?
Message-ID: <20021127040500.GB15709@wohnheim.fh-wedel.de>
References: <001001c295c5$97afec20$940879c8@sc.mcel.mot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001001c295c5$97afec20$940879c8@sc.mcel.mot.com>
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

On Wed, 27 November 2002 11:32:19 +0800, fred wrote:
> 
> I read the mtd/mtd-jffs-HOWTO.txt in MTD home page
> http://www.linux-mtd.infradead.org/.
> I found that if I'd like to use a compressed JFFS2 file system on MTD device
> as root, I would have to decompress it on boot to RAMDISK (in DRAM) and then
> mount it.
> Is it true?

Nope. The compression is transparent, you will only notice it when
wondering, if 5MB of data will fit into an fs with 3MB free. ;-)

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
