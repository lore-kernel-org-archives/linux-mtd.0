Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PhgMm-0007gn-CK
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 10:43:17 +0000
Received: by fxm19 with SMTP id 19so5263051fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Jan 2011 02:43:14 -0800 (PST)
Subject: Re: [PATCH] UBI: fix unaligned leb_start value
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Ogness <john.ogness@linutronix.de>
In-Reply-To: <87zkqu1fuh.fsf@vostro.fn.ogness.net>
References: <87zkqu1fuh.fsf@vostro.fn.ogness.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 25 Jan 2011 12:42:40 +0200
Message-ID: <1295952160.7118.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-01-21 at 15:39 +0100, John Ogness wrote:
> From: John Ogness <john.ogness@linutronix.de>
> 
> The wrong header size was used in calculating the data offset. The
> data offset should be VID header offset + VID header size (aligned to
> the minimum I/O unit).
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

I've tweaked the commit message and pushed this to the UBI tree, thanks:
http://git.infradead.org/ubi-2.6.git/commit/a25376636fa6cee8017a22144652f276840281bf

> ---
> This patch is against linux-next-20110121.
> 
> Since the value is later aligned, this patch does not fix any real
> world problem. But it should be fixed nonetheless.

Not exactly, this does not fix any real problem because UBI_EC_HDR_SIZE
and UBI_VID_HDR_SIZE are currently equivalent :-)

Thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
