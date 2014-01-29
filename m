Date: Wed, 29 Jan 2014 14:53:32 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [RFC PATCH v2 03/14] of: mtd: add documentation for
 nand-ecc-level property
Message-ID: <20140129175331.GA27143@localhost>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
 <1391006064-28890-4-git-send-email-b.brezillon.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1391006064-28890-4-git-send-email-b.brezillon.dev@gmail.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, dev@linux-sunxi.org,
 linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 29, 2014 at 03:34:13PM +0100, Boris BREZILLON wrote:
> nand-ecc-level property statically defines NAND chip's ECC requirements.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> index 03855c8..0c962296 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -3,5 +3,8 @@
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
>    "soft_bch".
> +- nand-ecc-level : Two cells property defining the ECC level requirements.
> +  The first cell represent the strength and the second cell the ECC block size.
> +  E.g. : nand-ecc-level = <4 512>; /* 4 bits / 512 bytes */
>  - nand-bus-width : 8 or 16 bus width if not present 8
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false

Hm.. when was this proposal agreed? It seems I've missed the
discussion...

FWIW, we've already proposed an equivalent one, but it received no
feedback from the devicetree maintainers:

http://comments.gmane.org/gmane.linux.drivers.devicetree/58764

Maybe we can discuss about it now?

  nand-ecc-strength : integer ECC required strength.
  nand-ecc-size : integer step size associated to the ECC strength.

  vs.

  nand-ecc-level : Two cells property defining the ECC level requirements.
  The first cell represent the strength and the second cell the ECC block size.
  E.g. : nand-ecc-level = <4 512>; /* 4 bits / 512 bytes */

It's really the same proposal but with a different format, right?
IMHO, the former is more human-readable, but other than that I see no
difference.

Brian? DT-guys?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
