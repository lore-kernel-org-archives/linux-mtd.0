Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19PIX1-0004Rd-3X
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 10:01:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: roger <rogerxxmaillist@san.rr.com>
In-Reply-To: <1055118239.10424.49.camel@localhost3.localdomain>
References: <1055118239.10424.49.camel@localhost3.localdomain>
Message-Id: <1055149328.16455.11.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 09 Jun 2003 10:02:09 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with using doc2001 module
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-09 at 01:23, roger wrote:
> (i've been advised that there might be a "hidden write enable" problem -
> i.e. there is a special GPIO line used to control write enable in
> addition to the normal mechanism.)

There is. Take a look at drivers/mtd/maps/amd76xrom.c 

-- 
dwmw2
