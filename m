Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cphXL-0006xh-65
 for linux-mtd@lists.infradead.org; Sun, 19 Mar 2017 20:34:49 +0000
Subject: Re: One bit flip in erased page causes uncorrectable error using
 (LS1020A) HW ECC
To: Kees Trommel <ctrommel@aimvalley.nl>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <8f214368-48d1-ae21-b303-b36431abbeb9@aimvalley.nl>
 <CAFLxGvxrcUDEBcUsnQibYbX=-8BRSuP7ir3vzpFD-GL+Ofk7wg@mail.gmail.com>
 <09b0b187-4232-0018-b112-c7f8d24d2cd7@aimvalley.nl>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
 Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
From: Richard Weinberger <richard@nod.at>
Message-ID: <d1cd9806-97e3-9eac-fff9-62819d3c5d12@nod.at>
Date: Sun, 19 Mar 2017 21:34:17 +0100
MIME-Version: 1.0
In-Reply-To: <09b0b187-4232-0018-b112-c7f8d24d2cd7@aimvalley.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kees,

Am 14.03.2017 um 16:56 schrieb Kees Trommel:
> Richard,
> 
>> So, I fear your driver needs a better way to work around these bit flips
> 
> That was I afraid of, thanks for you answer.
> 
>> What exactly does UBI report?
> 
> fsl,ifc-nand 7e800000.flash: NAND Flash ECC Uncorrectable Error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from PEB 500:4096, read only 4096 bytes, retry
> fsl,ifc-nand 7e800000.flash: NAND Flash ECC Uncorrectable Error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from PEB 500:4096, read only 4096 bytes, retry
> fsl,ifc-nand 7e800000.flash: NAND Flash ECC Uncorrectable Error
> ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from PEB 500:4096, read only 4096 bytes, retry
> fsl,ifc-nand 7e800000.flash: NAND Flash ECC Uncorrectable Error
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 4096 bytes from PEB 500:4096, read 4096 bytes

Did you verify whether the data on PEB 500 are really 0xff bytes with bit-flips?

Thanks,
//richard
