Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P46JQ-0003Zo-Vn
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 06:20:13 +0000
Received: by fxm15 with SMTP id 15so455323fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Oct 2010 23:20:11 -0700 (PDT)
Subject: Re: [PATCH] JFFS2: Dynamically choose inocache hash size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1286517078.2095.15.camel@localhost>
References: <20101007181402.982199D401B@zog.reactivated.net>
	<1286479935.1797.14.camel@brekeke>
	<1286480123.3757.2.camel@i7.infradead.org>
	<1286517078.2095.15.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Oct 2010 09:17:23 +0300
Message-ID: <1286518643.2095.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Daniel Drake <dsd@laptop.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-08 at 08:51 +0300, Artem Bityutskiy wrote:
> On Thu, 2010-10-07 at 20:35 +0100, David Woodhouse wrote:
> > On Thu, 2010-10-07 at 22:32 +0300, Artem Bityutskiy wrote:
> > > Why is this complication needed? Unless there is a very good reason, I'd
> > > just stick with older patch you sent, which I BTW also have in my
> > > l2-mtd-2.6.git tree: 
> > 
> > I asked for it. With smaller file systems, a huge increase buys nothing
> > and is just bloat.
> 
> OK, I looked closer to the code and I see that I misunderstood this
> constant. I though it is only about increasing the size of an array of
> integers, but this is about increasing the size of an array of
> struct jffs2_inode_cache.

Oh my, it is indeed about increasing size of array of pointers. I would
not bother with additional calculations - it is just (1024 - 256) * 4 =
3072 bytes which is nothing comparing to overall JFFS2 memory
consumption, not worth bothering.

Anyway, not so important.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
