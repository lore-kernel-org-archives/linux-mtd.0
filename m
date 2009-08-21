Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeNZw-00063g-Qv
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 06:26:30 +0000
Date: Fri, 21 Aug 2009 02:26:19 -0400
From: Sean MacLennan <smaclennan@pikatech.com>
To: vimal singh <vimal.newwork@gmail.com>
Subject: Re: [U-Boot] NAND ECC Error with wrong SMC ording bug
Message-ID: <20090821022619.482158bb@lappy.seanm.ca>
In-Reply-To: <ce9ab5790908202217t2430646co5059f308a23d7397@mail.gmail.com>
References: <19081.57584.173693.798535@cargo.ozlabs.ibm.com>
	<4A8C87E6.6070702@amcc.com>
	<20090820003851.1a532444@lappy.seanm.ca>
	<200908200701.21076.sr@denx.de>
	<20090820153644.631dbd7b@lappy.seanm.ca>
	<ce9ab5790908202217t2430646co5059f308a23d7397@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: u-boot@lists.denx.de, Stefan Roese <sr@denx.de>, Feng Kan <fkan@amcc.com>,
	linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 21 Aug 2009 10:47:09 +0530
vimal singh <vimal.newwork@gmail.com> wrote:

> Just one question: did you enabled MTD_NAND_ECC_SMC in configs?

It is automagically selected when you select the NDFC driver.

Cheers,
   Sean
