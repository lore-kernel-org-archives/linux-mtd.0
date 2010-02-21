Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nj0Ma-0001tM-Mz
	for linux-mtd@lists.infradead.org; Sun, 21 Feb 2010 01:12:05 +0000
Date: Sat, 20 Feb 2010 20:11:55 -0500
From: Sean MacLennan <smaclennan@pikatech.com>
To: Feng Kan <fkan@amcc.com>
Subject: Re: [PATCH 1/1] NDFC: add support for alternate ECC format for ndfc
Message-ID: <20100220201155.27744439@opus.seanm.ca>
In-Reply-To: <1266534678-30293-1-git-send-email-fkan@amcc.com>
References: <1266534678-30293-1-git-send-email-fkan@amcc.com>
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

On Thu, 18 Feb 2010 15:11:18 -0800
Feng Kan <fkan@amcc.com> wrote:

> This is to lock down the ordering in the correction routine against
> the calculate routine. Otherwise, incorrect define would cause ECC
> errors.

Did you actually find a 44x PPC core that is not NAND_ECC_SMS format?

Cheers,
   Sean
