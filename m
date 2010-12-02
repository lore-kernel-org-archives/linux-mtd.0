Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO88E-0000dt-RG
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 12:19:28 +0000
Received: by mail-bw0-f49.google.com with SMTP id 5so7441909bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Dec 2010 04:19:26 -0800 (PST)
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4CF76B09.1020503@parrot.com>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
	<4CF76B09.1020503@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 14:18:49 +0200
Message-ID: <1291292329.2526.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Anatolij Gustschin <agust@denx.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-12-02 at 10:46 +0100, Matthieu CASTET wrote:
> Hi,
> 
> Artem Bityutskiy a écrit :
> > On Wed, 2010-12-01 at 16:44 +0100, Anatolij Gustschin wrote:
> >> On Wed, 1 Dec 2010 13:05:34 +0100
> >> Anatolij Gustschin <agust@denx.de> wrote:
> >> ... 
> >>> My question is:
> >>> Is it possible that the reset occured while running in
> >>> nor_erase_prepare() just after clearing the VID header magic,
> >>> but before clearing the EC header magic?
> >> yes, it is possible and it seems this is the reason for
> >> that next issue we've observed. Adding the call to the
> >> machine restart callback in nor_erase_prepare() just before
> >> clearing EC header magic to simulate this hypothetical case
> >> we see:
> > You are right, Anatoli.
> > 
> > Looking closer to my own code, I see that I treat PEB as
> > "corrupted and should be preserved" if:
> > 
> > 1. EC header is OK.
> > 2. VID header is corrupted.
> > 3. data area is not "all 0xFFs".
> > 
> > And in 'nor_erase_prepare()' we first invalidate the VID header, and
> > then invalidate the EC header. So there is a small window where you can
> > end up with all 3 conditions to be true.
> > 
> > The solution is to first invalidate the EC header, and only then the VID
> > header. Then in case of the race, we just lose the EC header, but VID
> > header will be all-right, and UBI will handle this - it'll move the data
> > from this PEB to another one, re-create EC header and use average EC
> > count. But if you test this scenario, it will be great!!
> > 
> > This patch should help (compile-tested only).
> > 
> Shouldn't the correct solution will come with handling unstable page 
> problem [1] ?

Err, yes, these things are related, but it is long way to go before we
have the unstable bits issues solved. The NOR quirk is the current
solution for slow and peculiar NOR erasure, it works, and should be kept
working, I think.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
