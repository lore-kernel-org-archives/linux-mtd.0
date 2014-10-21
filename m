Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgcXb-0002gN-Cv
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 16:44:11 +0000
Received: by mail-ig0-f174.google.com with SMTP id a13so1705051igq.7
 for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2014 09:43:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29606567142da0d52c462ef0aebacc2b91fe2508.1413891469.git.michal.simek@xilinx.com>
References: <29606567142da0d52c462ef0aebacc2b91fe2508.1413891469.git.michal.simek@xilinx.com>
Date: Tue, 21 Oct 2014 18:43:50 +0200
Message-ID: <CACna6rzp1anqhLc-CfYmD4QA4ghYMWWjXmO9DnHHo824QobaMQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for SST spi flash
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, monstr@monstr.eu,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21 October 2014 13:37, Michal Simek <michal.simek@xilinx.com> wrote:
> From: Harini Katakam <harini.katakam@xilinx.com>
>
> Add sst25wf080 to the spi-nor device id table.

I guess commit message could include some details. We already support
plenty of SST flashes without this patch, don't we?
