Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9GHT-0005Nc-JI
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 18:59:00 +0000
Received: by mail-pf0-x243.google.com with SMTP id i88so1846504pfk.2
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 10:58:38 -0800 (PST)
Date: Tue, 22 Nov 2016 10:58:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zach Brown <zach.brown@ni.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com, richard@nod.at,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 0/5] mtd: use ONFI bad blocks per LUN to
 calculate UBI bad PEB limit
Message-ID: <20161122185835.GE77253@google.com>
References: <1479757899-6849-1-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479757899-6849-1-git-send-email-zach.brown@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 21, 2016 at 01:51:34PM -0600, Zach Brown wrote:
> For ONFI-compliant NAND devices, the ONFI parameters report the maximum number
> of bad blocks per LUN that will be encountered over the lifetime of the device,
> so we can use that information to get a more accurate (and smaller) value for
> the UBI bad PEB limit.
> 
> The ONFI parameter "maxiumum number of bad blocks per LUN" is the max number of
> bad blocks that each individual LUN will ever ecounter. It is not the number of
> bad blocks to reserve for the nand device per LUN in the device.
> 
> This means that in the worst case a UBI device spanning X LUNs will encounter
> "maximum number of bad blocks per LUN" * X bad blocks. The implementation in
> this patch assumes this worst case and allocates bad block accordingly.
> 
> These patches are ordered in terms of their dependencies, but ideally, all 5
> would need to be applied for this to work as intended.

Other than some small comments, the MTD parts look fine to me. For
patches 1, 3, 4, and 5 with my comments fixed:

Acked-by: Brian Norris <computersforpeace@gmail.com>

For the UBI part, I wasn't quite sure about the precedence among the 3
possible ways to determine the appropriate value. I'll leave that up to
Richard, et al, though.

Brian
