Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1zIz-0000fN-AE
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 08:50:32 +0000
Subject: Re: mtdutils and libubiio
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00905070141l489ef4b2g55cb17e3370e895d@mail.gmail.com>
References: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
	<1241526066.3760.37.camel@localhost.localdomain>
	<71cd59b00905060522w191f5f19n6c67a1f33a55b061@mail.gmail.com>
	<1241675856.27996.8.camel@localhost.localdomain>
	<71cd59b00905070141l489ef4b2g55cb17e3370e895d@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 May 2009 11:49:59 +0300
Message-Id: <1241686199.27996.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-05-07 at 10:41 +0200, Corentin Chary wrote:
> >> What you'll find here:
> >> - CMake "experiment" with dependencies check on zlib and libacl
> >> - libubiio, provinding the same API the kernel does
> >> - mkfs.ubifs using libubiio, can write the image directly on an ubi volume
> >
> > Would you please send patches. It is so much more convenient to
> > people? Teaching mkfs.ubifs write directly into the volume sounds
> > nice, BTW.
> >
> 
> Well as I said it's just an experiment right now.
> Now that it works, I'll be able to send a series of patch with small
> and smooth changes.

Just go ahead with this :-)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
