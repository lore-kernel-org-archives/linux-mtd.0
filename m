Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hntxy-0008M8-8M
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 06:09:15 -0400
Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
To: dedekind@infradead.org
In-Reply-To: <1179215437.3642.8.camel@sauron>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
	<1179189724.3482.24.camel@shinybook.infradead.org>
	<1179215126.21753.40.camel@localhost.localdomain>
	<1179215437.3642.8.camel@sauron>
Content-Type: text/plain
Date: Tue, 15 May 2007 12:07:02 +0200
Message-Id: <1179223622.21753.46.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-05-15 at 10:50 +0300, Artem Bityutskiy wrote:
> On Tue, 2007-05-15 at 09:45 +0200, Hans-Christian Egtvedt wrote:
> > For development systems it would be a great feature, hence my original
> > email. But for an embedded system this should not be present at all.
> 
> Sorry, I did not find an explanation what for do you need different
> endianess? Why not just to live with the default one?

I have a x86 laptop which i use for building my images, and deploy them
to an AVR32 system. Little endian vs. big endian.

Sometimes I would like to mount my jffs2 images to do some minor
modifications, fetch lost files, or if I receive an image from somebody
else.

-- 
Mvh
Hans-Christian Egtvedt
