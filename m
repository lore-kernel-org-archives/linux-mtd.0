Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MvonB-0000A2-TL
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 08:56:14 +0000
Message-ID: <4ACDA918.2020103@nokia.com>
Date: Thu, 08 Oct 2009 11:55:52 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: "Hunter Adrian (Nokia-D/Helsinki)" <adrian.hunter@nokia.com>
Subject: Re: mkfs.ubifs / ubiformat: Bad UBI magic
References: <29001ab20910060400j76167eg138df17d57727231@mail.gmail.com>
	<4ACDA8B6.3020807@nokia.com>
In-Reply-To: <4ACDA8B6.3020807@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?UTF-8?B?VG9iaWFzIFdhaGxzdHLDtm0=?= <tobias.tanke@gmail.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/08/2009 11:54 AM, Hunter Adrian (Nokia-D/Helsinki) wrote:
> Tobias Wahlström wrote:
>> Hi!
>>
>> This is my first post at this list - I hope it makes (at least) some
>> sense anyway. I have looked through the mailing archive and searched
>> using google without finding anything useful on the topic. I hope I
>> provided the information you need - if not, just tell me what you are
>> missing!
>>
>> I'm working on a project where we would like to use ubi and ubifs as
>> root filesystem since it seems to be the best choise in many ways. But
>> I have a problem which I can't find anything about either the mail
>> archive nor using google etc. I currently use linux 2.6.26 with some
>> patches. My target is the freescale imx255 pdk board. My build system
>> is Ubuntu 9.04 (run within vmware).
>>
>> I have cloned the mtd-utils.git (today 2009-09-05) and compiled the
>> tools both for my build system and my target (both without xattr
>> support). Then I created a ubifs image using mkfs.ubifs on my build
>> system and tried to flash it to the nand using ubiformat. The commands
>> I used was:
>>
>> build>  mkfs.ubifs -m 2048 -e 256KiB -c 384 -U --root rootfs -o rootfs.ubifs
>> target>  flash_eraseall /dev/mtd2
>> target>  ubiformat /dev/mtd2 -s 2048 -v -f rootfs.ubifs
>
> Also, doesn't ubiformat take a UBI image not a UBIFS image

Right.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
