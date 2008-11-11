Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KzjvC-0002Sb-1j
	for linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 03:28:11 +0000
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
	by mailout5.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KA5000FSGAFJ4@mailout5.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 12:27:51 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KA500EHCGABBS@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 12:27:49 +0900 (KST)
Date: Tue, 11 Nov 2008 09:01:05 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
To: Adrian Hunter <ext-adrian.hunter@nokia.com>, Rohit <h.rohit@samsung.com>
Message-id: <6E87DF51DE3C4BC49C27B7FC516D051B@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
	<9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
	<1222404711.5012.5.camel@sauron>
	<A09E9029F2344F78959A3E36179C468E@sisodomain.com>
	<1222417176.5012.17.camel@sauron>
	<000b01c92215$ae62d4e0$3dd66c6b@sisodomain.com>
	<9c9fda240810091557j529495d5q284a8ab0e0d752dd@mail.gmail.com>
	<1224331498.6770.1362.camel@macbook.infradead.org>
	<000001c93271$5c6ab4c0$3dd66c6b@sisodomain.com>
	<1224482040.4466.73.camel@sauron>
	<000301c93411$74627df0$3dd66c6b@sisodomain.com>
	<4901DB27.4020401@nokia.com>
	<000901c93d9f$7c7ed0f0$3dd66c6b@sisodomain.com>
	<49115EC6.9090800@nokia.com>
	<49145004.9010202@samsung.com> <49185137.4040300@nokia.com>
Cc: 'Kyungmin Park' <kmpark@infradead.org>,
	apgmoorthy <moorthy.apg@samsung.com>,
	'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian


> Rohit wrote:
>> Adrian Hunter wrote:
>>>> + this->command(mtd, FLEXONENAND_CMD_PI_ACCESS, die, 
>>>> 0);
>>>> + this->wait(mtd, FL_SYNCING);
>>> Why is the error return not checked?
>>>
>>>> +
>>>> + this->command(mtd, ONENAND_CMD_READ, die, 0);
>>>> + ret = this->wait(mtd, FL_READING);
>>> Why is the error return not checked?
>>>
>>>> +
>>>> + bdry = this->read_word(this->base + ONENAND_DATARAM);
>>>> + locked = bdry >> FLEXONENAND_PI_UNLOCK_SHIFT;
>>>> + locked = (locked == 0x3) ? 0 : 1;
>>>> + this->boundary[die] = bdry & FLEXONENAND_PI_MASK;
>>>> + this->boundary_locked[die] = locked;
>>>> + this->command(mtd, ONENAND_CMD_RESET, 0, 0);
>>>> + ret = this->wait(mtd, FL_RESETING);
>>> Why is the error return not checked?
>>
>> As per datasheet PI_ACCESS, PI_UPDATE, PI_READ and RESET 
>> always succeed.
>> PI_ERASE and PI_WRITE can fail. Added error check for 
>> PI_ERASE.
>
> So if the device is behaving correctly and the driver has 
> no bugs and there
> are no other related hardware errors, then 'ret' will 
> always be zero.  Well,
> I would check it anyway, but that's just me.
>
>>>> + if (FLEXONENAND(this)) {
>>>> + int boundary[] =
>>>> + {FLEXONENAND_DIE0_BOUNDARY, 
>>>> FLEXONENAND_DIE1_BOUNDARY};
>>>> + int lock[] =
>>>> + {FLEXONENAND_DIE0_ISLOCKED, 
>>>> FLEXONENAND_DIE1_ISLOCKED};
>>>> + unsigned die;
>>>> +
>>>> + flexonenand_get_size(mtd);
>>>> +
>>>> + /* Change the device boundaries if required */
>>>> + for (die = 0; die < this->dies; die++)
>>>> + if ((!this->boundary_locked[die]) &&
>>>> +    (boundary[die] >= 0) &&
>>>> +    (boundary[die] != this->boundary[die]))
>>>> + flexonenand_set_boundary(mtd, die,
>>>> + boundary[die], lock[die]);
>>> I am not sure how you intend FLEXONENAND_DIEx_BOUNDARY 
>>> and FLEXONENAND_DIEx_ISLOCKED
>>> to be used.  Obviously this code presently does nothing. 
>>> If you expect the values
>>> to be configured for the device, then shouldn't they be 
>>> config options?
>>
>> Ok. Added config option for boundary and lock settings.
>> Configuration of boundary / lock is optional. Default 
>> value in config is -1
>> which will not change existing boundary of Flex-OneNAND.
>>
>>> Also, ideally there should be a way for the platform 
>>> driver to override them.
>>>
>>
>> Do you mean runtime configuration of boundary. Then we 
>> need to add some ioctl.
>>
>
> No I mean a onenand driver (e.g. omap2.c) that reads the 
> values from platform data
> and wants to set them.  It is not important.  It can be 
> done later by whomever needs it.
>
>> diff --git a/include/linux/mtd/onenand.h 
>> b/include/linux/mtd/onenand.h
>> index 9aa2a91..d23eeef 100644
>> --- a/include/linux/mtd/onenand.h
>> +++ b/include/linux/mtd/onenand.h
>> @@ -17,8 +17,23 @@
>>  #include <linux/mtd/onenand_regs.h>
>>  #include <linux/mtd/bbm.h>
>>  +#define MAX_DIES 2
>>  #define MAX_BUFFERRAM 2
>>  +#define FLEXONENAND_DIE0_BOUNDARY 
>> CONFIG_MTD_FLEXONENAND_DIE0_BOUNDARY
>> +#define FLEXONENAND_DIE1_BOUNDARY 
>> CONFIG_MTD_FLEXONENAND_DIE1_BOUNDARY
>> +
>
> CONFIG_MTD_FLEXONENAND_DIEx_BOUNDARY are not necessarily 
> defined i.e. you
> need "#if defined ..." there as well.
>
> I briefly tested the driver with an old 'non-Flex' OneNAND 
> and it seemd to work
> fine with no apparent effect on performance.  So I have no 
> more issues :-)

we will share iozone result on flexOneNand but during 
testing of  FlexOneNand on kernel 2.6.22 performance results 
are far better then 2.6.27 still we donot know the reasons.
we checked performance for OneNand on same kernel veriosn 
but OneNand also has down performance with 2.6.27 kernel 
version.still a question for us?

>
 Thanks
Amit 
