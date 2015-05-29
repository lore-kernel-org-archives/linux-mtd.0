Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YyN6C-0007g8-8z
 for linux-mtd@lists.infradead.org; Fri, 29 May 2015 16:25:32 +0000
Message-ID: <556892B8.3020706@hauke-m.de>
Date: Fri, 29 May 2015 18:24:24 +0200
From: Hauke Mehrtens <hauke@hauke-m.de>
MIME-Version: 1.0
To: Ray Jui <rjui@broadcom.com>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: iProc nand iproc-idm register
References: <5562078A.6030909@hauke-m.de> <55635511.30602@broadcom.com>
In-Reply-To: <55635511.30602@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/25/2015 07:00 PM, Ray Jui wrote:
> Hi Hauke,
> 
> On 5/24/2015 10:16 AM, Hauke Mehrtens wrote:
>> Hi Ray,
>>
>> in the iproc_nand driver your are using this register range:
>> reg = <0x18046000 0x600>, <0xf8105408 0x600>, <0x18046f00 0x20>;
>> reg-names = "nand", "iproc-idm", "iproc-ext";
>>
>> I think the iproc-idm register range is the wrap address part on bcma
>> bus. On the bcma bus it is 0x1000 in size and 0x0408 is the offset of
>> the IO control register in it. Are the new iProc devices different here
>> or is this register not always at this offset but varies?
> 
> It's different. Based on the Cygnus RDB, there's nothing between
> 0xf8105000 and 0xf8105404.

Thanks for the info, the space before 408 is not used on the older
chips, just some addresses ontop of that.

Still this is a strange address to start a register map.

> 
>>
>> Wouldn't it be better to specify the complete range like this:
>> reg = <0x18046000 0x600>, <0xf8105000 0x1000>, <0x18046f00 0x20>;
>> Then you can read the register at offset 0x408 in that range.
>>
>> Hauke
>>
