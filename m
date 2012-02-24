Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S0wyJ-0002T9-NL
 for linux-mtd@lists.infradead.org; Fri, 24 Feb 2012 15:22:12 +0000
Message-ID: <4F47AB21.1080807@parrot.com>
Date: Fri, 24 Feb 2012 16:22:09 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Patrick <kpa_info@yahoo.fr>
Subject: Re: Re : Re : UBI: infinite error loop
References: <1330090528.12272.YahooMailNeo@web29011.mail.ird.yahoo.com>
 <4F479601.9010605@parrot.com>
 <1330094829.26769.YahooMailNeo@web29019.mail.ird.yahoo.com>
 <4F47A58E.80702@parrot.com>
 <1330096132.68067.YahooMailNeo@web29008.mail.ird.yahoo.com>
In-Reply-To: <1330096132.68067.YahooMailNeo@web29008.mail.ird.yahoo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patrick a écrit :
> 
>>>>> Dear mailing-list,
>>>>>
>>>>> I am still trying to use UBI and UBIFS on my board running a 3.0.21 kernel.
>>>>>
>>>>> When I am doing an the ubiattach -p /dev/mtd4 command I have the following infinite error loop:
>>>>>
>>>>>
>>>>> .....
>>>>>
>>>>>
>>>>> I don't think it's normal that this error loop infinitely again and again...
>>>>>
>>>>> Any help is appreciated !
>>>>>
>>>>> Thanks in advance
>>>>>
>>>> What's your nand driver ?
>>>> What's your nand device ?
>>>>
>>>> Look like it doesn't handle subpage reading : you have ecc error when reading
>>>> 512 bytes at offset 512.
>>>>
>>>> Maybe you should pass -O 2048 to ubiattach
>>>>
>>> Hello Matthieu,
>>>
>>> Thanks for your answer.
>>>
>>> I have a Micron MT29F4G08ABBDAH4 and I use the MTD_NAND driver.
>> But what driver is using your nand controller ?
> 
> MTD_NAND_OMAP2
> 
>>> I have made a try with the -O 2048 flag but it's worst:
>> You need to use before ubiformat with the same flag.
> 
> It's seems to help. I could attach without error, but now I couldn't mount the volume:
> "LEB size mismatch: 129024 in superblock, 126976 real"
> I will try to rebuild my fs image with this size of LEB
> 
Yes now your leb size is 62*2K instead of 63*2K.

Matthieu
