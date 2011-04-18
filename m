Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBp9n-0003l1-Vc
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 14:10:28 +0000
Received: by eyh6 with SMTP id 6so1566837eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 07:10:25 -0700 (PDT)
Subject: Re: [PATCHv2 2/2] mkfs.jffs2: fix casting of __off64_t
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <BANLkTi=7yxRMgw+UpCZ+bmwrQw_QfFT44A@mail.gmail.com>
References: <1302783893.2796.27.camel@localhost>
	<802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
	<2285954c62e0401291aa3f5055bc79c6789149d7.1303115468.git.ext-andriy.shevchenko@nokia.com>
	<BANLkTik3bKP4=zBgqxpN2vNTWD5V5DzKAA@mail.gmail.com>
	<1303134901.8589.9.camel@localhost>
	<BANLkTi=7yxRMgw+UpCZ+bmwrQw_QfFT44A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 17:07:26 +0300
Message-ID: <1303135646.8589.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-18 at 10:04 -0400, Mike Frysinger wrote:
> On Mon, Apr 18, 2011 at 09:55, Artem Bityutskiy wrote:
> > On Mon, 2011-04-18 at 09:49 -0400, Mike Frysinger wrote:
> >> On Mon, Apr 18, 2011 at 04:31, Andy Shevchenko wrote:
> >> > The casting of __off64_t to unsigned long potentially wrong for values higher
> >> > than ULONG_MAX.  Let's fix that.
> >>
> >> i dont think this is the way to go.  on 64bit systems, long long is
> >> 128bits.  i imagine the way to go (assuming we're always using LFS) is
> >> to use PRIu64 from inttypes.h
> >
> > sizeof(unsigned long long) is 8 (64 bits) on my x86_64 fedora.
> 
> so it is.  i still think PRIu64 is the correct way to handle this as
> there is no sizeof() assumption and no need for casting.

Never used this, but yes, as long as this is something which has worked
for ages and we are not going to have "this is not supported" issues -
sure!

But unsigned long long is 64 bits I think in all GNU systems, and
casting to unsigned long long is quite standard practice AFAIK, so I do
not see why it would be very bad thing to do.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
