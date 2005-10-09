Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EOVGn-0007IN-0E
	for linux-mtd@lists.infradead.org; Sun, 09 Oct 2005 03:07:15 -0400
Message-ID: <4348C169.2050907@yandex.ru>
Date: Sun, 09 Oct 2005 11:06:17 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F16E854B08AE4BE53C22062E8860@phx.gbl>
In-Reply-To: <BAY17-F16E854B08AE4BE53C22062E8860@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
> It's true that "c->cleanmarker_size was 0" for NAND flash.
> But besides  NAND flash, "c->cleanmarker_size was 0" is also true
> for dataflash. That means that cleanmarker was not needed for
> dataflash for some reason that I don't know :)

DataFlash is has a minimum IO unit (DataFlash block, 528/1056 AFAIR),
and has no OOB. So the cleanmarker would consume the whole DataFlash
block which considered wasteful I suppose.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
