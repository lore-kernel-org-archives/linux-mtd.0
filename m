Received: from [80.120.128.82] (helo=hofr.at)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JTuo-0000LS-00
	for <linux-mtd@lists.infradead.org>; Sun, 16 Jun 2002 07:53:34 +0100
From: Der Herr Hofrat <der.herr@mail.hofr.at>
Message-Id: <200206160558.g5G5wWk09998@hofr.at>
Subject: Re: Boot from NAND flash ???
In-Reply-To: <20020514074256.761DD49AA@tiger.actrix.co.nz> from Charles Manning
 at "May 14, 2002 07:37:41 pm"
To: manningc2@actrix.gen.nz
Date: Sun, 16 Jun 2002 07:58:31 +0200 (CEST)
CC: gleixner@autronix.de, David Woodhouse <dwmw2@infradead.org>,
   franck.fleter@netbricks.com, linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

> 
> > There's another important limitation. Who guarantees you, that your
> > "boot-page" does not get bad or is a bad block already. That's the reason,
> > why DOC has 4 blocks with the same code.
> 
> The first page of NAND is guaranteed to be good.
>
do you have a pointer to docs that explains this ?
is it common to all NAND devices that they replicated the first block in
hardware or did I missunderstand your statement.

hofrat
 
