Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q0XXI-0006f3-ER
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2011 11:08:05 +0000
Received: by wwc33 with SMTP id 33so3310831wwc.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Mar 2011 04:08:03 -0700 (PDT)
Subject: Re: [PATCH] flash_erase: start position should be in bytes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
In-Reply-To: <1300443717-3881-1-git-send-email-jacmet@sunsite.dk>
References: <1300443717-3881-1-git-send-email-jacmet@sunsite.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Mar 2011 13:06:20 +0200
Message-ID: <1300446380.2758.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, vapier@gentoo.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-03-18 at 11:21 +0100, Peter Korsgaard wrote:
> Commit a8801d8 (unify flash_erase and flash_eraseall) changed the
> flash_erase interface in a backwards incompatible way. Before that
> commit start position was given in bytes, and now it must be provided
> in blocks.
> 
> While I agree the new interface is nicer, we shouldn't break the
> interface. I have scripts that expect the old behaviour, and I'm
> most likely not alone, so change the interface back to the old
> way.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Pushed, thanks. Also tagged release 1.4.3, updated the mtd web-site and
uploaded the tarball.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
