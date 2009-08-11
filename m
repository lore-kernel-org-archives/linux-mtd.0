Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MapRO-0002O5-PN
	for linux-mtd@lists.infradead.org; Tue, 11 Aug 2009 11:22:59 +0000
Message-ID: <4A815420.1060802@gmail.com>
Date: Tue, 11 Aug 2009 14:21:04 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: patch for mkfs.ubifs devtable.c increment in dev_table is wrongly
	interpreted
References: <4A759CF3.2010908@vtxmail.ch> <1249973154.19638.30.camel@localhost>
In-Reply-To: <1249973154.19638.30.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Daniel Neukomm <Neukomm@vtxmail.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/11/2009 09:45 AM, Artem Bityutskiy wrote:
> On Sun, 2009-08-02 at 16:04 +0200, Daniel Neukomm wrote:
>> patch for mkfs.ubifs devtable.c increment in dev_table is wrongly
>> interpreted
>>
>> with the device table one can add /dev entries to the root file system
>> image.
>> The device table file contains among others the fields minor, start,
>> increment and count.
>> If there is an entry with minor=0 start=0 increment =32 and count=4 the
>> mkfs.ubifs makes
>> 128 device entries, with minor numbers from 0 to 127
>> The correct version makes 4 entries with minor number 0,32,64,96.
>>
>> /dev/mtd c 640 0 0 90 0 0  2 7
>> This gives 14 devices /dev/mtdXX instead of  7 devices.
>> Due to this error mtd_debug info /dev/mtd3 delivers the information of
>> /dev/mtd1 instead of.
>
> Ok, below is how you was supposed to send the patch (without my
> Signed-off-by, of course). I just applied your patch manually (usually
> we use git am for this) and tweaked it.
>
> Please, check that I did not do any mistake. After you have confirmed
> this, I'll push this to the mtd-utils repository.

I've pushed it actually to mtd-utils.git. But please, check it anyway.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
