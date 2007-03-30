Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HXE5c-0003zc-6e
	for linux-mtd@lists.infradead.org; Fri, 30 Mar 2007 06:12:15 -0400
Subject: Kernel LZO compression + jffs2 and crypto usage
From: Richard Purdie <richard@openedhand.com>
To: David Woodhouse <dwmw2@infradead.org>,
	herbert@gondor.apana.org.au
Content-Type: text/plain
Date: Fri, 30 Mar 2007 11:11:58 +0100
Message-Id: <1175249518.5822.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm <akpm@linux-foundation.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've put the LZO patch series I sent a few weeks ago in a git tree:

http://git.o-hand.com/?p=linux-rpurdie;a=shortlog;h=linux-rpurdie-lzo

(git://git.o-hand.com/linux-rpurdie linux-rpurdie-lzo)

I'm not sure of the best way to merge this since it touches two
subsystems. David, do you want to pull the initial patch and jffs2 parts
and then the crpyto patch can follow through the crypto tree? I'm hoping
this can make 2.6.22. 

Let me know if there is anything further I can do to help.

Cheers,

Richard
