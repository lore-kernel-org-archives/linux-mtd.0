Received: from alya.utu.fi ([130.232.202.242])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Y9Kk-0007aC-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 17:24:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by alya.utu.fi (Postfix) with ESMTP id 8E31A1B24B
	for <linux-mtd@lists.infradead.org>; Tue,  5 Feb 2002 19:35:51 +0200 (EET)
Date: Tue, 5 Feb 2002 19:35:51 +0200 (EET)
From: =?ISO-8859-1?Q?Veli-Pekka_Yl=F6nen?= <velpeyl@utu.fi>
To: <linux-mtd@lists.infradead.org>
Subject: Re: NAND flash and JFFS(2)
In-Reply-To: <Pine.LNX.4.44.0202060108320.5284-100000@lapdancer.baythorne.internal>
Message-ID: <Pine.SOL.4.30.0202051927500.7175-100000@alya.utu.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I am using 64 Mbyte chip and only 3 partial page writes is allowed. I
guess that Samsung models 16 MB to 64 MB allow 5 partial page writes and
Toshiba 64 M chip - the one I am using - allows 3.

Any possibility to increase the node size in JFFS to make it work also
with my chip?

On Wed, 6 Feb 2002, David Woodhouse wrote:
>
> JFFS ought to be OK on chips that can take ten write cycles per 512-byte
> page, because it uses writev to ensure that nodes are written in one go,
> and no node will be less than 52 bytes.
>
> On NAND flash chips which can do fewer than ten writes per page, JFFS
> probably won't work either.
