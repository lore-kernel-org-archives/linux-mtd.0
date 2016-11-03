Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2D7Q-0000b9-5T
 for linux-mtd@lists.infradead.org; Thu, 03 Nov 2016 08:11:29 +0000
Subject: Re: UBIFS LEB properties tree with odd addresses
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>
References: <DA6901612C71B84D91459DE817C418AE26E0016D@XAP-PVEXMBX01.xlnx.xilinx.com>
 <e7f63f72-0dc1-54f4-b94c-2efef3e7af6b@nod.at>
 <DA6901612C71B84D91459DE817C418AE26E0069D@XAP-PVEXMBX01.xlnx.xilinx.com>
 <c6e394c9-bbec-1121-7a93-268abcf934bf@nod.at>
 <DA6901612C71B84D91459DE817C418AE26E02536@XAP-PVEXMBX01.xlnx.xilinx.com>
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
Message-ID: <b8bb5842-0fda-43aa-9e56-4dc5c940b3c6@nod.at>
Date: Thu, 3 Nov 2016 09:10:52 +0100
MIME-Version: 1.0
In-Reply-To: <DA6901612C71B84D91459DE817C418AE26E02536@XAP-PVEXMBX01.xlnx.xilinx.com>
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

On 03.11.2016 06:11, Naga Sureshkumar Relli wrote:
> Hi Richard,
> 
>>> Hmm, the calculations in lpt.c use basic properties of the MTD (number of blocks, etc...).
>>> Can you please double check which property causes the failure and also verify whether the MTD driver provides correct properties. i.e. page sizes, block size, number of blocks, ...
> 
>> Hm, these values depend only on basic MTD prperties AFAICT.
>> Mtd->numeraseregions = 0
>> Nor->pagesize = 512
> 
> As per the above query only, I have given the below inputs.
>> Maybe you miss some bit and set incorrect MTD properties.
> I double checked the MTD properties (as mentioned above) which were causing the failure, but didn't find any clue.
> All mtd properties looks good for dual parallel case(there is no odd value).
> 
> Is there any impact by putting below logic in do_calc_lpt_geom() ?
> If(c->pnode_sz % 2)
>     c->pnode_sz += 1;

Yes, we need to understand first what exactly is going on.

> please suggest me to do any further debugging?

Please find the exact MTD property which causes the odd values.
Can you also please share the full kernel log of both cases? (dual and non-dual).
I'm especially interested in the output of UBI.
I have the feeling that we oversee something.

Thanks,
//richard
