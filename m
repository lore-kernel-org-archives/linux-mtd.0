Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnY7N-0005Px-Nf
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 15:07:38 +0000
Subject: Re: [PATCH 1/2] UBIFS: fix no_more_nodes() to align to max_write_size
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: ext Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1297350106-16383-2-git-send-email-agust@denx.de>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1297350106-16383-2-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Feb 2011 17:06:00 +0200
Message-ID: <1297350360.6563.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-02-10 at 16:01 +0100, ext Anatolij Gustschin wrote:
> From: Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> This patch fixes failed recovery from following type of corruptions
> on NOR flash:

Yeah, I'll push this patch, I already have it in my tree.

I'll need to work on v3 of the patch series anyway. As soon as I have
time, I'll do, then send v3 out and ask for testing. This fix will be
there as well.

Thanks!

For now, just sick to your original method please.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
