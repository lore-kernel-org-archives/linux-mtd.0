Received: from mail-it0-f65.google.com ([209.85.214.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQMAW-0000jF-T7
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 23:14:46 +0000
Received: by mail-it0-f65.google.com with SMTP id 185so6679483itv.3
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 16:14:24 -0700 (PDT)
Date: Wed, 28 Jun 2017 18:14:22 -0500
From: Rob Herring <robh@kernel.org>
To: matthew.gerlach@linux.intel.com
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: Bindings for Altera Quadspi Controller
 Version 2
Message-ID: <20170628231422.zgqxka62fk4bpbty@rob-hp-laptop>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-2-git-send-email-matthew.gerlach@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498493619-4633-2-git-send-email-matthew.gerlach@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 26, 2017 at 09:13:37AM -0700, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

"dt-bindings: mtd: ..." for the subject.

Other than the discussion about bit reverse, the rest looks fine.

> 
> Device Tree bindings for Version 2 of the Altera Quadspi Controller
> that can be optionally paired with a windowed bridge.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/altera-quadspi-v2.txt  | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
