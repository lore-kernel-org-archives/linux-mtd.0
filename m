Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MlK4w-0002q7-6r
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 10:07:10 +0000
Message-ID: <4AA77E2A.40604@gmail.com>
Date: Wed, 09 Sep 2009 13:06:34 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: JiSheng Zhang <jszhang3@gmail.com>
Subject: Re: UBIFS power cut issues
References: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>	
	<1252390936.5060.47.camel@localhost>
	<2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>
In-Reply-To: <2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/09/2009 12:45 PM, JiSheng Zhang wrote:
>> On Wed, 2009-09-02 at 17:35 +0800, JiSheng Zhang wrote:
>>> If we cut power when copy file into ubifs, then remount ubifs and try
>>> to read the file, we found that the data at some offset of the file
>>> began different from the data of the original file at the same offset.
>>> Is this a bug of ubifs?
>>
>> This is expected behavior on any asynchronous FS. You may switch to
>> synchronous behavior with '-o sync' mount option. I wrote a lot of
>
> I have tested with "mount -o sync", the result is the same. It's not
> empty file. For example:
> cp fileA /mnt/ubifs/fileB
> random cut power before "cp" completed.
> then remount
>  From head of /mnt/ubifs/fileB to some offset offsetC is the same as
> fileA. But from offsetC to the end is different from fileA at the same
> offset offsetC, it's not empty either.
> Hope I expressed myself clearly.

Hmm, ok. What is your kernel version?

Could you please take a closer look and see if these differences
are zeroes or not?

Do you have an automated test for this? Can you share your script?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
