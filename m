Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19PIYS-0004T7-HL
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 10:03:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Felix Domke <tmbinc@gmx.net>
In-Reply-To: <3EE3DC9F.3060606@gmx.net>
References: <3EE3DC9F.3060606@gmx.net>
Message-Id: <1055149418.16455.13.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 09 Jun 2003 10:03:38 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Differently sized Flash chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-09 at 02:02, Felix Domke wrote:
> Hi,
> 
> i have a device with one Intel E28F128J3 (16MB NOR) and one E28640J3 
> (8MB NOR).
> 
> Is it possible to use both of them as one single device, especially a 
> partition spanning over both of them?

Yes, by using the 'mtdconcat' code to combine them. You can't have the
prode code detect them both together since that requires chips to be
identical.

-- 
dwmw2
