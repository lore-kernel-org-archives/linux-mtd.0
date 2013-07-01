Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uti5O-0003Ry-Gi
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 17:40:23 +0000
Message-ID: <51D1BE59.4000203@ti.com>
Date: Mon, 1 Jul 2013 23:07:29 +0530
From: Mugunthan V N <mugunthanvnm@ti.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v3 1/4] mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC
 configurations in device_probe
References: <1372010299-30141-1-git-send-email-pekon@ti.com>
 <1372010299-30141-2-git-send-email-pekon@ti.com>
 <1372666588.22014.43.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E29F6@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9E29F6@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "arnd@arndb.de" <arnd@arndb.de>, "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Benoit Cousson \(benoit.cousson@linaro.org\)" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/1/2013 3:32 PM, Gupta, Pekon wrote:
>> Hi Pekon,
>>
>> On Sun, 2013-06-23 at 23:28 +0530, Pekon Gupta wrote:
>>> +---------------------------------------+---------------+---------------+
>>> | ECC scheme				|ECC calculation|Error
>> detection|
>>> +---------------------------------------+---------------+---------------+
>>> |OMAP_ECC_HAMMING_CODE_DEFAULT		|S/W		|S/W
>> 		|
>>> |OMAP_ECC_HAMMING_CODE_HW		|H/W (GPMC)	|S/W
>> 	|
>>> |OMAP_ECC_HAMMING_CODE_HW_ROMCODE	|H/W (GPMC)	|S/W
>> 		|
>>> +---------------------------------------+---------------+---------------+
>>> |(requires CONFIG_MTD_NAND_ECC_BCH)	|		|
>> 	|
>>> |OMAP_ECC_BCH8_CODE_HW_DETECTION_SW	|H/W (GPMC)	|S/W
>> 		|
>>> +---------------------------------------+---------------+---------------+
>>> |(requires CONFIG_MTD_NAND_OMAP_BCH)	|		|
>> 		|
>>> |OMAP_ECC_BCH8_CODE_HW			|H/W (GPMC)	|H/W
>> (ELM)	|
>>> +---------------------------------------+---------------+---------------+
>> This is a nice table, and you are doing very good job clearly
>> classifying what is going on. I'd suggest to also put stuff like this to
>> comments in the code.
>>
> [Pekon]: Thanks for encouragement, would include more inline comments in future.
>
>>> This patch
>>> - separates the configurations for various ECC schemes.
>>> - fixes dependency issues based on Kconfig options.
>>> - cleans up redundant code
>>>
>>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>> This does not apply to l2-mtd.git, could you please re-base?
>>
> [Pekon]: rebased to l2-mtd.git
> - updated [Patch 3/4] which conflicted with commit '26331c04' which touched omap2.c.
> - Please ignore [Patch 4/4] as it’s a DT update, which adds on top of Benoit's tree (which has NAND node commits too).
If you need one patch (DT patch) in the series to be merged in another
repository (DT maintainer tree) then separate out that patch as separate
series and mention the dependency or need ack from the driver maintainer
so that both maintainer can apply the whole series into his repository
instead of applying partially here and there.

Regards
Mugunthan V N
