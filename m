Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bng2t-0001YZ-NK
	for linux-mtd@lists.infradead.org; Thu, 22 Jul 2004 12:03:47 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Cosmin Cremarenco <cosmin.cremarenco@inria.fr>
In-Reply-To: <33587.128.93.9.76.1090511579.squirrel@smis.inria.fr>
References: <33587.128.93.9.76.1090511579.squirrel@smis.inria.fr>
Content-Type: text/plain
Date: Thu, 22 Jul 2004 12:03:22 -0400
Message-Id: <1090512202.4089.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: emulator for NAND Flash memory
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-07-22 at 17:52 +0200, Cosmin Cremarenco wrote:
> Hello to everyone
> 
> I'm trying to develop a prototype based on the NAND flash memories,
> but unfortunately I don't have the board yet.
> 
> My question: is there an emulator of NAND Flash in Linux,
> and can it be used directly by the mtd core?

There isn't, although it shouldn't be so hard to update mtdram to do it.
Or you could just use a DiskOnChip :)

-- 
dwmw2
