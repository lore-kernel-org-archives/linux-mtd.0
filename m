Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCnlq-0007Ib-IL
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 12:48:42 +0000
Received: by mail-oi0-f67.google.com with SMTP id u201so15684091oie.2
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2016 05:48:22 -0700 (PDT)
Date: Tue, 14 Jun 2016 07:48:20 -0500
From: Rob Herring <robh@kernel.org>
To: Han Xu <han.xu@nxp.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, pawel.moll@arm.com,
 mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
 galak@codeaurora.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mtd: nand: gpmi: document the new supported chip
 in DT
Message-ID: <20160614124820.GA5523@rob-hp-laptop>
References: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
 <1465578094-8816-7-git-send-email-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465578094-8816-7-git-send-email-han.xu@nxp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 10, 2016 at 12:01:34PM -0500, Han Xu wrote:
> listed all supported chips in DT.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
