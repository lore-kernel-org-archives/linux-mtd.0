Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmua9-0002hD-VY
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 00:40:34 +0000
Received: by mail-ig0-f175.google.com with SMTP id uq10so5583507igb.8
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 17:40:11 -0700 (PDT)
Date: Tue, 20 May 2014 17:40:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 1/2] mtd: fsl_ifc_nand: Use void type for IFC buffer
Message-ID: <20140521004008.GB28907@ld-irv-0074>
References: <1142754398.830922.1396889085115.JavaMail.zimbra@xes-inc.com>
 <1775366863.831876.1396889892458.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1775366863.831876.1396889892458.JavaMail.zimbra@xes-inc.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 07, 2014 at 11:58:12AM -0500, Aaron Sierra wrote:
> The IFC buffer is accessed via 8-bit and 16-bit accessors. Changing
> the 'addr' member of 'struct fsl_ifc_nand_ctrl' from 'u8 __iomem *' to
> 'void __iomem *' eliminates the need for explicit casts when the
> 16-bit accessors are used.
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Pushed both to l2-mtd.git. Thanks!

Brian
