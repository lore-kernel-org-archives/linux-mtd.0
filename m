Received: from web37605.mail.mud.yahoo.com ([209.191.87.88])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NZxSC-0000Ls-Q3
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 02:16:28 +0000
Message-ID: <292166.19478.qm@web37605.mail.mud.yahoo.com>
Date: Tue, 26 Jan 2010 18:16:23 -0800 (PST)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Legacy memstick support + FTL questions
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1264542237.15306.14.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> =0A> Alex, I see that your PRO support is in kernel, not legacy=0A> suppo=
rt=0A> isn't. Why?=0A=0AI had no time to finish debugging it on two control=
lers I was trying to=0Acover in the same time (TI and Jmicron).=0A=0A> =0A>=
 Legacy MemSticks also are barebone like XD and thus need an=0A> FTL.=0A> H=
owever, they don't have NAND interface.=0A> =0A=0ALegacy memorysticks are s=
ort-of barebone. In general, they can be seen as=0AMTD targets if you take =
into account that their oob field is actually a=0Aregister, not a directly =
accessible memory.=0A=0A=0A=0A      _______________________________________=
___________________________________________=0AYahoo!7: Catch-up on your fav=
ourite Channel 7 TV shows easily, legally, and for free at PLUS7. www.tv.ya=
hoo.com.au/plus7
