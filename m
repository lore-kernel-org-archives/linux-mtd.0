Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1t04-0000H1-Jx
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 12:51:37 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Use DMA-safe buffer for JEDEC ID in
 spi_nor_read_id()
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
References: <20180917081018.14475-1-jarkko.nikula@linux.intel.com>
 <20180917101851.3d359d18@bbrezillon> <20180917102821.16c69697@bbrezillon>
 <08b87712-b018-e448-21b5-aa7c3c7b82cc@linux.intel.com>
 <20180917104633.5a18bcd1@bbrezillon>
 <03fe4a2a-2b74-b4b9-b143-9a1ef5cb4907@linux.intel.com>
 <20180917142857.16be0331@bbrezillon>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <870a6721-620c-a73c-82f9-014fdb02cd6c@linux.intel.com>
Date: Mon, 17 Sep 2018 15:51:24 +0300
MIME-Version: 1.0
In-Reply-To: <20180917142857.16be0331@bbrezillon>
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

On 09/17/2018 03:28 PM, Boris Brezillon wrote:
> On Mon, 17 Sep 2018 12:04:43 +0300
> Jarkko Nikula <jarkko.nikula@linux.intel.com> wrote:
> 
>> On 09/17/2018 11:46 AM, Boris Brezillon wrote:
>>> On Mon, 17 Sep 2018 11:41:31 +0300
>>> Jarkko Nikula <jarkko.nikula@linux.intel.com> wrote:
>>>    
>>>> On 09/17/2018 11:28 AM, Boris Brezillon wrote:
>>>>>
>>>>> Hm, I just had a look at all ->read/write_reg() call sites and it seems
>>>>> we have the same problem in other places. Maybe it's just better to fix
>>>>> the problem in m25p80 ->read/write_reg() implems for now
> 
> Do you plan to send a new fix doing that, or should I? I'd really like
> to have the fix queued to mtd/master early this week, so that it
> spends a bit of time in -next.
> 
I guess better if you could as I haven't started anything yet. I'm not 
so familiar with the code to see what would be best way to fix, 
reverting m25p80_read_reg/m25p80_write_reg back to spi_write(), the 
whole commit or do some kmemdup() there.

-- 
Jarkko
