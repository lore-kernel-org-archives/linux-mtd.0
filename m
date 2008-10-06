Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kmlwp-0007tS-Ob
	for linux-mtd@lists.infradead.org; Mon, 06 Oct 2008 09:00:12 +0000
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K8B001EU7NYCG@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 06 Oct 2008 17:59:58 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K8B003247NWHZ@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 06 Oct 2008 17:59:58 +0900 (KST)
Date: Mon, 06 Oct 2008 14:32:36 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [RFC] Support for > 2Gib MTD
To: dedekind@infradead.org, Bruce_Leonard@selinc.com
Message-id: <2C92282F5C9E4DB7A12A0AB04BF80AEA@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <OFBFC97F2E.8869DAF6-ON882574D7.006EFDFB-882574D7.00713C5B@selinc.com>
	<1223270688.8051.78.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Folks

We should consider 4KB page size also that why i think 
padding of dummy bits will help for such issues.
because we have faced problem in abi.h file because current 
mtd-abi.h structure donot consider 4KB Nand flash.


Rgs
Amit
----- Original Message ----- 
From: "Artem Bityutskiy" <dedekind@infradead.org>
To: <Bruce_Leonard@selinc.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Monday, October 06, 2008 10:54 AM
Subject: Re: [RFC] Support for > 2Gib MTD


> Hi,
>
> On Fri, 2008-10-03 at 13:36 -0700, 
> Bruce_Leonard@selinc.com wrote:
>> Here's a rough idea of what I'm thinking.  In 
>> .../include/mtd/mtd-abi.h
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
>> These new structs would be identical to the old ones 
>> execept for the types
>> on a few fields.
>
> Please, add something like
> uint8_t padding[128]; /* Reserved for future, should be 
> zeroed */
> to the new data structures.
>
>>   To indicate that the new 64 bit interface is to be used
>> I would introduce a new flag for 'struct 
>> mtd_info_user_XX->flags',
>> something like this:
>>
>> #define MTD_LARGE_SIZE 0x4000
>
> No need for this. Because you'll change size of data 
> structures and
> their layout, this is not going to be compatible anyway.
>
>> In .../include/linux/mtd.h I would add new fields as 
>> follows:
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
> This is what I would avoid doing. I would try to make size 
> 64-bit and
> amend all MTD users if needed.
>
>> Plus a few new IOCTLs for getting info to/from user space 
>> if people want
>> to use it.
>
> I do not mind ioctl for this, but dwmw2 expressed a desire 
> to do this
> via sysfs instead of ioctl...
>
> -- 
> Best regards,
> Artem Bityutskiy (???????? ?????)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
