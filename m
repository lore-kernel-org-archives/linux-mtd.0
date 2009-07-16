Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRPxm-0004WS-Kl
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 12:21:31 +0000
Subject: Re: [PATCH 0/2] RFC: Add support for UBI and UBIFS
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00907160515j4e0e2429he21ae36a553f31bd@mail.gmail.com>
References: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
	<1247745430.11353.133.camel@localhost.localdomain>
	<71cd59b00907160515j4e0e2429he21ae36a553f31bd@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 15:21:17 +0300
Message-Id: <1247746877.11353.153.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tytso@mit.edu, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-07-16 at 14:15 +0200, Corentin Chary wrote:
> On Thu, Jul 16, 2009 at 1:57 PM, Artem Bityutskiy<dedekind@infradead.org> wrote:
> > On Wed, 2009-07-15 at 11:38 +0200, Corentin Chary wrote:
> >> Hi,
> >> Here is two patch to add support for UBI and UBIFS in libblkid
> >> With that, if you type "blkid" it will show you UBIFS filesystem.
> >>
> >> The thing is that I'm not sure this patch is really usefull as UBIFS
> >> is a "nodev" filesystem, and it doesn't deal with block devices.
> >>
> >> I first started theses patch to be able to do stuff like:
> >> mount /dev/ubi0_0 /mnt/test but we need to patch UBIFS for that.
> >
> > Should not be difficult to implement in UBIFS.
> >
> >> So, do you think we should be able to do that ? If it's ok, these
> >> two patch are a first step.
> >
> > No comments from my side, I do not use the library so I cannot
> > really comment on this.
> >
> 
> AFAIK mount(8) use this library to find the associated filesystem, so
> it's needed
> to remove the "-t ubifs".

Ah, this would be really cool to have then!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
