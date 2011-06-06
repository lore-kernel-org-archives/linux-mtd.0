Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTYvb-0003hn-0A
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 12:29:07 +0000
Received: by fxm14 with SMTP id 14so3491205fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 05:29:04 -0700 (PDT)
Subject: Re: [PATCH 3/5] flash_{lock,unlock}: merge into one util
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307333354-26583-3-git-send-email-vapier@gentoo.org>
References: <1307333354-26583-1-git-send-email-vapier@gentoo.org>
	<1307333354-26583-3-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 15:24:48 +0300
Message-ID: <1307363088.3112.49.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 00:09 -0400, Mike Frysinger wrote:
> Now that the utils have equivalent functionality, merge the two source
> code bases so they can't diverge in the future.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
