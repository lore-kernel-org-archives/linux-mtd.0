Message-ID: <48E9AFFF.2080009@nokia.com>
Date: Mon, 06 Oct 2008 09:28:15 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [RFC] Support for > 2Gib MTD
References: <OFBFC97F2E.8869DAF6-ON882574D7.006EFDFB-882574D7.00713C5B@selinc.com>
	<1223270688.8051.78.camel@sauron>
In-Reply-To: <1223270688.8051.78.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Artem Bityutskiy wrote:
> Hi,
> 
> On Fri, 2008-10-03 at 13:36 -0700, Bruce_Leonard@selinc.com wrote:
>> Here's a rough idea of what I'm thinking.  In .../include/mtd/mtd-abi.h 
>> add new 64 bit structs like this:
>>
>> +struct erase_info_user_64 {
>> +       uint64_t start;
>> +       uint64_t length;
>> +}
>>
>> +struct mtd_info_user_64 {
>> +       ...
>> +       uint32_t flags;
>> +       uint64_t size;
>> +       ...
>> +}
>>
>> These new structs would be identical to the old ones execept for the types 
>> on a few fields.
> 
> Please, add something like
> uint8_t padding[128]; /* Reserved for future, should be zeroed */
> to the new data structures.
> 
>>   To indicate that the new 64 bit interface is to be used 
>> I would introduce a new flag for 'struct mtd_info_user_XX->flags', 
>> something like this:
>>
>> #define MTD_LARGE_SIZE 0x4000
> 
> No need for this. Because you'll change size of data structures and
> their layout, this is not going to be compatible anyway.
> 
>> In .../include/linux/mtd.h I would add new fields as follows:
>>
>> struct erase_info {
>>         ...
>>         u_int32 fail_addr;
>> +       u_int64_t addr_64;
>> +       u_int64_t len_64;
>> +       u_int64_t fail_addr_64;
>>         u_long time;
>>         ...
>> }
>>
>> struct mtd_info {
>>         ...
>>         u_int32_t size;
>> +       u_int64_t size_64;
>>         u_int32_t erasesize;
>>         ...
>> }
> 
> This is what I would avoid doing. I would try to make size 64-bit and
> amend all MTD users if needed.

Yes, why not just change the size to 64-bits and fix the code that assumes
32-bits?  I have unfinished patches that take that approach - they seem
to work for NAND - at least nandsim works.

>> Plus a few new IOCTLs for getting info to/from user space if people want 
>> to use it.
> 
> I do not mind ioctl for this, but dwmw2 expressed a desire to do this
> via sysfs instead of ioctl...

It would be simpler, more consistent, and easier to understand just to
create a set of 64-bit IOCTLs that are otherwise the same as their 32-bit
counterparts.
