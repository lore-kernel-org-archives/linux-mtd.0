Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8kkA-0007sY-Ge
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 10:23:04 +0000
Date: Sun, 29 Oct 2017 12:16:03 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sathyaosid@gmail.com
Subject: Re: [PATCH v1 1/1] mtd: intel-spi: Add support for Intel Lewisburg
 SPI serial flash controller
Message-ID: <20171029101603.GF29656@lahna.fi.intel.com>
References: <9da18c4fbcb55130164735352b5ce9ba11b9a63c.1509270992.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <630c7d49-c0cc-4d4e-27d9-5e60b797d9f7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <630c7d49-c0cc-4d4e-27d9-5e60b797d9f7@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 29, 2017 at 11:09:50AM +0100, Marek Vasut wrote:
> On 10/29/2017 10:57 AM, sathyanarayanan.kuppuswamy@linux.intel.com wrote:
> > From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> > 
> > This patch adds PCI IDs for Intel Lewisburg PCH SPI serial flash controller.
> > 
> > Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> Culling the CC list and adding relevant people.
> Patch looks IMO OK, but I'd like RB from Mika.

There is already a patch for Lewisburg queued for v4.15 here:

http://git.infradead.org/l2-mtd.git/commitdiff/d92b0f18a2039ff736b4296ad3cf3d505512051e
