Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1DbL-0001FT-T4
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 06:26:19 +0000
Message-ID: <4AE14C2F.9010307@nokia.com>
Date: Fri, 23 Oct 2009 09:24:47 +0300
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH v6 0/3] *** SUBJECT HERE ***
References: <1256277044-29174-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1256278192.29885.224.camel@localhost>
In-Reply-To: <1256278192.29885.224.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Fri, 2009-10-23 at 07:50 +0200, Korhonen Mika.2 (EXT-Ardites/Oulu)
> wrote:
>   
>> (v6) Leave fail_addr to unknown if multiblock erase fails
>>
>> (v5) Adjust patches to apply on current tree. Use __func__ in printk's.
>>      Fix mistakes found by K. Park.
>>
>> (v4) This patch series is a reworked version of
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2009-September/027138.html
>> http://lists.infradead.org/pipermail/linux-mtd/2009-September/027139.html
>> http://lists.infradead.org/pipermail/linux-mtd/2009-September/027140.html
>>
>> based on comments by Adrian Hunter and Kyungmin Park. This version should
>> address the issues pointed out by them.
>>
>> The original patch is:
>> http://lists.infradead.org/pipermail/linux-mtd/2009-June/026130.html
>>
>> I split the original patch in two for readability: the first part extracts
>> the execution of erase command to a separate function for easier integration
>> of different erase method. The second part implements the multiblock erase
>> function in case multiple blocks are requested to be erased and the chip is
>> not Flex.
>>
>> This is useful for flashing applications that need to do their work as
>> fast as possible. For full 64 eraseblock case the erase speed is up to 30x
>> faster. (Samsung: 64 MB/s vs 2.1 GB/s, I got 1.4 GB/s on Linux kernel)
>>
>>
>> Mika Korhonen (3):
>>   MTD: OneNAND: move erase method to a separate function
>>   MTD: OneNAND: multiblock erase support
>>   MTD: OneNAND: fix double printing of function name
>>
>>  drivers/mtd/onenand/omap2.c        |   22 +++-
>>  drivers/mtd/onenand/onenand_base.c |  289 +++++++++++++++++++++++++++++------
>>  include/linux/mtd/flashchip.h      |    4 +-
>>  include/linux/mtd/onenand_regs.h   |    2 +
>>  4 files changed, 262 insertions(+), 55 deletions(-)
>>     
>
> Applied to my l2 tree, thanks.
>
> Just FYI: when I apply your patches I end up with:
>
> From: Korhonen Mika.2 (EXT-Ardites/Oulu) <ext-mika.2.korhonen@nokia.com>
>
> which looks ugly. I've amended your patches and fixed the name, but I do
> not think other people will necessarily provide this service for you.
>
> So what I suggest you is when sending stuff upstream, add manually
>
> From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>
> to the beginning of your e-mails.
>
> Or just use sane accounts like gmail.com
>
>   
Thanks,
The From: field was like that (without .2). Looks like smtp.nokia.com 
tampers with the field...

Mika
