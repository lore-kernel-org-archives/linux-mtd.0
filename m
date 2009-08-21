Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeZGZ-0000KC-AK
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 18:55:20 +0000
Date: Fri, 21 Aug 2009 14:55:06 -0400
From: Sean MacLennan <smaclennan@pikatech.com>
To: Feng Kan <fkan@amcc.com>
Subject: Re: [PATCH 1/1] Fix ECC Correction bug for SMC ordering for NDFC
	driver.
Message-ID: <20090821145506.53275701@lappy.seanm.ca>
In-Reply-To: <1250813957-1786-1-git-send-email-fkan@amcc.com>
References: <1250813957-1786-1-git-send-email-fkan@amcc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Feng Kan <fkan@amcc.com>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Aug 2009 17:19:17 -0700
Feng Kan <fkan@amcc.com> wrote:

> Fix ECC Correction bug where the byte offset location were double
> fliped causing correction routine to toggle the wrong byte location
> in the ECC segment. The ndfc_calculate_ecc routine change the order
> of getting the ECC code.

It looks like another fix for this bug is to leave the current code
alone and turn off CONFIG_MTD_NAND_ECC_SMC.

This could be a better fix if this is the way u-boot currently works.
Has anybody verified if the current u-boot has the ECC problem?

Cheers,
   Sean
