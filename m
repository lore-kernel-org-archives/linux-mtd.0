Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196Q1Y-0004Mo-Dc
	for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2003 08:11:04 +0100
Date: Fri, 18 Apr 2003 09:10:59 +0200 (CEST)
From: Henrik Nordstrom <hno@marasystems.com>
To: lhl <lhl@phy.ccnu.edu.cn>
In-Reply-To: <E196LQ3-0003ZH-Aq@pentafluge.infradead.org>
Message-ID: <Pine.LNX.4.44.0304180908290.24466-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: No recognised DiskOnChip devices found.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 18 Apr 2003, lhl wrote:

> CONFIG_MTD_DOCPROBE_HIGH=y

I don't think you want this..

  By default, the probe for DiskOnChip devices will look for a
  DiskOnChip at every multiple of 0x2000 between 0xC8000 and 0xEE000.
  This option changes to make it probe between 0xFFFC8000 and
  0xFFFEE000.  Unless you are using LinuxBIOS, this is unlikely to be
  useful to you.  Say 'N'.

Regards
Henrik
