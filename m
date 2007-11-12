Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrZWl-00057i-RZ
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 08:40:42 -0500
Date: Mon, 12 Nov 2007 13:35:39 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: Kernel memleak in jffs2_erase_block() (fs/jffs2/erase.c:78)
Message-ID: <20071112123539.GB6330@lazybastard.org>
References: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
	<1194870649.4029.37.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1194870649.4029.37.camel@gentoo-jocke.transmode.se>
Cc: linux-mtd@lists.infradead.org, Damir Shayhutdinov <lost404@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 November 2007 13:30:49 +0100, Joakim Tjernlund wrote:
> 
> Nope, instr is freed in jffs2_erase_callback() in this case.

Ick!  So this will double-free if an erase method calls the callback
_and_ returns an error.  Given the well-documented interfaces we have, I
wouldn't be surprised to find such a driver.

Oh well, just ignore my patch then.

Jörn

-- 
Unless something dramatically changes, by 2015 we'll be largely
wondering what all the fuss surrounding Linux was really about.
-- Rob Enderle
