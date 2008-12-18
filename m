Received: from mail-ew0-f13.google.com ([209.85.219.13])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDGjf-0006RJ-2I
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 11:08:07 +0000
Received: by ewy6 with SMTP id 6so422381ewy.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2008 03:08:06 -0800 (PST)
Subject: Re: [PATCH] [UBI] 1/5 - UBI notifications, take two
From: dmitry pervushin <dpervushin@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1229585500.17960.99.camel@sauron>
References: <1229339635.7900.21.camel@hp.diimka.lan>
	<1229349879.4911.45.camel@sauron>
	<1229543636.7900.53.camel@hp.diimka.lan>
	<1229585500.17960.99.camel@sauron>
Content-Type: text/plain
Date: Thu, 18 Dec 2008 14:07:56 +0300
Message-Id: <1229598476.7900.62.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2008-12-18 at 09:31 +0200, Artem Bityutskiy wrote:
> On Wed, 2008-12-17 at 22:53 +0300, dmitry pervushin wrote:
> > > So you call notifiers from withing spin-locks. Are they really blocking
> > > notifiers? Note, if you call any UBI kernel API function from the
> > > notifier, you'll deadlock. E.g., if you call 'ubi_get_device_info()',
> > > you'll deadlock on 'ubi_devices_lock'. Did you test your code?
> > > 
> > > I guess you should prohibit recursion and pass full UBI device/volume
> > > information _inside_ the notifier. And the subsystems which work above
> > > UBI should never _open_ UBI volumes from within notifiers. E.g., the
> > > "simple FTL" stuff should open the UBI volume only when the
> > > corresponding FTL block device is opened, not in the notifier.
> > Although it is a good idea and it will save some time for notified
> > modules -- it won't help me. The block device created by ftl could be
> > opened immediately after creating, err.., actually, in the middle of
> > creating - e.g., to read partition table.
> > 
> > The ubi_enum_volumes could open the volume with the flag
> > UBI_OPEN_INTERNAL and thus release spinlock when calling notifiers.
> 
> You may introduce a "ubi_get_volume(struct ubi_info *ubi, int vol_id)"
> function, similar to the existing "ubi_get_device(int ubi_num)"
> function. However, it looks like you may just use UBI_READONLY instead.
> It will not prevent the "notifyees" to open the volume in UBI_READWRITE
> mode.
But will prevent opening in UBI_EXCLUSIVE. OK, get_volume/put_volume
looks as the right way to go.
