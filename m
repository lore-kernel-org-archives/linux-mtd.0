Received: from mo-p05-ob.rzone.de ([81.169.146.182])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MeP4q-0004ep-Lz
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 08:02:29 +0000
From: Stefan Roese <sr@denx.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/1] Fix ECC Correction bug for SMC ordering for NDFC
	driver.
Date: Fri, 21 Aug 2009 10:02:15 +0200
References: <1250813957-1786-1-git-send-email-fkan@amcc.com>
In-Reply-To: <1250813957-1786-1-git-send-email-fkan@amcc.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200908211002.15178.sr@denx.de>
Cc: linuxppc-dev@ozlabs.org, Feng Kan <fkan@amcc.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 21 August 2009 02:19:17 Feng Kan wrote:
> Fix ECC Correction bug where the byte offset location were double
> fliped causing correction routine to toggle the wrong byte location
> in the ECC segment. The ndfc_calculate_ecc routine change the order
> of getting the ECC code.
>         /* The NDFC uses Smart Media (SMC) bytes order */
>         ecc_code[0] = p[2];
>         ecc_code[1] = p[1];
>         ecc_code[2] = p[3];
> But in the Correction algorithm when calculating the byte offset
> location, the b1 is used as the upper part of the address. Which
> again reverse the order making the final byte offset address
> location incorrect.
> 	byte_addr = (addressbits[b1] << 4) + addressbits[b0];
> The order is change to read it in straight and let the correction
> function to revert it to SMC order.
>
> Signed-off-by: Feng Kan <fkan@amcc.com>
> Acked-by: Victor Gallardo <vgallardo@amcc.com>
> Acked-by: Prodyut Hazarika <phazarika@amcc.com>

Acked-by: Stefan Roese <sr@denx.de>

Would be great if we could get this fix into 2.6.31.

Cheers,
Stefan
