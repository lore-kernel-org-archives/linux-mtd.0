Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4BJD-0002zs-Un
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 12:12:38 +0000
Received: by fxm14 with SMTP id 14so2363018fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Mar 2011 05:12:33 -0700 (PDT)
Subject: Re: [PATCH 1/1] ubifs: debugfs operations may return both ERRs and
	NULLs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Phil Carmody <ext-phil.2.carmody@nokia.com>
In-Reply-To: <20110328103816.GC2072@esdhcp04044.research.nokia.com>
References: <20110323131614.GC18296@esdhcp04044.research.nokia.com>
	<1300887304-20932-1-git-send-email-ext-phil.2.carmody@nokia.com>
	<1301295087.2816.2.camel@localhost>
	<20110328103816.GC2072@esdhcp04044.research.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Mar 2011 15:10:32 +0300
Message-ID: <1301314232.2816.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-28 at 13:38 +0300, Phil Carmody wrote:
> > I think the right fix would be to fix debugfs and return an error code
> > in any case.
> 
> Agree. Alas it might require hitting a lot of both active and dead code.
> Is that something you want me to look at? If you do it yourself, please
> Cc: me, I'll happily review it.

No, I do not ask you do change debugfs. Do it only if you fare feeling
enthusiastic about this :-) But I do not feel that way, so won't delve
into the debugfs story :-)

All I mean is that we should not do this:

-       if (IS_ERR(ptr)) {
+       if (IS_ERR_OR_NULL(ptr))
-               int err = PTR_ERR(ptr);
-               return err;
+               return -ENODEV;

But rather

-       if (IS_ERR(ptr)) {
+       if (IS_ERR_OR_NULL(ptr)) {
-               int err = PTR_ERR(ptr);
+               int err = ptr ? PTR_ERR(ptr) : -ENODEV;
                return err;

or something like this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
