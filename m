Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1amws9-00048l-7Q
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 05:16:22 +0000
Date: Mon, 4 Apr 2016 00:15:59 -0500
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Harvey Hunt <harvey.hunt@imgtec.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v2] mtd: nand: document the NAND controller/NAND chip DT
 representation
Message-ID: <20160404051559.GI17806@rob-hp-laptop>
References: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 01, 2016 at 02:26:35PM +0200, Boris Brezillon wrote:
> Standardize the NAND controller/NAND chip DT representation. Now, all new
> NAND controller drivers should comply with this representation, even if
> they are only supporting a single NAND chip.
> 
> Existing drivers can keep support for the old representation (where only
> the NAND chip was described), but are encouraged to also support the new
> one.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v1:
> - fix typo
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 37 +++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
