Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190dmC-0001tO-9L
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:39:21 +0100
Received: from flock1.newmail.ru ([212.48.140.157])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 190JbH-0002o2-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 12:06:43 +0100
From: "A.L. Klyutchenya" <asoneofus@nm.ru>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Date: Tue, 1 Apr 2003 15:02:14 +0400
References: <200304010207.14078.asoneofus@nm.ru>
	<20030401040736.0BA04406D@blood.actrix.co.nz>
In-Reply-To: <20030401040736.0BA04406D@blood.actrix.co.nz>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304010943.04279.asoneofus@nm.ru>
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 8bit
Subject: Re: K9F5608U0B-YIB0000: 528 byte in page, or 512?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear sir,
Thank you for quick answer.

1 Апрель 2003 07:36, Charles Manning написал:
> This is NAND flash. Do not try to treat it as NOR flash.
> Use it with mtd/nand  and use YAFFS or JFFS2 file system.

I want to write the first image, for booting system. I create 
this image (with kernel, MTD & Co). I have a possibility his 
write. Herewith: I have an physical access to page: size 
256+256+16, and block on 32 pages. While NO MTD and NO kernel!

> You must write NAND in whole pages, not on a per-byte basis.

I understand that page it is necessary to write, but what bring 
the first image: chain on 512+512.... or 512+16 free + 512+16 
free...

As even so write? :-) (to hrdware-level)

> On Tue, 01 Apr 2003 10:07, A.L. Klyutchenya wrote:
> > I try to use the microcircuits K9F5608U0B-YIB0000 from
> > Samsung. Herewith, size of the page size of this chip is 512
> > + 16 bytes (528). When I write the image of the disk on
> > chip, me it is necessary to write all bytes consecutively?
> > Or only 512 on each page, but remained 16 not to use?

-- 
ВсехБлаг!      
      ____   __
     /   |  / / А. Л. Клютченя
    / /| | / /  (asoneofus)
   / /_| |/ /   mail:   asoneofus@kde.ru
  / ____  _ \   www:    http://www.qt.kde.ru
 / /   | | \ \  icq:    113679387
/_/    |_|  \_\ 
