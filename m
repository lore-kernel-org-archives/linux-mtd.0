Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1wc9-0004lg-Co
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 05:58:08 +0000
Subject: Re: mtdutils and libubiio
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00905060522w191f5f19n6c67a1f33a55b061@mail.gmail.com>
References: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
	<1241526066.3760.37.camel@localhost.localdomain>
	<71cd59b00905060522w191f5f19n6c67a1f33a55b061@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 May 2009 08:57:36 +0300
Message-Id: <1241675856.27996.8.camel@localhost.localdomain>
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

On Wed, 2009-05-06 at 14:22 +0200, Corentin Chary wrote:
> Hi,
> You'll find here some experiments:
> http://git.iksaif.net/?p=users/iksaif/mtd-utils.git;a=summary
> 
> Before working on mkfs.ubifs I wanted to cleanup the mtd-utils dir, so
> I tried some change,
> including the use of CMake. As a lot of people here don't want to hear
> about CMake, if the patchs
> for mkfs are good enought, I'll rebase them on a vanilla version of mtd-utils.

I have a pile of patches in my tree as well. I wait for dwmw2 to send
my "export subpage via sysfs" patch to Linus, and after this I'll
push my changes. They basically make libmtd use sysfs interface, but
there are some random minor libubi changes and fixes. I'll try to
push this ASAP.

Vs CMake. I do not know. I'm not very good in this at all. Mike kind
of maintains the build system in the mtd-utils, and he lately improved
it. So if you may convince him, probably. But the thing is that not
many people care about mtd-utils, and if you introduce CMake and then
disappear - who is going to maintain that ?

I personally think that if Makefile can do the same stuff, there is
no reason to change/add new build system only because it is fewer lines
in CMake.

> What you'll find here:
> - CMake "experiment" with dependencies check on zlib and libacl
> - libubiio, provinding the same API the kernel does
> - mkfs.ubifs using libubiio, can write the image directly on an ubi volume

Would you please send patches. It is so much more convenient to
people? Teaching mkfs.ubifs write directly into the volume sounds
nice, BTW.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
