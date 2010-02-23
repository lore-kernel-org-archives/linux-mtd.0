Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjnWz-0003il-5D
	for linux-mtd@lists.infradead.org; Tue, 23 Feb 2010 05:42:06 +0000
Date: Tue, 23 Feb 2010 00:41:56 -0500
From: Sean MacLennan <smaclennan@pikatech.com>
To: "Feng Kan" <fkan@amcc.com>
Subject: Re: [PATCH 1/1] NDFC: add support for alternate ECC format for ndfc
Message-ID: <20100223004156.5ed0140c@opus.seanm.ca>
In-Reply-To: <2B3B2AA816369A4E87D7BE63EC9D2F260615A5F2@SDCEXCHANGE01.ad.amcc.com>
References: <1266534678-30293-1-git-send-email-fkan@amcc.com>
	<20100220201155.27744439@opus.seanm.ca>
	<2B3B2AA816369A4E87D7BE63EC9D2F260615A5F2@SDCEXCHANGE01.ad.amcc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 22 Feb 2010 21:21:53 -0800
"Feng Kan" <fkan@amcc.com> wrote:

> Hi Sean:
>  
> I will withdraw this patch. I had a talk with the U-Boot guys. The
> reason for this patch was to support those guys that had their ECC
> ordering at (213) on the older version of the kernel. Upgrading to
> (123) may be problematic. Since without a jtag it would be a bit
> complex. 
> I still think this NAND_ECC_SMC define is somewhat missleading. Given
> that both 1-2-3 and 2-1-3 are supported by the correction routine.

The 213 ordering is my fault. I changed it to match what u-boot did
rather than keeping the order from the old arch-ppc driver. Believe
me, I have been raked over the coals at work for this :(

I agree the NAND_ECC_SMC is misleading. The NAND_ECC_SMC *is* correct.
The confusion is that the SMC is handled later on, so you must keep the
byte order unaltered in this routine.

I wrote a simple driver that allows you to boot with the old kernel,
insmod the driver, burn new images (including a kernel with the correct
byte order!), and then reboot into the new kernel. If anybody wants
this, just ask. It will take a little work to get it working with other
NANDs since it needs to know the NAND name to get the mtd structure.

It also assumes you have a way to write to NAND in user mode. The
mtd-utils flash_eraseall and nandwrite are good enough.

Cheers,
   Sean
