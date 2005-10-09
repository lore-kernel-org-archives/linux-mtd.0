Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EOYXA-0000nG-VY
	for linux-mtd@lists.infradead.org; Sun, 09 Oct 2005 06:36:18 -0400
Date: Sun, 9 Oct 2005 12:35:55 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20051009103555.GA32487@wohnheim.fh-wedel.de>
References: <BAY17-F16E854B08AE4BE53C22062E8860@phx.gbl>
	<4348C169.2050907@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4348C169.2050907@yandex.ru>
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 9 October 2005 11:06:17 +0400, Artem B. Bityutskiy wrote:
> zhao forrest wrote:
> > It's true that "c->cleanmarker_size was 0" for NAND flash.
> > But besides  NAND flash, "c->cleanmarker_size was 0" is also true
> > for dataflash. That means that cleanmarker was not needed for
> > dataflash for some reason that I don't know :)
> 
> DataFlash is has a minimum IO unit (DataFlash block, 528/1056 AFAIR),
> and has no OOB. So the cleanmarker would consume the whole DataFlash
> block which considered wasteful I suppose.

Is it possible for dataflash to erase a block, power cycle before
erase has completed, and later write to this block before erasing it
again?

Cleanmarkers are the means to prevent above events from happening.  If
dataflash has some other means, we can dump cleanmarkers.  If not,
dumping them would be a reliability problem.

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
