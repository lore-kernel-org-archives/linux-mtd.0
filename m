From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Julianne C.'" <juliannerc@gmail.com>,
	"'linux-mtd'" <linux-mtd@lists.infradead.org>
References: <e167438e0702150620t4291198dxd627d102cba6519f@mail.gmail.com>
Subject: RE: OneNAND: Unexpected zero blocks
Date: Fri, 16 Feb 2007 08:46:34 +0900
Message-ID: <005e01c7515b$8b416120$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <e167438e0702150620t4291198dxd627d102cba6519f@mail.gmail.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> 
> 3) copy the rootfs (about 2 MB) to the new fs on /mnt
> 
> When the fs is unmounted, and remounted again, we see some 
> files in which two to four blocks of zeros occur (0x2000), or 
> blocks with some initial data filled in 20 to 40 bytes and 
> the rest zeros.

Umm, I  have no idea.

please use this script. In my board, it is passed both kernel
1. omap tree
2. onenand mtd tree

# note you have to add onenand partition to /etc/fstab
e.g., 
/dev/mtdblock4  /jffs2          jffs2   defaults                1       1

#!/bin/sh -x

DIRS="usr etc bin lib"

for dir in $DIRS; do
        echo "Testing $dir ..."
        time mount /jffs2
        rm -rf /jffs2/*
        mkdir -p /jffs2/$dir
        cp -ar /$dir/* /jffs2/$dir
        diff -Nur /$dir /jffs2/$dir
        umount /jffs2

        time mount /jffs2
        diff -Nur /$dir /jffs2/$dir
        umount /jffs2
done

Thank you,
Kyungmin Park
