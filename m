Received: from smtp104.mail.mud.yahoo.com ([209.191.85.214])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWMSH-0002wv-3E
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 02:32:49 +0000
From: Nick Piggin <nickpiggin@yahoo.com.au>
To: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 22 Aug 2008 12:32:41 +1000
References: <48AD00C4.6060302@gmail.com>
	<200808212043.51209.nickpiggin@yahoo.com.au>
	<6934efce0808210713m220d2a6cje06a2dc51c4a857a@mail.gmail.com>
In-Reply-To: <6934efce0808210713m220d2a6cje06a2dc51c4a857a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808221232.42115.nickpiggin@yahoo.com.au>
Cc: linux-embedded@vger.kernel.org, carsteno@de.ibm.com,
	=?utf-8?q?J=C3=B6rn?= Engel <joern@logfs.org>,
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

On Friday 22 August 2008 00:13, Jared Hulbert wrote:
> > Agreed. I haven't had a good look through it yet, but at a glance it
> > looks pretty neat. The VM side of things looks pretty reasonable
> > (I fear XIP faulting might have another race or two, but that's a
> > core mm issue rather than filesystem specific).
>
> How might I design a test to flush those bugs out?  We haven't seen any.

Not quite sure yet. I just fixed a couple of easy ones, but there
could be some more lurking. Don't be too worried about it yet, I
was just musing to myself there really :)
