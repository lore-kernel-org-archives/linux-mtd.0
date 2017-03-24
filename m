Received: from mail-ot0-f195.google.com ([74.125.82.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1crRvr-00017C-QK
 for linux-mtd@lists.infradead.org; Fri, 24 Mar 2017 16:19:21 +0000
Received: by mail-ot0-f195.google.com with SMTP id y88so800490ota.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Mar 2017 09:18:59 -0700 (PDT)
Date: Fri, 24 Mar 2017 11:18:57 -0500
From: Rob Herring <robh@kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 1/5] dt-bindings: mtd: document new "on-die" nand-ecc-mode
Message-ID: <20170324161857.vojqlt2l2u7pwbqm@rob-hp-laptop>
References: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490092686-16509-2-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490092686-16509-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 21, 2017 at 11:38:02AM +0100, Thomas Petazzoni wrote:
> A number of NAND chips support a feature called on-die ECC, where the
> NAND chip itself is capable of doing error detection and correction. The
> new "on-die" value for nand-ecc-mode indicates that we want this
> functionality to be used.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
