Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15fHDN-0006Oh-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 09:42:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010907131648.A14568@hartford.siteprotect.co.kr> 
References: <20010907131648.A14568@hartford.siteprotect.co.kr>  <617933180D08D311AB500090273F1F96026A354E@storm.corp.directvbroadband.net> <Pine.LNX.4.33.0109061717360.9437-100000@hex.linuxgrrls.org> 
To: zeppelin@kernelhacker.org
Cc: kira brown <kira@hex.linuxgrrls.org>, linux-mtd@lists.infradead.org
Subject: Re: What abount NAND driver in current MTD snapshot? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 07 Sep 2001 09:48:02 +0100
Message-ID: <22302.999852482@redhat.com>
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


kernelhacker@hartford.siteprotect.co.kr said:
> I've just looked up MTD NAND driver for recent several days.
> I think it's almost done. But the driver itself has no bad block
> handling.

> Is it right? If it is right, where is the bad block handling?

The hardware driver itself has no bad block handling, yes - that should be 
done in the next layer up. Each format which you might put onto a NAND 
flash may have its own way of dealing with bad blocks. 

> Is NFTL capable of handling bad block? 

The NFTL format is capable of dealing with bad blocks, yes. But I don't
believe the Linux code currently does so with blocks which go bad at
runtime, only blocks which are marked bad during the initial format. A 
relatively simple exercise for the reader :)

> then, Can I use NAND driver & NFTL combined and put any filesystem on
> it? 

Technically, yes. But you probably shouldn't use NFTL. 

Firstly, as Kira says, NFTL suffers from patent problems, so you may find
it's not legal to use it. I'm not sure whether the M-Systems patents are
valid in Korea. 

More importantly, I think NFTL is just the wrong approach to putting a 
filesystem on a flash chip. NFTL is a form of pseudo-filesystem, used to 
emulate a block device. On top of that filesystem, you're going to have to 
put another journalling filesystem, like ext3. It is far more efficient 
just to put a filesystem directly on the flash chips. 

I think the best approach would be to add the necessary support for NAND 
chips to the JFFS2 code. Getting JFFS2 to deal with the 10-write-per-page 
restriction should be fairly simple, and the bad block code in JFFS2 is in 
much the same state as that in the NFTL code - we can deal with bad blocks 
appropriately but don't yet actually detect bad blocks and mark them as 
such. So if you're going to add badblock detection code, you might as well 
add it to JFFS2.

--
dwmw2
