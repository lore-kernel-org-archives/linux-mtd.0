Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190dnl-0001cU-W7
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:40:58 +0100
Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 190D3o-0000nu-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 05:07:46 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "A.L. Klyutchenya" <asoneofus@nm.ru>,
	linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Date: Tue, 1 Apr 2003 15:36:46 +1200
References: <200304010207.14078.asoneofus@nm.ru>
In-Reply-To: <200304010207.14078.asoneofus@nm.ru>
MIME-Version: 1.0
Message-Id: <20030401040736.0BA04406D@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: K9F5608U0B-YIB0000: 528 byte in page, or 512?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is NAND flash. Do not try to treat it as NOR flash.
Use it with mtd/nand  and use YAFFS or JFFS2 file system.

You must write NAND in whole pages, not on a per-byte basis.

On Tue, 01 Apr 2003 10:07, A.L. Klyutchenya wrote:
> I try to use the microcircuits K9F5608U0B-YIB0000 from Samsung.
> Herewith, size of the page size of this chip is 512 + 16 bytes
> (528). When I write the image of the disk on chip, me it is
> necessary to write all bytes consecutively? Or only 512 on each
> page, but remained 16 not to use?
