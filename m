Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NXb6h-0004Es-95
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 14:00:36 +0000
Subject: Re: Is it an atomic operation for writing a page in NAND flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20100120134142.GE30789@shareable.org>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<20100120134142.GE30789@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 20 Jan 2010 15:58:23 +0200
Message-Id: <1263995903.3046.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Liu Hui <onlyflyer@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-01-20 at 13:41 +0000, Jamie Lokier wrote:
> Liu Hui wrote:
> > This is a question confused me for a long time. As I know, writing a
> > sector for a hard disk is atomic. That is to say, when we are writing
> > a sector to hard disk and power failure happen, the sector will be
> > written completely or not at all.
> 
> Are you sure about that?
> I have never seen a reliable confirmation of it.

Theo sent a longish e-mail some time ago to fs-devel or lkml, explaining
why this almost never true in practice.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
