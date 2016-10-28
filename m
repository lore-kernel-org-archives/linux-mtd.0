Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzw5F-0002Q5-Es
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 01:35:51 +0000
Subject: Re: MTD partitions vs erase regions
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
References: <AM4PR0701MB21304CE213B5F0B0534AB52FFEAA0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <35c63aa4-d686-e06a-a12f-408c25895a22@denx.de>
Date: Fri, 28 Oct 2016 02:14:58 +0200
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB21304CE213B5F0B0534AB52FFEAA0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/27/2016 02:19 PM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
> Hi Marek,

Hi,

> I am sending mtd partition and erase regions conflict that I had.
> I admit I have no investigated it, since finally all is different.
> This could make some problems with your idea of having erase sizes defined from DT.

Which flash is that ?

> Erase regions configuration:
> 
> nor->eraseregions[0].erasesize = 4096;
> nor->eraseregions[0].numblocks = 8;
> nor->eraseregions[0].offset = 0x0;
> 
> nor->eraseregions[1].erasesize = 32*1024;
> nor->eraseregions[1].numblocks = 1;
> nor->eraseregions[1].offset = 32*1024;
> 
> nor->eraseregions[2].erasesize = 64*1024;
> nor->eraseregions[2].numblocks = div_u64_rem(mtd->size - 64*1024, info->sector_size, &rem);
> nor->eraseregions[2].offset = 64*1024;
> 
> Device tree (mtd):
> 
> partition@0 {
> label = "all";
> reg = <0x00000000 0x08000000>;
> };
> 
> partition@1 {
> label = "small";
> reg = <0x00000000 0x00008000>;
> };
> 
> partition@2 {
> label = "rest"; 
> reg = <0x00008000 0x07FF8000>;
> };
> 
> Logs from startup:
> 
> [    1.187722] 0x000000000000-0x000008000000 : "all"
> [    1.188498] device: 'mtd0': device_add
> [    1.189563] device: 'mtd0ro': device_add
> [    1.192359] device: '31:0': device_add
> [    1.192810] device: 'mtdblock0': device_add
> [    1.194504] 0x000000000000-0x000000008000 : "small"
> [    1.195144] device: 'mtd1': device_add
> [    1.196667] device: 'mtd1ro': device_add
> [    1.198268] device: '31:1': device_add
> [    1.199016] device: 'mtdblock1': device_add
> [    1.200922] 0x000000008000-0x000008000000 : "rest"
> [    1.201222] mtd: partition "rest" doesn't start on an erase block boundary -- force read-only
> [    1.201613] device: 'mtd2': device_add
> [    1.202541] device: 'mtd2ro': device_add
> [    1.204659] device: '31:2': device_add
> [    1.206233] device: 'mtdblock2': device_add
> 
> Message is from here:
> http://lxr.free-electrons.com/source/drivers/mtd/mtdpart.c?v=4.4#L526
> 
> Regards,
> Marcin
> 


-- 
Best regards,
Marek Vasut
