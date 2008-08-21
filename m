Received: from smtp110.mail.mud.yahoo.com ([209.191.85.220])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW7e4-0007xy-7d
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 10:44:01 +0000
From: Nick Piggin <nickpiggin@yahoo.com.au>
To: carsteno@de.ibm.com
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 20:43:50 +1000
References: <48AD00C4.6060302@gmail.com> <48AD42AE.4030107@de.ibm.com>
In-Reply-To: <48AD42AE.4030107@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808212043.51209.nickpiggin@yahoo.com.au>
Cc: linux-embedded@vger.kernel.org,
	=?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 21 August 2008 20:25, Carsten Otte wrote:
> Jared Hulbert wrote:
> > I'd like to get a first round of review on my AXFS filesystem.
>
> I like the general approach of it. It's much more flexible than the
> ext2 extension I've done, and the possibility to select XIP vs.
> compression per page is really really neat. I can imagine that people
> will prefer this over the ext2 implementation on s390. It is unclear
> to me how the "secondary block device" thing is supposed to work.
> Could you elaborate a bit on that?

Agreed. I haven't had a good look through it yet, but at a glance it
looks pretty neat. The VM side of things looks pretty reasonable
(I fear XIP faulting might have another race or two, but that's a
core mm issue rather than filesystem specific).
