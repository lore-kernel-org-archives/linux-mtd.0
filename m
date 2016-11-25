Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAGhF-0006TR-1D
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 13:37:49 +0000
Subject: Re: [RESEND PATCH v5 2/5] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
To: Brian Norris <computersforpeace@gmail.com>, Zach Brown <zach.brown@ni.com>
References: <1479757899-6849-1-git-send-email-zach.brown@ni.com>
 <1479757899-6849-3-git-send-email-zach.brown@ni.com>
 <20161122184215.GA77253@google.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <b6fe6ae4-7ef2-ed61-3bb4-dd00f92524f8@nod.at>
Date: Fri, 25 Nov 2016 14:37:22 +0100
MIME-Version: 1.0
In-Reply-To: <20161122184215.GA77253@google.com>
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

Zach, Brian,

sorry for the late review.

On 22.11.2016 19:42, Brian Norris wrote:
> On Mon, Nov 21, 2016 at 01:51:36PM -0600, Zach Brown wrote:
>> From: Jeff Westfahl <jeff.westfahl@ni.com>
>>
>> Use the MTD function 'max_bad_blocks' to compute the UBI bad_peb_limit,
>> if the function is implemented for an MTD and doesn't return an error.
> 
> I'm not exactly a UBI expert here, but it seems reasonable that we
> should adjust the Kconfig documentation for MTD_UBI_BEB_LIMIT to further
> emphasize that it's a default, if the value can't be determined by other
> means.
> 
>> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
>> Signed-off-by: Zach Brown <zach.brown@ni.com>
>> Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
>> ---
>>  drivers/mtd/ubi/build.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>> index 85d54f3..e9940a9 100644
>> --- a/drivers/mtd/ubi/build.c
>> +++ b/drivers/mtd/ubi/build.c
>> @@ -584,6 +584,10 @@ static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_per1024)
>>  	int limit, device_pebs;
>>  	uint64_t device_size;
>>  
>> +	limit = mtd_max_bad_blocks(ubi->mtd, 0, ubi->mtd->size);
>> +	if (limit > 0)
>> +		return limit;
> 
> Are you sure you want to even override the user-provided
> max_beb_per1024 value taken from the mtd= line? I'd think if someone
> went as far as to specify this in the kernel command line, they don't
> expect it to get overridden. Just my two cents.

I agree. With this patch applied the limit can be set via Kconfig, cmdline and automatically.
IMHO the automatic value via mtd_max_bad_blocks and over-writeable via cmdline and Kconfig.
...and this needs to be documented. :-)
I'd go so far and suggest dropping the Kconfig option.

Thanks,
//richard
