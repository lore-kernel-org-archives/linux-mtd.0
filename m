Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1JeA-0007wV-5W
	for linux-mtd@lists.infradead.org; Tue, 05 May 2009 12:21:24 +0000
Subject: Re: mtdutils and libubiio
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
References: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 May 2009 15:21:06 +0300
Message-Id: <1241526066.3760.37.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-05-05 at 11:49 +0200, Corentin Chary wrote:
> Hi,
> Some time ago we made libubiio available at :
> http://git.iksaif.net/?p=libubiio.git;a=summary
> I wanted to know how it can be used in mtd-utils, so we can start
> making patch for inclusion into mtd-utils.
> The first thing I see is mkfs.ubifs, using libubiio we will be able to
> run mkfs on an ubi volume. I believe it's
> simpler than creating a image, and using other tools to write it to the volume.
> Where can libubiio be used ?

Sure, go ahead.

> Another question, do you use static Makefiles for a reason ? Maybe we
> could move to CMake ?

I do not know CMake, buy I thought Makefiles work just fine.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
