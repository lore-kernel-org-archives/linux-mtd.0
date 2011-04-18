Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBk23-00011E-S8
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 08:42:08 +0000
Received: by eyh6 with SMTP id 6so1473356eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 01:42:05 -0700 (PDT)
Subject: Re: UBI memory usage on large page nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicholas <ciliwung36@gmail.com>
In-Reply-To: <BANLkTi=We=H92+DHuJF7TPVUagePgqF48g@mail.gmail.com>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
	<1301671910.2789.98.camel@localhost>
	<BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
	<1302873226.3220.43.camel@localhost>
	<1302873423.3220.45.camel@localhost>
	<BANLkTin=dfsO9N02oVZg=kU3ghfymbzJWA@mail.gmail.com>
	<1303031774.2308.13.camel@koala>
	<BANLkTi=We=H92+DHuJF7TPVUagePgqF48g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 11:39:11 +0300
Message-ID: <1303115951.2815.35.camel@localhost>
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

On Mon, 2011-04-18 at 16:29 +0800, Nicholas wrote:
> Dear Artem,
> 
> If I reduce ubi->peb_buf1 and ubi->peb_buf2 with allocation of smaller
> memory spaces, will they affect to IO ( read / write ) ?
> Will it cause block data wasted ? Since buffer is allocated less than
> block size .

Yes,  please, make the buffers smaller. Yes, on some setups this will
make I/O a bit slower. But I have some ideas how to deal with that.
Please, do your changes, I'll take a look and then suggest how to
improve that - but I first want to see how you will do a simple
thing :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
