Received: from nwcst320.netaddress.usa.net ([204.68.23.65])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15STIC-0000AH-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Aug 2001 01:58:21 +0100
Message-ID: <20010803010408.13811.qmail@nwcst320.netaddress.usa.net>
Date: 2 Aug 2001 18:04:08 PDT
From: Eric <ebrower@usa.net>
To: linux-mtd@lists.infradead.org
Subject: Re: [[Q] Where are probed maps kfree'd?]
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Never mind me-- I chose the wrong week to give up caffeine.
The kfree is done quite explicitly at the end of map_destroy
in <linux>/include/mtd/map.h.

E

Eric <ebrower@usa.net> wrote:
> The usual course of events seems to be:
> =

>   mapping driver sets-up a struct map_info
>   mapping driver calls chip-family-specific probe routine
>   probe routine kmallocs a struct mtd_info are returns it
>   =

>   mapping driver decides to unload
>   mapping driver calls (amongst other things) map_destroy
>   chip-family-specific destroy routine kfrees internal private data
>   mapping driver exits
> =

> I've been looking at more than a few examples, and I don't
> see when (if ever) the struct mtd_info passed back from the
> probe routine is kfree'd.  It is NOT done in the destroy =

> routine and I can't see it being done in the mtdcore exit
> function either.  Am I missing it, or is everyone leaking
> mtd_info structs on unload?  =

> =

> E
> =

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
