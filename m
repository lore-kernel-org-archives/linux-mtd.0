Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9RJt-0006GV-Q3
 for linux-mtd@lists.infradead.org; Tue, 31 Oct 2017 07:50:47 +0000
Date: Tue, 31 Oct 2017 09:48:08 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: sathyanarayanan kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sathyaosid@gmail.com
Subject: Re: [PATCH v2 1/1] mtd: intel-spi: Add Intel Lewisburg PCH SPI super
 SKU PCI ID
Message-ID: <20171031074808.GJ2283@lahna.fi.intel.com>
References: <20171029195809.GH29656@lahna.fi.intel.com>
 <77788f0c0cf55ee9fc0087364827da28c6951180.1509315023.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20171030073241.GI29656@lahna.fi.intel.com>
 <ae3620ec-293e-458e-76b1-5c13e0cdc992@wedev4u.fr>
 <754005b2-fea7-91f3-b526-c325de2ad6bf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <754005b2-fea7-91f3-b526-c325de2ad6bf@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 30, 2017 at 03:28:46PM -0700, sathyanarayanan kuppuswamy wrote:
> Hi,
> 
> 
> On 10/30/2017 03:58 AM, Cyrille Pitchen wrote:
> > Applied to the spi-nor/next branch of l2-mtd
> > 
> > Just for info, this patch didn't apply directly, it misses a line in the list of
> > PCI IDS:
> > 
> >   	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },
> I re-based my patch on top of Mika's SPI support patch. And it applied
> cleanly on top of 4.14-rc6 kernel. Not sure where the problem was?
> 
> http://git.infradead.org/l2-mtd.git/commitdiff/d92b0f18a2039ff736b4296ad3cf3d505512051e

There is another patch adding Cedar Fork PCI ID in the l2-mtd tree. You
rebased only on top of Lewisburg patch so you missed that. Anyway,
Cyrille applied this patch already so everything should be fine :-)
