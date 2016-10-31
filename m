Received: from mail-oi0-f68.google.com ([209.85.218.68])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c12bd-0006C2-HO
 for linux-mtd@lists.infradead.org; Mon, 31 Oct 2016 02:45:50 +0000
Received: by mail-oi0-f68.google.com with SMTP id v84so3414602oie.2
 for <linux-mtd@lists.infradead.org>; Sun, 30 Oct 2016 19:45:29 -0700 (PDT)
Date: Sun, 30 Oct 2016 21:45:26 -0500
From: Rob Herring <robh@kernel.org>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, DT <devicetree@vger.kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Mason <slash.tmp@free.fr>,
 Sebastian Frias <sf84@laposte.net>
Subject: Re: [PATCH v7 1/2] mtd: nand: add tango NFC dt bindings doc
Message-ID: <20161031024526.g3fadht2coqqu6a5@rob-hp-laptop>
References: <580F5AD2.9020909@sigmadesigns.com>
 <580F5B06.6030608@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <580F5B06.6030608@sigmadesigns.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 25, 2016 at 03:15:50PM +0200, Marc Gonzalez wrote:
> Add the tango NAND Flash Controller dt bindings documentation.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  Documentation/devicetree/bindings/mtd/tango-nand.txt | 38 ++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
