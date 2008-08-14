Received: from mpls-qmqp-01.inet.qwest.net ([63.231.195.112])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KTiDi-000387-8C
	for linux-mtd@lists.infradead.org; Thu, 14 Aug 2008 19:10:50 +0000
Message-ID: <48A48330.70105@boundarydevices.com>
Date: Thu, 14 Aug 2008 12:10:40 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: frans <fransmeulenbroeks@gmail.com>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>	<1218472202.2977.12.camel@pmac.infradead.org>	<ac9c93b10808120153m7435424ci3e49a70d3599cc06@mail.gmail.com>	<1218535872.2977.133.camel@pmac.infradead.org>
	<alpine.DEB.0.99.0808142007340.6572@frans-desktop>
In-Reply-To: <alpine.DEB.0.99.0808142007340.6572@frans-desktop>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

frans wrote:
> Fixed the last remaining issues, made sure to diff with the very latest mtd
> git version.
> 
> Attached is a complete rewrite of nand_ecc.c including documentation.
> This rewrite improves performance about 18 times on intel (D920),
> 7 times on MIPS and 5 times on ARM (NSLU2)
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

This look very complex to me. How about something like this.
Note, I could make it much smaller if allowed to result in a different
ecc value than current implementation.


#ifdef CONFIG_MTD_NAND_ECC_SMC
#define LOW_ORDER_INDEX 0
#define HIGH_ORDER_INDEX 1
#else
#define LOW_ORDER_INDEX 1
#define HIGH_ORDER_INDEX 0
#endif

/**
 * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512 byte block
 * @mtd:	MTD block structure
 * @dat:	raw data
 * @ecc_code:	buffer for ECC
 */
int nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
		       u_char *ecc_code)
{
	uint32_t j = ((struct nand_chip *)mtd->priv)->ecc.size;			/* 256 or 512 bytes/ecc  */
	uint32_t k=0;
	uint32_t xor = 0;
	uint32_t tecc = 0;
	uint32_t ecc = 0;
	uint32_t * p = (uint32_t *)dat;
	uint32_t v;
//#define FORCE_ECC_ERROR
#ifdef FORCE_ECC_ERROR
	uint32_t forceBitNum;
	{
		/* force single bit ecc error to test ecc correction code */
		u_char* p = (u_char*)dat;
		forceBitNum = p[0] | (p[1]<<8);	/* 1st word of block determines which bit is made in error */
		forceBitNum &= 0xfff;
		if ((forceBitNum&0x800)==0) {
			/* limit error to 1st 256 bytes */
			p[forceBitNum>>3] ^= 1<<(forceBitNum&7);
			printk(KERN_INFO "Forcing ecc error, byte:0x%x, bit:%i\n",forceBitNum>>3,forceBitNum&7);
		}
	}
#endif

	do {
		v = *p++;
		xor ^= v;
		v ^= (v>>16);
		v ^= (v>>8);
		v ^= (v>>4);
		v ^= (v>>2);
		v ^= (v>>1);
		if (v&1) tecc ^= k;
		k++;
		j-=4;
	} while (j);
	__cpu_to_le64s(xor);
	v = (xor>>16)^xor;
	v ^= ((v>>8)&(0x00ff00ff&0x00ffffff));
	v ^= ((v>>4)&(0x0f0f0f0f&0x000f0fff));
	v ^= ((v>>2)&(0x33333333&0x0003033f));
	v ^= ((v>>1)&(0x55555555&0x00010117));
	
	/* now duplicate all bits */
	if (tecc&(1<<6)) ecc ^= 3<<22;
	if (tecc&(1<<5)) ecc ^= 3<<20;
	if (tecc&(1<<4)) ecc ^= 3<<18;
	if (tecc&(1<<3)) ecc ^= 3<<16;
	if (tecc&(1<<2)) ecc ^= 3<<14;
	if (tecc&(1<<1)) ecc ^= 3<<12;
	if (tecc&(1<<0)) ecc ^= 3<<10;

	if (v&(1<<16)) ecc ^= 3<<8;
	if (v&(1<<8)) ecc ^= 3<<6;
	if (v&(1<<4)) ecc ^= 3<<4;
	if (v&(1<<2)) ecc ^= 3<<2;
	if (v&(1<<1)) ecc ^= 3<<0;
	if (v&(1<<0)) ecc ^= 0x555555;		/* if parity is odd, low bits are opposite of high bits */

#ifdef FORCE_ECC_ERROR
	if (forceBitNum&0x800) {
		ecc ^= 1<<(forceBitNum&0xf);
		printk(KERN_INFO "Forcing single bit error in ecc itself bit %i\n",forceBitNum&0xf);
	}
#endif
	if (((struct nand_chip *)mtd->priv)->ecc.size==256) ecc <<= 2;
	ecc = ~ecc;


#ifdef VERIFY_NEW_ECC_ALG
	{
		uint32_t s;
		nand_calculate_ecc_old(mtd,dat,ecc_code);
		ecc &= 0xffffff;
		s = (ecc_code[HIGH_ORDER_INDEX]<<16) | (ecc_code[LOW_ORDER_INDEX]<<8) | ecc_code[2];

		if (s != ecc) {
			printk(KERN_ERR "New algorithm is buggy!!!! s=%x, ecc=%x\n",s,ecc);
			return 0;
		}
	}
#endif

	/* Calculate final ECC code */
	ecc_code[HIGH_ORDER_INDEX] = (u_char)(ecc>>16);
	ecc_code[LOW_ORDER_INDEX] = (u_char)(ecc>>8);
	ecc_code[2] = (u_char)ecc;
	return 0;
}
