Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1tyn-0004zz-SC
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 10:08:30 +0000
Message-ID: <55756867.1040403@cn.fujitsu.com>
Date: Mon, 8 Jun 2015 18:03:19 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <adrian.hunter@intel.com>,
 <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: Introduce a mount option of force_atime.
References: <1433752038-17276-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <557555F6.4030009@nod.at> <55755C48.4080802@cn.fujitsu.com>
 <5575616C.5090504@nod.at> <55756665.5070805@cn.fujitsu.com>
 <5575681D.20905@nod.at>
In-Reply-To: <5575681D.20905@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/08/2015 06:02 PM, Richard Weinberger wrote:
> Am 08.06.2015 um 11:54 schrieb Dongsheng Yang:
>> On 06/08/2015 05:33 PM, Richard Weinberger wrote:
>>> Am 08.06.2015 um 11:11 schrieb Dongsheng Yang:
>>>> On 06/08/2015 04:44 PM, Richard Weinberger wrote:
>>>>> Am 08.06.2015 um 10:27 schrieb Dongsheng Yang:
>>>>>> Currently, ubifs does not support access time anyway. I understand
>>>>>> that there is a overhead to update inode in each access from user.
>>>>>>
>>>>>> But for the following two reasons, I think we can make it optional
>>>>>> to user.
>>>>>>
>>>>>> (1). More and more flash storage in server are trying to use ubifs,
>>>>>> it is not only for a device such as mobile phone any more, we want
>>>>>> to use it in more and more generic way. Then we need to compete
>>>>>> with some other main filesystems. From this point, access time is
>>>>>> necessary to us, at least as a choice to user currently.
>>>>>
>>>>> Do you have a reference? I know that modern servers use a lot of SSDs
>>>>> which use internally NAND (mostly MLC and TLC).
>>>>> But which systems use RAW NAND where they would care about the atime?
>>>>
>>>> Hi Richard,
>>>>
>>>> Thanx for your quick response here.
>>>>
>>>> http://www.slideshare.net/FujitsuTS/bos-c113a-data-will-change-business-but-will-it-really-change-ict
>>>> I am not sure is that url available to you. But that's what my team is
>>>> focus on. It's about a server-using NAND device.
>>>
>>> So, you want to use UBI/UBIFS on NAND attached via PCEe?
>>> Is this SLC NAND? (UBI and UBIFS was designed with SLC in mind).
>>> MLC and TLC are a major challenge for UBI/UBIFS.
>>
>> It's SLC.
>
> Where can i get one of those? ;-)

Haha, unfortunately, it's a research project in Fujitsu lab. There is
a client, I am sorry I can't share the customer company name of it, for
this device. But I am afraid others would have to wait a long time to
get it in the market. :)
>
> Thanks,
> //richard
> .
>
