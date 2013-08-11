Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8MNC-0006mV-AD
 for linux-mtd@lists.infradead.org; Sun, 11 Aug 2013 03:31:19 +0000
Received: by mail-pd0-f169.google.com with SMTP id r10so2079140pdi.28
 for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2013 20:30:53 -0700 (PDT)
Date: Sat, 10 Aug 2013 20:30:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 14/15] mtd: nand: pxa3xx: Increase data buffer size
Message-ID: <20130811033045.GA16906@norris.computersforpeace.net>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376163305-5591-15-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376163305-5591-15-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 10, 2013 at 04:35:04PM -0300, Ezequiel Garcia wrote:
> Devices with 4 KiB pages (plus OOB data) can be detected, so we increase
> the data buffer size. A better solution would be to allocate a buffer
> depending on the detected page size, but that's not possible given
> we need the buffer prior to the device detection.

Another possibility (for future work, maybe) is that you allocate a
smaller buffer that fits what you need for "device detection" (I presume
it's just for ONFI parameter page commands?), then reallocate the buffer
between nand_scan_ident() and nand_scan_tail() according to page size.
There are some other similar buffers throughout NAND that use a fixed
NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE.

> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Tested-by: Daniel Mack <zonque@gmail.com>

...

Brian
