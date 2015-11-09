Received: from mail-gw1-out.broadcom.com ([216.31.210.62])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvtO8-0005IB-9Y
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 20:50:04 +0000
Subject: Re: Hang on reboot in nand_get_device()
To: "Andrew E. Mileski" <andrewm@isoar.ca>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
References: <55958F4C.1020002@isoar.ca> <20151106180052.GE12143@google.com>
 <20151106195903.0d55d819@bbrezillon> <20151109194651.GI12143@google.com>
 <5640FA8A.3010209@isoar.ca>
CC: linux-mtd <linux-mtd@lists.infradead.org>
From: Scott Branden <sbranden@broadcom.com>
Message-ID: <564106E5.8020804@broadcom.com>
Date: Mon, 9 Nov 2015 12:49:41 -0800
MIME-Version: 1.0
In-Reply-To: <5640FA8A.3010209@isoar.ca>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15-11-09 11:56 AM, Andrew E. Mileski wrote:
> On 2015-11-09 14:46, Brian Norris wrote:
>>
>> No, and that's the point of "getting" the device, without actually
>> releasing it. (Andrew's suggestion is essentially a
>> nand_release_device().) We don't want any other process picking up any
>> I/O at this point. I suppose there really is no way to begin any new
>> I/O, but it does seem possible for the last operation to still be in
>> flight, at least according to Scott's reports.
>
> That right there. is the very reason I questioned whether my approach
> was sufficient.

Yes, the last operation can still be in flight - there are async cleanup 
threads running in the UBI/UBIFS layers which recreated this problem.
>
> ~~Andrew E. Mileski
