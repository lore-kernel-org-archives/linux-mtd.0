Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mj9gv-00056G-S7
	for linux-mtd@lists.infradead.org; Thu, 03 Sep 2009 10:37:26 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KPE00GDS5I6JO@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 03 Sep 2009 19:37:18 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KPE00HDQ5I45Q@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 03 Sep 2009 19:37:18 +0900 (KST)
Date: Thu, 03 Sep 2009 16:07:52 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
To: dedekind1@gmail.com
Message-id: <FC4F021760EA4F649917598723041422@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
	<6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
	<1251466736.3514.10.camel@localhost>
	<A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
	<9c9fda240908310234h6cef3afev6a3f6e315321631b@mail.gmail.com>
	<C48D93C7DF3C4F9C96E47BE9D6F51F37@sisodomain.com>
	<4A9E0C47.205@gmail.com>
	<8A3568961C4E4E7495A397D2267B6E37@sisodomain.com>
	<1251958245.5060.6.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, Kyungmin Park <kmpark@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> >> +
>> >> +config ONENAND_OTP_AREA_BLOCK0
>> >> + bool "BOTH OTP area AND Block[0]"
>> >> + depends on MTD_ONENAND_OTP&&  !ONENAND_OTP_AREA&&  !ONENAND_OTP_BLOCK0
>> >> + select ON_OTP_AREA_BLOCK0
>> >> +
>> >> +endif #MTD_ONENAND_OTP
>> >
>> > If there were 10 OTP blocks, would you add 10 options?
>> > I mean, are these switches really needed? Can we remove them?
>>
>> There is just one OTP block.
>> Three options are provided for the three known combinations of 1st Block and the OTP Block.
>> The option to choose one should be provided to the user.
>
> Wouldn't it be better to  make this run-time configurable? E.g., module
> parameters? Too many config options are frowned upon usually.
>

I got it. But I guess in this case the numbers are not that big enough to call for Module parameters 
implementation.
Is it okay?

With Regards,
Amul Kumar Saha 
