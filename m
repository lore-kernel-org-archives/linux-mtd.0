Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P45uC-00040u-Sy
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 05:54:09 +0000
Received: by fxm15 with SMTP id 15so449308fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Oct 2010 22:54:07 -0700 (PDT)
Subject: Re: [PATCH] JFFS2: Dynamically choose inocache hash size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1286480123.3757.2.camel@i7.infradead.org>
References: <20101007181402.982199D401B@zog.reactivated.net>
	<1286479935.1797.14.camel@brekeke>
	<1286480123.3757.2.camel@i7.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Oct 2010 08:51:18 +0300
Message-ID: <1286517078.2095.15.camel@localhost>
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

On Thu, 2010-10-07 at 20:35 +0100, David Woodhouse wrote:
> On Thu, 2010-10-07 at 22:32 +0300, Artem Bityutskiy wrote:
> > Why is this complication needed? Unless there is a very good reason, I'd
> > just stick with older patch you sent, which I BTW also have in my
> > l2-mtd-2.6.git tree: 
> 
> I asked for it. With smaller file systems, a huge increase buys nothing
> and is just bloat.

OK, I looked closer to the code and I see that I misunderstood this
constant. I though it is only about increasing the size of an array of
integers, but this is about increasing the size of an array of
struct jffs2_inode_cache.

Fair enough.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
