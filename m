Received: from ebb06.tieto.com ([131.207.168.38])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz3RJ-0006La-OI
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 08:47:46 +0000
Message-ID: <4D7DD878.5090903@tieto.com>
Date: Mon, 14 Mar 2011 16:57:28 +0800
From: Yang Rui Rui <ruirui.r.yang@tieto.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH 02/02] force module loaded with partitions set
References: <20110314015148.GA6827@darkstar>
	<1300092195.2727.4.camel@localhost>
In-Reply-To: <1300092195.2727.4.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Yang Ruirui R <ruirui.r.yang@tietoenator.com>,
	"ext-phil.2.carmody@nokia.com" <ext-phil.2.carmody@nokia.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"ext-jani.1.nikula@nokia.com" <ext-jani.1.nikula@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/14/2011 04:43 PM, Artem Bityutskiy wrote:
> On Mon, 2011-03-14 at 09:51 +0800, Yang Ruirui wrote:
>> From: Yang Ruirui<ruirui.r.yang@tieto.com>
>>
>> partitions can not be set after module loaded, the moduel param mode is 0444.
>>
>> this patch force module loaded with param partitions set, if user does not
>> set partitions then give out a warning and return -EINVAL
>>
>> Signed-off-by: Yang Ruirui<ruirui.r.yang@tieto.com>
>> Tested-by: Shao Yanqing<yanqing.shao@tieto.com>
>> Tested-by: Xiao Yang<yang.xiao@tieto.com>
>> ---
>>   drivers/mtd/mtdswap.c |    6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> --- mtd-2.6-fc2ff59.orig/drivers/mtd/mtdswap.c	2011-03-14 09:36:09.283329099 +0800
>> +++ mtd-2.6-fc2ff59/drivers/mtd/mtdswap.c	2011-03-14 09:46:30.229993534 +0800
>> @@ -1569,6 +1569,12 @@ static struct mtd_blktrans_ops mtdswap_o
>>
>>   static int __init mtdswap_modinit(void)
>>   {
>> +	if (!partitions[0]) {
>> +		printk(KERN_WARNING
>> +			"Please load mtdswap with correct partitions param\n");
>> +		return -EINVAL;
>> +	}
>
> I think a similar check is done in mtdswap_add_mtd() ?
>
>

Yes, that one should be removed if this is ok. This module just waste memory without partitions set. And there's no chance to pass in the params.


-- 
Thanks
Yang Ruirui
