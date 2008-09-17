Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kg2yU-0001be-1T
	for linux-mtd@lists.infradead.org; Wed, 17 Sep 2008 19:46:06 +0000
Message-ID: <48D15EAD.1030804@ru.mvista.com>
Date: Wed, 17 Sep 2008 23:46:53 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/3] [MTD] physmap.c: Check return
	of	platform_device_register()
References: <48CB5E9A.4010000@gmail.com>
	<20080917115746.e36cacc6.akpm@linux-foundation.org>
	<48D15DC8.60307@ru.mvista.com>
In-Reply-To: <48D15DC8.60307@ru.mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Zev Weiss <zevweiss@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I just wrote:

>>> The PHYSMAP_COMPAT code had been ignoring the return value of
>>> platform_device_register() in the physmap_init() function.

>>> Signed-off-by: Zev Weiss <zevweiss@gmail.com>

> [...]

>>> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
>>> index 42d844f..6fba0d4 100644
>>> --- a/drivers/mtd/maps/physmap.c
>>> +++ b/drivers/mtd/maps/physmap.c
>>> @@ -312,7 +312,7 @@ static int __init physmap_init(void)
>>>      err = platform_driver_register(&physmap_flash_driver);
>>>  #ifdef PHYSMAP_COMPAT
>>>      if (err == 0)
>>> -        platform_device_register(&physmap_flash);
>>> +        err = platform_device_register(&physmap_flash);
>>>  #endif
>>>
>>>      return err;

[...]

>> Presumably we should run platform_driver_unregister() if the
>> platform_device_register() failed.

>    Why is that? There could be "normal" platform devices out there...

   With that said, the patch is pointless (as already noted by Lennert).

WBR, Sergei
