Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKBMK-0007n6-Jl
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2010 14:25:29 +0000
Received: by fxm15 with SMTP id 15so145279fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Jun 2010 07:25:22 -0700 (PDT)
Subject: Re: CRC error when mounting UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTilGg81TGnkS2VwF6xdFCvsB_AF_8rLYVqTr-81g@mail.gmail.com>
References: <AANLkTilGg81TGnkS2VwF6xdFCvsB_AF_8rLYVqTr-81g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 03 Jun 2010 17:25:18 +0300
Message-Id: <1275575118.9729.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-06-03 at 16:02 +0200, Leo Barnes wrote:
> Hello!
> 
> I am trying to create and mount an UBIFS partition and get the
> following error when trying to mount it:
> <7>[  397.117065] UBIFS DBG (pid 438): ubifs_start_scan: scan LEB 490:0
> <7>[  397.117218] UBIFS DBG (pid 438): ubifs_scan: look at LEB 490:0
> (126976 bytes left)
> <7>[  397.117401] UBIFS DBG (pid 438): ubifs_scan_a_node: hit empty space
> <7>[  397.117614] UBIFS DBG (pid 438): ubifs_end_scan: stop scanning
> LEB 490 at offset 0
> <3>[  397.119598] UBIFS error (pid 438): check_lpt_crc: invalid crc in
> LPT node: crc 0 calc 90d1

Most of the time errors like this are because of problems in the driver
level, e.g., when the driver does not handle small or unaligned length
reads. Did you validate your MTD driver with MTD tests?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
