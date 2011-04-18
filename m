Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBoxy-0003d5-Iu
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 13:58:15 +0000
Received: by yxh35 with SMTP id 35so1934150yxh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 06:58:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
References: <1302783893.2796.27.camel@localhost>
	<802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 18 Apr 2011 09:50:10 -0400
Message-ID: <BANLkTikMFDXNUzM785f+iQ4tWagnzKHkLQ@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] serve_image: adjust classificator and type for
	printf
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 18, 2011 at 04:31, Andy Shevchenko wrote:
> The argument type of printf is __off64_t, meanwhile the classificator is "%ld".

same response here ... please use PRIu64 instead of casting to long long.
-mike
