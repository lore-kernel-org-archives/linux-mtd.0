Received: from mail-ew0-f13.google.com ([209.85.219.13])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LD2TA-0008Q8-Ce
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 19:54:12 +0000
Received: by ewy6 with SMTP id 6so85611ewy.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Dec 2008 11:54:05 -0800 (PST)
Subject: Re: [PATCH] [UBI] 1/5 - UBI notifications, take two
From: dmitry pervushin <dpervushin@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1229349879.4911.45.camel@sauron>
References: <1229339635.7900.21.camel@hp.diimka.lan>
	<1229349879.4911.45.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Wed, 17 Dec 2008 22:53:56 +0300
Message-Id: <1229543636.7900.53.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dpervushin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-12-15 at 16:04 +0200, Artem Bityutskiy wrote:
> Thanks for the patch, but I have some concerns. Please clarify some
> things.
> 
> 1. If X is subscribed to the notification, you assume that can X open
> UBI volumes from within the notification. At least I can see this in
> your "simple FTL". But this is recursion, ant it is very tricky. And I
> see problems related to this in your code. I may be mistaken, though.
> See below.
Thanks for reporting this. This is really a problem, and I'd suggest to
create additional mode in addition to
UBI_READONLY/UBI_READWRITE/UBI_EXCLUSIVE, say, UBI_OPEN_INTERNAL, to
increase reference count on the volume. 
> So you call notifiers from withing spin-locks. Are they really blocking
> notifiers? Note, if you call any UBI kernel API function from the
> notifier, you'll deadlock. E.g., if you call 'ubi_get_device_info()',
> you'll deadlock on 'ubi_devices_lock'. Did you test your code?
> 
> I guess you should prohibit recursion and pass full UBI device/volume
> information _inside_ the notifier. And the subsystems which work above
> UBI should never _open_ UBI volumes from within notifiers. E.g., the
> "simple FTL" stuff should open the UBI volume only when the
> corresponding FTL block device is opened, not in the notifier.
Although it is a good idea and it will save some time for notified
modules -- it won't help me. The block device created by ftl could be
opened immediately after creating, err.., actually, in the middle of
creating - e.g., to read partition table.

The ubi_enum_volumes could open the volume with the flag
UBI_OPEN_INTERNAL and thus release spinlock when calling notifiers.

Comments?
> -- 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
> 
