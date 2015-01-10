Message-ID: <54B1B6BB.2080302@mentor.com>
Date: Sun, 11 Jan 2015 01:33:15 +0200
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: don't return found by JEDEC ID a non-JEDEC
 flash
References: <1418511647-24736-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20150109222310.GY9759@ld-irv-0074> <54B13D13.6020406@mentor.com>
 <20150110182910.GA3268@brian-ubuntu>
In-Reply-To: <20150110182910.GA3268@brian-ubuntu>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie.huang@intel.com>, linux-mtd@lists.infradead.org,
 zajec5@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10.01.2015 20:29, Brian Norris wrote:
> On Sat, Jan 10, 2015 at 04:54:11PM +0200, Vladimir Zapolskiy wrote:
>> On 10.01.2015 00:28, Brian Norris wrote:
>>> On Sun, Dec 14, 2014 at 01:00:47AM +0200, Vladimir Zapolskiy wrote:
>>>> In attempt to spi_nor_scan() for an expected JEDEC compliant device by
>>>> reading RDID register don't return the first found non-JEDEC device
>>>> entry from spi_nor_ids[] table, if RDID is zero.
>>>>
>>>> First of all zeroes in RDID may be evidence for not correctly working
>>>> SPI, secondly empty RDID can not be used to select a particular JEDEC
>>>> non-compliant device correctly.
>>>>
>>>> The best possible solution is
>>>> * not to rely on spi_nor_read_id(), if expected device is non-JEDEC,
>>>> * not to substitute an expected JEDEC device with some arbitrary
>>>>   chosen non-JEDEC device, if RDID is zero.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>>>
>>> This patch doesn't apply to the latest tree. I think this commit
>>> probably already fixes your issue:
>>>
>>>   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=09ffafb6977dc930770af2910edc3b469651131d
>>>
>>>   commit 09ffafb6977dc930770af2910edc3b469651131d
>>>   Author: Huang Shijie <shijie.huang@intel.com>
>>>   Date:   Thu Nov 6 07:34:01 2014 +0100
>>>
>>>       mtd: spi-nor: add id/id_len for flash_info{}
>>
>> thank you for review.
>>
>> 09ffafb69 fixes my problem (and more), however regarding to my problem
>> it does it in non-optimal way. If read JDID is zero, then there is no
>> need to iterate over spi_nor_ids array to return ERR_PTR(-ENODEV).
> 
> I'm not too worried about spinning a few extra cycles here. What makes
> this particular special case different than a system where we don't
> support the flash? We'll still likely have to scan through the whole
> array just to end up witih -ENODEV.

The difference is pretty visible, if JDID is zero, then it is known in
advance that looking for a proper flash device from spi_nor_ids is
fruitless and therefore can be omitted.

>> Assuming that zero JEDEC ID is a relatively rare situation, do you think
>> it makes sense to add a preceding check for such case before entering
>> the loop like it is done in my patch?
> 
> As long as the current driver actually fails gracefully on a zero ID, I
> think we're OK without special case conditions.

No objections, the optimization on error path may be considered as
redundant.

>> If no, I'm fine, if yes, I'll rebase the change.
> 

--
With best wishes,
Vladimir
