Received: from cc60549-a.deven1.ov.nl.home.com ([217.120.142.92] helo=server.wielewaal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AC8m-0006IH-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 17:05:36 +0100
From: "Pieter Grimmerink" <mailinglists@grimmerink.nl>
To: =?iso-8859-1?Q?Poul_Lund_J=F8rgensen?= <plj@pragmaticconsult.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: jffs2 on DOC ?
Date: Tue, 21 May 2002 18:04:10 +0200
Message-ID: <MPBBIIEFELAEABNCNHMMGENFDAAA.mailinglists@grimmerink.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <005d01c200d6$a0f88c80$0201a8c0@PLJPC>
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


> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Poul Lund
> Jørgensen
> Sent: dinsdag 21 mei 2002 16:49
> To: linux-mtd@lists.infradead.org
> Subject: jffs2 on DOC ?

> Another solution would be to run jffs2 on the DOC. But the drivers that
> comes with the kernel I use (2.4.18) does not support this.

According to David Woodhouse, all that's left to do to make DOC support
JFFS2, is to make the write/read functions handle more than 512 bytes
of data.

I've quickly looked into this, but I'm not sure whether just adding a loop
within these functions would do, as I haven't found how bad sectors
are handled within the write/read functions yet.

I could imagine that the file offset always points to the actual location
in the DOC, so that we could have a write of lets say 4 bytes, and
a bad sector in the middle would then cause the file offset to be increased
with 516, but I'm not sure.

I'll eventually need JFFS2 on DOC, but it isn't currenly the first point on
my list,
so I'm secretly hoping someone will fix it before I need it ;-)

Regards,

Pieter
