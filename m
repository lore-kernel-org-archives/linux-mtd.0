Received: from sccrmhc02.attbi.com ([204.127.202.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qu4B-00081v-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2002 12:29:24 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Erich Schubert <erich@debian.org>
Subject: Re: another question: what can break?
Date: Mon, 16 Sep 2002 07:27:46 -0400
Cc: linux-mtd@lists.infradead.org
References: <20020916002848.GB23510@bombadil.xmldesign.de> <20020916031806.QNX26805.rwcrmhc52.attbi.com@there> <20020916080118.GA16280@bombadil.xmldesign.de>
In-Reply-To: <20020916080118.GA16280@bombadil.xmldesign.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020916112850.BWRQ23613.sccrmhc02.attbi.com@there>
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

Erich Schubert wrote:
> as far as i now understood the way the old firmware probably chose was
> to hook the disc handler 13h which would mean that it has to emulate a
> real block device, is that correct?

Yes.

> Where do i find the old firmware, in case i want to restore the original
> contents of the flash?
> is that in DOC52.EXB in the ttfs_5.1.2 package from m-systems?

Yes, you can use the DFORMAT command in the M-Sys DOS utilities to restore 
the original contents.  Using the newest versions of DFORMAT (5.x) prior to 
installing Grub may cause problems (UnitSizeFactor != 1) -- but the earlier 
versions (4.x) should work fine for now.
