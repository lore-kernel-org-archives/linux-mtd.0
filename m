Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QAvA-0006wV-Lv
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 20:06:09 +0100
Date: Wed, 11 Jun 2003 21:06:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Frank R Callaghan <f.callaghan@ieee.org>
Message-ID: <20030611190642.GA4833@wohnheim.fh-wedel.de>
References: <200306111438.52353.f.callaghan@ieee.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200306111438.52353.f.callaghan@ieee.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Help with mtd + jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 June 2003 14:38:52 -0400, Frank R Callaghan wrote:
> 
> But then I tryed to put the jffs2 file system image onto
> the device :=
> 
> # cp /myapp/jffs2_file_sys.img /dev/mtd0
> cp: unable to open `/dev/mtd0': No such device
> #
> 
> but I have the device !
> # ls -al /dev/mtd?
> crw-------    1 root     root      90,   0 Jan  1  1970 /dev/mtd0
> crw-------    1 root     root      90,   2 Jan  1  1970 /dev/mtd1
> crw-------    1 root     root      90,   4 Jan  1  1970 /dev/mtd2
> crw-------    1 root     root      90,   6 Jan  1  1970 /dev/mtd3
> crw-------    1 root     root      90,   8 Jan  1  1970 /dev/mtd4

device != device node

A door alone doesn't make a mansion either. :)

Set CONFIG_MTD_CHAR to yes or better yet set CONFIG_MTD_BLOCK to yes
and use /dev/mtdblock* instead.  Those devices are usually much nicer
unless you really *really* know you don't want them.

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
