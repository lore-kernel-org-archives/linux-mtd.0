Received: from web52707.mail.yahoo.com ([206.190.39.158])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DL23y-0003bg-84
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 12:47:02 -0400
Message-ID: <20050411164702.13787.qmail@web52707.mail.yahoo.com>
Date: Mon, 11 Apr 2005 09:47:01 -0700 (PDT)
From: Michael <xemc@yahoo.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>,
	Cliff Brake <cliff.brake@gmail.com>
In-Reply-To: 6667
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how little do i have to do to define flash layout on my system?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> i did a bit more reading last night and concluded that the
> PHYSMAP stuff would let me define a single flash chip but no
more.
> so if i want multiple chips, it *appears* that i have to write a
> maps file.
> 
> rday

Could an alternative be to extend the physmap stuff to handle
multiple chips?  If situations like yours are more common, this
solution will make it simpler for all.

Mike
