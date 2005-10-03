Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMNxc-0003wd-4x
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 06:54:43 -0400
Date: Mon, 3 Oct 2005 12:54:21 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Peter Menzebach <pm-mtd@mw-itcon.de>
Message-ID: <20051003105421.GB4639@wohnheim.fh-wedel.de>
References: <43344342.8030303@mw-itcon.de>
	<20050925131630.GC28978@wohnheim.fh-wedel.de>
	<433D2040.3090109@mw-itcon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433D2040.3090109@mw-itcon.de>
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] fix for mtd partitions for erase_size != 2^X
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 September 2005 13:23:44 +0200, Peter Menzebach wrote:
> >
> Here the patch again. As the macro does not seem to reduce the 
> complexity of the line seriously and would be used only once, I did put 
> in a comment, which explains inline, what should go on there.

All right.  I still don't like it, but since I don't have any better
idea...

Jörn

-- 
Das Aufregende am Schreiben ist es, eine Ordnung zu schaffen, wo
vorher keine existiert hat.
-- Doris Lessing
