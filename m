Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JVRK-0000T7-00
	for <linux-mtd@lists.infradead.org>; Sun, 16 Jun 2002 09:31:15 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Der Herr Hofrat <der.herr@mail.hofr.at>
Subject: Re: Boot from NAND flash ???
Date: Sun, 16 Jun 2002 20:18:27 +1200
Cc: linux-mtd@lists.infradead.org
References: <200206160558.g5G5wWk09998@hofr.at>
In-Reply-To: <200206160558.g5G5wWk09998@hofr.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020616082514.B5CAD14095@dragon.actrix.co.nz>
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

On Sun, 16 Jun 2002 17:58, Der Herr Hofrat wrote:
> > > There's another important limitation. Who guarantees you, that your
> > > "boot-page" does not get bad or is a bad block already. That's the
> > > reason, why DOC has 4 blocks with the same code.
> >
> > The first page of NAND is guaranteed to be good.
>
> do you have a pointer to docs that explains this ?
> is it common to all NAND devices that they replicated the first block in
> hardware or did I missunderstand your statement.
>

They do not replicate the first block.

What happens is this:
* At manufacturing test time, bad blocks are identified and are marked.
* If more than n blocks are found to be defective, the part is discarded.
* If the first block is found to be defective, the part is discarded. 
ie. when it ships, block zero is guaranteed good.

Of course, block 0 might fail with time....

At least one doc on the Samsung www explains this.

-- Charles
