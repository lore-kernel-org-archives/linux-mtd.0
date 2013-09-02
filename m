Received: from mail1.bemta7.messagelabs.com ([216.82.254.110])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGPjU-0001eK-BC
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2013 08:43:37 +0000
Message-ID: <52244F85.4030904@digi.com>
Date: Mon, 2 Sep 2013 10:42:45 +0200
From: Hector Palacios <hector.palacios@digi.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com> <20130831025344.GA9971@gmail.com>
 <5220B8F6.3080405@digi.com> <20130831033438.GA13704@gmail.com>
 <5220C8C4.5010305@digi.com>
 <CAOMZO5CTQZBmvQc4y761kGHWYWRXr7GwVrTuTPE+JU=bmjq62w@mail.gmail.com>
 <5220CB56.7040505@digi.com> <20130831133728.GA22069@gmail.com>
 <52244886.8060205@digi.com> <52244B22.3020605@freescale.com>
In-Reply-To: <52244B22.3020605@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang,

On 09/02/2013 10:24 AM, Huang Shijie wrote:
> 于 2013年09月02日 16:12, Hector Palacios 写道:
>>> I think this SLC should be okay with jffs2.
>>>
>>>>>>
>>>>>> The partition now partially mounts (I can see a few of the folders
>>>>>> and
>>>>>> files) but I get thousands of errors like these:
>>>>>>
>>>>>> [ 118.210985] jffs2: mtd->read(0x100 bytes from 0x0) returned ECC
>>>>>> error
>>>>>> [ 118.255424] jffs2: mtd->read(0x1ff20 bytes from 0xe0) returned
>>>>>> ECC error
>>>>>> [ 118.255561] jffs2: jffs2_scan_inode_node(): CRC failed on node at
>>>>>> 0x000001ec: Read 0x00000000, calculated 0xa587e8ba
>>>>>> [ 118.255602] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985
>>>>>> not
>>>>>> found at 0x00000234: 0x1cf7 instead
>>>>>
>>>>> This error is most likely because you generated a jffs2 rootfs with a
>>>>> eraseblock size that does not match the one of your NAND device.
>>>>
>>>> No. I used 128k erase block that matches my NAND. I also checked
>>>> that I can mount the jffs2 partition correctly using my v2.6.35
>>>> kernel, so the partition seems to be correctly written.
>>>>
>>>
>>> Please use following steps and try again:
>>> flash_eraseall /dev/mtdx
>>> mount -t jffs2 /dev/mtdblockx tmp
>>
>> What's the purpose of this?
>> This works and doesn't output any error but it's mounting an erased
>> partition.
> Please test the patch set after you have erased a partition. Since the
> ECC layout may be changed after applying this
> patch set.
>
> So You may meet some errors if you do not do so.

I am writing the JFFS2 partition from my custom U-Boot. Do you mean that they way it 
writes it could not be compatible with what the new driver expects? That sounds really 
bad.
How do you write the partition in Linux?

Best regards,
--
Hector Palacios
