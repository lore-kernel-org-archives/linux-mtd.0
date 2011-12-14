Received: from co202.xi-lite.net ([149.6.83.202])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RalAB-0003Gd-Sg
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2011 09:30:12 +0000
Message-ID: <4EE86C95.4050101@parrot.com>
Date: Wed, 14 Dec 2011 10:29:57 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "katsuki.uwatoko@toshiba.co.jp" <katsuki.uwatoko@toshiba.co.jp>
Subject: Re: [PATCH] [MTD] NAND : SFTL (Simple Flash Transration Layer)
References: <4CCCBA2E6B78F3katsuki.uwatoko@toshiba.co.jp>
In-Reply-To: <4CCCBA2E6B78F3katsuki.uwatoko@toshiba.co.jp>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

katsuki.uwatoko@toshiba.co.jp a écrit :
> This is a new Flash Translation Layer for NAND Flash on mtd.
> 
> mtd: SFTL (Simple Flash Translation Layer)
> 
> Introduction
> ------------
> 
> SFTL is a flash translation layer for NAND Flash on mtd_blkdevs
> interface.  This is mainly-useful for read-oriented use (ex. a storage
> for a boot image) because this provides simple wear-leveling and
> scrubbing. The features are:
> 
>  * sftl provides wear-leveling (not static wear-leveling) and scrubbing.
>  * sftl has one erase block size cache.
>  * sftl uses 6 bytes in OOB for a logical address, status, version.
>  * the erase block scan at init is fast.
>  * a unit of read/write from/to MTD is an erase block.
> 
What's the advantage over ubi and/or mtd over ubi.


Matthieu
