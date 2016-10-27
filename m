Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzkAU-0000vY-Vb
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 12:52:29 +0000
Subject: Re: UBIFS LEB properties tree with odd addresses
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>
References: <DA6901612C71B84D91459DE817C418AE26E0016D@XAP-PVEXMBX01.xlnx.xilinx.com>
 <e7f63f72-0dc1-54f4-b94c-2efef3e7af6b@nod.at>
 <DA6901612C71B84D91459DE817C418AE26E0069D@XAP-PVEXMBX01.xlnx.xilinx.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <c6e394c9-bbec-1121-7a93-268abcf934bf@nod.at>
Date: Thu, 27 Oct 2016 14:51:55 +0200
MIME-Version: 1.0
In-Reply-To: <DA6901612C71B84D91459DE817C418AE26E0069D@XAP-PVEXMBX01.xlnx.xilinx.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Naga Sureshkumar Relli,

On 26.10.2016 14:11, Naga Sureshkumar Relli wrote:
> Hi Richard,
> 
> -----Original Message-----
> From: Richard Weinberger [mailto:richard@nod.at] 
> Sent: Wednesday, October 26, 2016 2:44 AM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>; Christoph Hellwig <hch@infradead.org>
> Cc: dwmw2@infradead.org; computersforpeace@gmail.com; dedekind1@gmail.com; adrian.hunter@intel.com; michal.simek@xilinx.com; Punnaiah Choudary Kalluri <punnaia@xilinx.com>; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Boris Brezillon <boris.brezillon@free-electrons.com>
> Subject: Re: UBIFS LEB properties tree with odd addresses
> 
> Naga Sureshkumar Relli,
>>     Even bytes i.e. 0, 2, 4,... are transmitted on Lower Data Bus
>>     Odd bytes i.e. 1, 3, 5,.. are transmitted on Upper Data Bus.
> 
>> But these details are hidden from UBI?
> 
> Yes, Our controller driver will take care of these byte striping.
> 
>> So for temporary hack we did the following change In fs/ubifs/lpt.c In 
>> do_calc_lpt_geom(), added the following
>> +       if (c->pnode_sz % 2)
>> +               c->pnode_sz += 1; 
>> +       if (c->ltab_sz % 2)
>> +               c->ltab_sz += 1;
>>
>> Please kindly suggest, I need your inputs, changing the pnode_sz and ltab_sz to even in lpt.c, will it impact on any others?
> 
>> Hmm, the calculations in lpt.c use basic properties of the MTD (number of blocks, etc...).
>> Can you please double check which property causes the failure and also verify whether the MTD driver provides correct properties. i.e. page sizes, block size, number of blocks, ...
> 
> Yes, only pnode_sz and ltab_sz are odd values

Hm, these values depend only on basic MTD prperties AFAICT.

> And MTD info, here are my logs
> In Single Flash mode:
> Mtd->erasesize = 64KiB
> Mtd->size = 64MiB
> Mtd->numeraseregions = 0
> Nor->pagesize = 256
> 
> In Dual parallel mode:
> Mtd->erasesize = 128KiB
> Mtd->size = 128MiB
> Mtd->numeraseregions = 0
> Nor->pagesize = 512

How does UBI report them?
Maybe you miss some bit and set incorrect MTD properties.

A 128MiB MTD with 128KiB erase size is nothing special.

Thanks,
//richard
