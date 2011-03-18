Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q0Wwl-0006UD-Iw
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2011 10:30:20 +0000
Received: by wyb28 with SMTP id 28so3809083wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Mar 2011 03:30:17 -0700 (PDT)
Subject: Re: [PATCH] flash_erase: start position should be in bytes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
In-Reply-To: <1300443717-3881-1-git-send-email-jacmet@sunsite.dk>
References: <1300443717-3881-1-git-send-email-jacmet@sunsite.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Mar 2011 12:28:42 +0200
Message-ID: <1300444122.2758.3.camel@localhost>
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

I guess this means we need to make a new maintenance with this patch...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
