Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOObw-0001EZ-La
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 06:27:29 +0000
Received: by eyh6 with SMTP id 6so1987990eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 May 2011 23:27:26 -0700 (PDT)
Subject: Re: [PATCH] drivers:mtd:fix the bad format in the mtdcore.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wanlong Gao <wanlong.gao@gmail.com>
In-Reply-To: <1305897270-3685-1-git-send-email-wanlong.gao@gmail.com>
References: <1305897270-3685-1-git-send-email-wanlong.gao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 May 2011 09:23:16 +0300
Message-ID: <1306131796.2785.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-20 at 21:14 +0800, Wanlong Gao wrote:
> Remove the spare spaces in the head of the lines.
> 
> Signed-off-by: Wanlong Gao <wanlong.gao@gmail.com>

Pushed to l2-mtd-2.6.git, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
