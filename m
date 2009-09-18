Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoUGU-0000Z7-3h
	for linux-mtd@lists.infradead.org; Fri, 18 Sep 2009 03:36:10 +0000
Message-ID: <4AB2FFE7.1000204@gmail.com>
Date: Fri, 18 Sep 2009 06:35:03 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: setup ubifs
References: <009301ca37ab$9b5d2ab0$2901a8c0@dpn>
	<1253202198.3778.19.camel@localhost>
	<8bd0f97a0909170945u7af8dc81ga64e13d4707ceada@mail.gmail.com>
In-Reply-To: <8bd0f97a0909170945u7af8dc81ga64e13d4707ceada@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Dimitar Penev <dpn@ucpbx.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/17/2009 07:45 PM, Mike Frysinger wrote:
>>> I don't have /dev/ubi_ctrl so I can not crete (ubimkvol) ubi volume.
>>>
>>> Can you please give me some pointers.
>>
>> Either make udev work and create device nodes for you automatically,
>> or create them manually. All the major/minor numbers are available
>> in sysfs (sedd "dev" files), so you may create corresponding character
>> device files.
>
> udev isnt going to happen.  if the stuff is available via sysfs, then
> `mdev -s` should work.

Ah, ok, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
