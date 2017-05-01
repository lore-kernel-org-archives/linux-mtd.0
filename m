Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5J9f-0002dR-0S
 for linux-mtd@lists.infradead.org; Mon, 01 May 2017 21:46:52 +0000
Received: by mail-pg0-x241.google.com with SMTP id c2so7371630pga.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 14:46:30 -0700 (PDT)
Date: Mon, 1 May 2017 14:46:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpio: make nCE GPIO optional
Message-ID: <20170501214627.GB140640@google.com>
References: <20170210140110.87903682E7@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170210140110.87903682E7@localhost.localdomain>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 10, 2017 at 03:01:10PM +0100, Christophe Leroy wrote:
> On some hardware, the nCE signal is wired to the ChipSelect associated
> to bus address of the NAND, so it is automatically driven during the
> memory access and it is not managed by a GPIO.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Not really a problem with this patch exactly, but FYI you're only making
this optional for the non-DT case. For device tree, this is kinda hard
to do, since the current binding suggests we retrieve the GPIOs based on
index position, not by name. So if you leave one off...I guess we well
just be off-by-1 on the indeces until we hit a non-optional one...which
I guess is "CLE".

If we wanted this to work for DT, we'd need to extend this driver (and
binding doc) to support requesting GPIOs by name.

Brian
