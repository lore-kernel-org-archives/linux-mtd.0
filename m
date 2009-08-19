Received: from sdcmail01.amcc.com ([198.137.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MduPG-0005XN-UW
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 23:17:37 +0000
Message-ID: <4A8C87E6.6070702@amcc.com>
Date: Wed, 19 Aug 2009 16:16:54 -0700
From: Feng Kan <fkan@amcc.com>
MIME-Version: 1.0
To: linuxppc-dev@ozlabs.org
Subject: NAND  ECC Error with wrong SMC ording bug
References: <19081.57584.173693.798535@cargo.ozlabs.ibm.com>
	<1250569482.19007.23.camel@pasglop>
In-Reply-To: <1250569482.19007.23.camel@pasglop>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All:

It seems that the ECC correction is broken on the Linux with the 4xx 
NDFC driver.
It uses the SMC order when reading the ECC code. 2-1-3

static int ndfc_calculate_ecc(struct mtd_info *mtd,
                               const u_char *dat, u_char *ecc_code)
{
         struct ndfc_controller *ndfc = &ndfc_ctrl;
         uint32_t ecc;
         uint8_t *p = (uint8_t *)&ecc;

         wmb();
         ecc = in_be32(ndfc->ndfcbase + NDFC_ECC);
         /* The NDFC uses Smart Media (SMC) bytes order */
         ecc_code[0] = p[2];
         ecc_code[1] = p[1];
         ecc_code[2] = p[3];

         return 0;
}

However, when in the correction function, the byte address order is 
again reverses
causing incorrect byte location.

                  * performace it does not make any difference
                  */
                 if (eccsize_mult == 1)
                         byte_addr = (addressbits[b0] << 4) + 
addressbits[b1];
 >>>> The above really should be byte_addr = (addressbits[b1] << 4) + 
addressbits[b0];

                 else
                         byte_addr = (addressbits[b2 & 0x3] << 8) +
                                     (addressbits[b1] << 4) + 
addressbits[b0];
                 bit_addr = addressbits[b2 >> 2];
                 /* flip the bit */
                 buf[byte_addr] ^= (1 << bit_addr);
                 printk(KERN_INFO "Corrected b[0] 0x%x b[1]0x%x\n", b0, b1);
                 printk(KERN_INFO "cal ecc b[0] 0x%x b[1]0x%x\n", 
calc_ecc[0] , calc_ecc[1]);
                 printk(KERN_INFO "read ecc b[0] 0x%x b[1]0x%x\n", 
read_ecc[0] , read_ecc[1]);
                 return 1;

I see other boards using SMC as well, can someone comment on the change 
I am proposing.
Should I change the correction algorithm or the calculate function? If 
the later is preferred
it would mean the change must be pushed in both U-Boot and Linux.

Feng Kan
AMCC Software
