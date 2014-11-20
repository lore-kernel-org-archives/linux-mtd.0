Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrReq-0003fB-8i
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 13:20:24 +0000
Message-ID: <546DEA1C.2080805@imgtec.com>
Date: Thu, 20 Nov 2014 10:18:20 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: bpqw <bpqw@micron.com>, Brian Norris <computersforpeace@gmail.com>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
References: <71CF8D7F32C5C24C9CD1D0E02D52498A7713208B@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7713208B@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Cc: "ionela.voinescu@imgtec.com" <ionela.voinescu@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 11/20/2014 05:39 AM, bpqw wrote:
> Hi Brian, Arnaud:
>> If we are going to a specific spinand framework, my advice would be to 
>> read again the spi nor framework carefully first, and do something 
>> similar (especially for latests work on quad spi)
> 
> I think above idea is good. 
> SPI NAND interface and command protocol are similar with SPI NOR, we can 
> create a SPI NAND folder with similar framework with SPI NOR. But need to duplicate 
> nand_bbt and nand_bch code into this folder due to SPI NAND still need BBM and ECC.
> How do you think?
> 

Hm, perhaps it's better to rely in the NAND core code and avoid that BBT
and ECC code handling duplication?

Ionela and I are preparing an SPI NAND framework, but it's far from
ready yet, so if you have something to submit, please do so :)

Thanks,
-- 
Ezequiel
