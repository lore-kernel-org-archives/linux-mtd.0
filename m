Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f60P2-0000zH-TB
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 21:02:10 +0000
Received: by mail-wr0-x22c.google.com with SMTP id d1so14104458wrj.13
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2018 14:01:58 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: Add Micron MT25QU02 support
To: thor.thayer@linux.intel.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org
References: <1522955569-19927-1-git-send-email-thor.thayer@linux.intel.com>
 <5b5783bc-5f7b-0076-6dde-993ffe36ca58@gmail.com>
 <b580ae74-b54c-6912-7238-dae8deb94072@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1b9cbb7a-1976-6e4e-498c-28e351357c7b@gmail.com>
Date: Tue, 10 Apr 2018 23:01:49 +0200
MIME-Version: 1.0
In-Reply-To: <b580ae74-b54c-6912-7238-dae8deb94072@linux.intel.com>
Content-Type: text/plain; charset=utf-8
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

On 04/10/2018 10:35 PM, Thor Thayer wrote:
> Hi Marek,
> 
> On 04/05/2018 02:17 PM, Marek Vasut wrote:
>> On 04/05/2018 09:12 PM, thor.thayer@linux.intel.com wrote:
>>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>>
>>> Add support for a new Micron 2Gb Flash memory part.
>>> Datasheet is available: mt25q_qlkt_l_02g_cbb_0.pdf
>>>
>>> Testing was done on a Stratix10 SoCFPGA Development Kit.
>>>
>>> Reported-by: Sujith Chidurala <sujith.chakra.chidurala@intel.com>
>>> Tested-by: Paul Kim <paul.kim@intel.com>
>>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>>> ---
>>
>> Do we need this or can this be recognized as a SFDP flash ?
>>
> The error is
> "cadence-qspi ff8d2000.spi: unrecognized JEDEC id bytes: 20, bb, 22"
> which is fixed with this table addition. Is there a better way to handle
> this?

Seems like even with the SFDP parsing in place, we still need to track
the supported IDs, oh well.

Acked-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
