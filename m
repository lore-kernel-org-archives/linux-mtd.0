Received: from xena.bway.net ([216.220.96.26] helo=mail.bway.net)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4imV-0001Qq-Rb
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 13:29:59 -0400
Message-ID: <4300D117.5080606@bway.net>
Date: Mon, 15 Aug 2005 17:29:59 +0000
From: "Ryan B. Lynch" <rlynch@bway.net>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <4300BEE2.4020104@bway.net> <4300C922.402@bway.net>
	<4300CA41.60706@yandex.ru>
In-Reply-To: <4300CA41.60706@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: possible bug in "--pad" option for mkfs.jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey,

Artem B. Bityuckiy wrote:

> Ryan B. Lynch wrote:
>
> Dunno, never used this option (what for?). Glance at
> utils/mkfs.jffs2.c. :-) \


The "--pad" option?  From the manpage:

"-p, --pad[=SIZE]
    Pad output to SIZE bytes with 0xFF.  If SIZE is not specified, the
output is padded to the end of the final erase block."

I'm looking at the C source right now, too... gonna see if I can figure
out WTF is going on.

-Ryan
