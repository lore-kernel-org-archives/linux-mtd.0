Received: from rwcrmhc51.attbi.com ([204.127.198.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17meDE-00024F-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 18:45:08 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Henrik Nordstrom <hno@marasystems.com>,
 karim@opersys.com
Subject: Re: No more DoC hotplug on Grub fail [tested & working]
Date: Wed, 4 Sep 2002 13:40:04 -0400
Cc: linux-mtd@lists.infradead.org
References: <20020904145950.DRRI12451.rwcrmhc51.attbi.com@there> <3D762DEC.C2517257@opersys.com> <200209041841.10466.hno@marasystems.com>
In-Reply-To: <200209041841.10466.hno@marasystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020904174436.BVNQ1399.rwcrmhc51.attbi.com@there>
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

Henrik Nordström wrote:
> > This patch, while potentially useful during debugging, takes up precious
> > space that may be needed later (to add support for new flash devices,
> > etc).
>
> Exacly what kind of precious space does it take up? If you have another
> kind of flash device you better make another stage1 for that device,
> right?
>
> If the stage1 are size is a concern on DoC, then perhaps it should be
> considered to have a kind of "stage1.5" for DoC.

The boot block on the DoC Millennium is 512 bytes.  I believe this is also 
true for the DoC 2000.  Karim's patch used up the few remaining bytes, plus 
it was necessary to remove parts of the informational messages to make things 
fit.

To clarify, I was referring to adding support for detecting additional 
256-bytes per page devices.  The latest code looks at the device ID code to 
differentiate between 256-byte and 512-byte parts.

There really is no way to have a "stage1.5" in this case -- everything that 
is currently being done in doc_stage1 is required to copy Grub from the DoC 
to RAM.

> Also, for most practical purposes, having the "skip GRUB on this boot"
> check in stage2 would also be fine I think, except for the few who are
> playing around with custom stage1 loaders and those who are should
> probably have a setup where they can reflash their DoC without these
> concerns anyway..

Maybe, but then the stage2 code would have to know where to look for the 
BIOS's original handler, and also which one it was (18 or 19).  It would be 
*much* cleaner to leave this in stage1.

If this patch ends up in official GRUB, I'd recommend that we remove the 
section that displays the manufacturer and chip ID codes.  This should save 
enough space to make everything fit.

Mark
