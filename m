Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E77xX-0004qY-U8
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 04:47:17 -0400
Message-ID: <43099109.3050609@inf.u-szeged.hu>
Date: Mon, 22 Aug 2005 10:47:05 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Bernhard Priewasser <bernhard@prie.de>
References: <43098213.1020807@prie.de>
In-Reply-To: <43098213.1020807@prie.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Testing JFFS2 using mtdram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Bernhard,

> I'm going to run some performance and stability testing on JFFS2.
> Using mtdram makes basic testing issues very comfortable. My question
> is how far mtdram can substitute a "real" flash (not for absolute
> measurement of course, only comparisons)?
> Am I right with my first approach:
>  read operations - yes
>  write operations - no?

mtdram emulates NOR flash (both read and write operations), but does not
emulate delays. You can test stability with it, but for performance I
suggest Artem's nand simulator. It's included in the official MTD. It
can emulate delays and ceratinly you can test the NAND functionalities
of JFFS2, too.

Ferenc
