Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LFFJ0-0005Is-6Y
	for linux-mtd@lists.infradead.org; Tue, 23 Dec 2008 22:00:46 +0000
Date: Tue, 23 Dec 2008 17:00:40 -0500
From: Sean MacLennan <smaclennan@pikatech.com>
To: "Kostas Nakos" <knakos@inaccessnetworks.com>
Subject: Re: [PATCH] ndfc driver
Message-ID: <20081223170040.4e58de3f@lappy.seanm.ca>
In-Reply-To: <4950D8EA.7010905@inaccessnetworks.com>
References: <4950D8EA.7010905@inaccessnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 23 Dec 2008 14:26:18 +0200
"Kostas Nakos" <knakos@inaccessnetworks.com> wrote:

> Hello list,
> 
> with respect to Sean's updated patch ( 
> http://lists.infradead.org/pipermail/linux-mtd/2008-December/023932.html 
> ) of the ndfc driver:
> 
> We are using an AMCC PPC440EPx based board which requires the ndfc 
> driver to handle the nand memory. We have encountered 2 problems with 
> this latest patch:
> 
> 1) Kernel oops after of_iomap() of ndfc_probe(). The external nand 
> memory is bound to chip select 0. The respective dts "reg" line was
> 'reg = <0 d0000000 2000>;'. Using chip selects greater than zero do
> not crash the kernel.

I am not a DTS expert, I just use it ;) But are you sure the second
value should be d0000000?

> 2) Byte order wrong in ndfc_calculate_ecc(). ecc_code[0] and
> ecc_code[1] have been exchanged in this version of the patch which
> lead to ecc errors being reported during mounting (and of course, a
> failed mount operation).

Are you using u-boot and, if so, what version? The ecc_code was
changed to match u-boot. We are using a heavily modified 1.3.3.

This may need to be a config option, since we cannot guarantee what
version of u-boot they are running.

Cheers,
   Sean
