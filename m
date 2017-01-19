Received: from mail-ot0-f196.google.com ([74.125.82.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUFno-0002qc-CI
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 16:43:09 +0000
Received: by mail-ot0-f196.google.com with SMTP id f9so4826775otd.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2017 08:42:48 -0800 (PST)
Date: Thu, 19 Jan 2017 10:42:46 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: mtd: add a common label property to
 all mtd devices
Message-ID: <20170119164246.bqkucct4pj76k27o@rob-hp-laptop>
References: <1484573225-19095-3-git-send-email-clg@kaod.org>
 <1484578600-25994-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1484578600-25994-1-git-send-email-clg@kaod.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 16, 2017 at 03:56:40PM +0100, Cédric Le Goater wrote:
> This can be used to easily identify a specific chip on a system with
> multiple chips.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/mtd/common.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/common.txt

Acked-by: Rob Herring <robh@kernel.org>
