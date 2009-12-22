Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NN95X-0007Y4-UG
	for linux-mtd@lists.infradead.org; Tue, 22 Dec 2009 18:04:08 +0000
Received: by bwz4 with SMTP id 4so4353988bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Dec 2009 10:04:00 -0800 (PST)
Subject: Re: Few problems in mtd system
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20091221140003.GA13316@logfs.org>
References: <290458.39840.qm@web37604.mail.mud.yahoo.com>
	<1261342795.4798.14.camel@maxim-laptop>
	<20091221140003.GA13316@logfs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Dec 2009 20:03:54 +0200
Message-ID: <1261505034.8347.6.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, arnd <arnd@arndb.de>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-12-21 at 15:00 +0100, Jörn Engel wrote: 
> On Sun, 20 December 2009 22:59:55 +0200, Maxim Levitsky wrote:
> > 
> > I suspect that older non type M cards didn't have such emulation, but
> > were real nand chips, bacause there are some references on the web about
> > using XD card as a nand chip replacement.
> > Such card as I have will really will make very poor nand replacement...
> 
> If you want to know whether the cards or the readers are to blame, you
> can try to buy an old alauda reader on ebay.  It is too slow to be
> useful for most purposes, but I believe it did give me full access with
> my cards.
> 
> > Folks, could you review my other questions about bugs in mtd core, and
> > tell your opinion?

I have several problems, more correctly bugs in mtd system I have to fix
to make my driver work.

Lets start from  the problem I face now.

Problem is that add_mtd_blktrans_dev is called with mtd_table_mutex
locked, but it calls add_disk which opens the block device if you
specify that you need partitions on the disk. Open routine 'looks' at
mtd table using get_mtd_device, and thus deadlocks.

Do you have a clue how to fix that so it won't break anything?


Best regards,
Maxim Levitsky
