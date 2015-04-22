Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkyTV-0001y3-Fp
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2015 17:30:14 +0000
Date: Wed, 22 Apr 2015 12:29:44 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Adding subpage support to NAND driver -- backwards compatibility
 concerns
Message-ID: <20150422172944.GA4134@bshelton-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: punnaiah.choudary.kalluri@xilinx.com, xander.huff@ni.com, joshc@ni.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

We're currently carrying a patch out of tree to add subpage read and
write support to the pl353_nand driver.  Xilinx is currently working to
mainline this driver; see

http://www.spinics.net/lists/devicetree/msg76307.html

We'd like to upstream our patch, but my concern is that UBIFS behaves
differently when it knows that the flash device supports subpages.  I
have a couple of questions related to that:

- I know from experience that bad things happen when you use a kernel
  without subpage support with an UBIFS filesystem that was formatted
  with subpage support.  Is it safe to do the opposite (kernel with
  subpage support / UBIFS filesystem formatted without subpage support)?

- Assuming that it isn't safe, what's the best way to add subpage
  support to this driver in an upstreamable way / without breaking
  people?  Would it be sufficient to add subpage support as a Kconfig
  option that's disabled by default with a strongly-worded message
  describing the consequences of enabling it?

Thanks,
Ben
