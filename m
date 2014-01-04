Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzQhE-0000lv-86
 for linux-mtd@lists.infradead.org; Sat, 04 Jan 2014 12:51:21 +0000
Received: by mail-pd0-f178.google.com with SMTP id y10so16441977pdj.9
 for <linux-mtd@lists.infradead.org>; Sat, 04 Jan 2014 04:50:58 -0800 (PST)
Date: Sat, 4 Jan 2014 20:50:51 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v7] mtd: gpmi: Deal with bitflips in erased regions
Message-ID: <20140104125050.GB4996@gmail.com>
References: <1388784439-23004-1-git-send-email-eliedebrauwer@gmail.com>
 <1388784439-23004-2-git-send-email-eliedebrauwer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388784439-23004-2-git-send-email-eliedebrauwer@gmail.com>
Cc: b32955@freescale.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 10:27:19PM +0100, Elie De Brauwer wrote:
> The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
> able to correct bitflips on data actually streamed through the block.
> When erasing a block the data does not stream through the BCH block
> and therefore no ECC data is written to the NAND chip. This causes
> gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
> found in an erased page. Typically causing problems at higher levels
> (ubifs corrupted empty space warnings). This problem was also observed
> when using SLC NAND devices.
> 
> This patch configures the BCH block to mark a block as 'erased' if
> not too much bitflips are found (by setting the erase threshold). A
> consequence of this is that whenever an erased page is read, the
> number of bitflips will be counted and corrected in software,
> allowing the upper layers to take proper actions.
> 
> Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> Acked-by: Huang Shijie <b32955@freescale.com>

I am okay with this patch.

thanks
Huang Shijie
