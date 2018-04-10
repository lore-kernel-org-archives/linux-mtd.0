Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5zx2-0005YV-HT
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 20:33:14 +0000
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH] mtd: spi-nor: Add Micron MT25QU02 support
To: Marek Vasut <marek.vasut@gmail.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org
References: <1522955569-19927-1-git-send-email-thor.thayer@linux.intel.com>
 <5b5783bc-5f7b-0076-6dde-993ffe36ca58@gmail.com>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <b580ae74-b54c-6912-7238-dae8deb94072@linux.intel.com>
Date: Tue, 10 Apr 2018 15:35:48 -0500
MIME-Version: 1.0
In-Reply-To: <5b5783bc-5f7b-0076-6dde-993ffe36ca58@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On 04/05/2018 02:17 PM, Marek Vasut wrote:
> On 04/05/2018 09:12 PM, thor.thayer@linux.intel.com wrote:
>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>
>> Add support for a new Micron 2Gb Flash memory part.
>> Datasheet is available: mt25q_qlkt_l_02g_cbb_0.pdf
>>
>> Testing was done on a Stratix10 SoCFPGA Development Kit.
>>
>> Reported-by: Sujith Chidurala <sujith.chakra.chidurala@intel.com>
>> Tested-by: Paul Kim <paul.kim@intel.com>
>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>> ---
> 
> Do we need this or can this be recognized as a SFDP flash ?
> 
The error is
"cadence-qspi ff8d2000.spi: unrecognized JEDEC id bytes: 20, bb, 22" 
which is fixed with this table addition. Is there a better way to handle 
this?

Thanks for reviewing and the reply.

Thor
