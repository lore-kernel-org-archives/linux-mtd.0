Received: from mail-fx0-f211.google.com ([209.85.220.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUCDo-0002WU-1i
	for linux-mtd@lists.infradead.org; Mon, 11 Jan 2010 04:49:48 +0000
Received: by fxm3 with SMTP id 3so11517637fxm.4
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 20:49:41 -0800 (PST)
Subject: Re: [PATCH] [MTD] WWW: Spelling correction in UBI FAQ
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lee Amirev <lee.amirev@gmail.com>
In-Reply-To: <e14c53d91001100826v5ebe0811l6650b72afe973d62@mail.gmail.com>
References: <e14c53d91001031603h694291c1y5b008e86283d5a2d@mail.gmail.com>
	<e14c53d91001031611i736c54eev8636321d43f3f831@mail.gmail.com>
	<1263115273.7315.138.camel@localhost.localdomain>
	<e14c53d91001100826v5ebe0811l6650b72afe973d62@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 11 Jan 2010 06:49:40 +0200
Message-Id: <1263185380.30988.12.camel@localhost.localdomain>
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

On Sun, 2010-01-10 at 11:26 -0500, Lee Amirev wrote:
> For future reference, how do I generate the proper format?  I just
> used git diff.

git format-patch

You should also have a "Signed-off-by:". Like this:
http://git.infradead.org/mtd-www.git/commit/1e58f6b030255925912b3f1c8c08074cf1649aff

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
