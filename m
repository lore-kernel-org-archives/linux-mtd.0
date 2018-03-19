Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exyu2-0007N6-C3
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 17:49:00 +0000
MIME-Version: 1.0
Message-ID: <trinity-7ecf3411-8627-4866-a39b-3c73f6226ed8-1521481723239@3c-app-gmx-bs23>
From: "Frank Smith" <smith-f@gmx.de>
To: "Frank Smith" <smith-f@gmx.de>
Cc: "Frieder Schrempf" <frieder.schrempf@exceet.de>,
 linux-mtd@lists.infradead.org
Subject: Aw: Re:  Re: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
 found. is25lp256d
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Mar 2018 18:48:43 +0100
In-Reply-To: <trinity-f32d437e-64fa-481b-a9d3-1ed9f8affc8a-1521188924456@3c-app-gmx-bs35>
References: <trinity-f2c4ec20-92aa-4549-961a-54ada3bed090-1521123187434@3c-app-gmx-bs35>
 <4fa247df-ecd3-1034-aaa1-45bfdc1bcda8@exceet.de>
 <trinity-16b93208-69da-44fd-8882-e4852cb4837b-1521125017314@3c-app-gmx-bs35>
 <c88b8eb2-b613-9108-c5df-095ec3e0a1e2@exceet.de>
 <trinity-f32d437e-64fa-481b-a9d3-1ed9f8affc8a-1521188924456@3c-app-gmx-bs35>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After some debugging, I figured out is25lp256d is not jedec jesd16b conform.

nor->addr_width = 3 is the result from the spi_nor_parse_bfpt and this is wrong. It should be 4.

	err = spi_nor_read_sfdp_dma_unsafe(nor,  addr, len, &bfpt);
	if (err < 0)
		return err;

	/* Fix endianness of the BFPT DWORDs. */
	for (i = 0; i < BFPT_DWORD_MAX; i++)
		bfpt.dwords[i] = le32_to_cpu(bfpt.dwords[i]);

        /* Number of address bytes. */
	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:  <-- this is not right should be 3 or 4
		nor->addr_width = 3;
		break;

	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
		nor->addr_width = 4;
		break;

	default:
		break;
	}


I got it working with the following hack:

sei-nor.h
#define SNOR_MFR_ISSI	0x9d 

spi-nor.c:
{ "is25lp256d", INFO(0x9d6019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES) },

spi_nor_init_params(){
..
if(JEDEC_MFR(info)== SNOR_MFR_ISSI)
   nor->addr_width = 0;
}
