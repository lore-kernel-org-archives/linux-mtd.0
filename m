Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ADV6-0003Oc-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 17:28:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0106131230490.23397-100000@xanadu.home> 
References: <Pine.LNX.4.33.0106131230490.23397-100000@xanadu.home> 
To: Nicolas Pitre <nico@cam.org>
Cc: Vipin Malik <vipin.malik@daniel.com>,
    Xavier DEBREUIL <xde@inventel.fr>, linux-mtd@lists.infradead.org
Subject: Re: root jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Jun 2001 17:33:33 +0100
Message-ID: <4676.992450013@redhat.com>
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

nico@cam.org said:
>  On Wed, 13 Jun 2001, Vipin Malik wrote:
> > What about a "jffs2erase" routine that not only erases the flash sectors
> > but also writes out this "signature" at the start of every erase block.
> > This way one can mount an empty JFFS2 fs on a MTD partition erased by 
> > jffs2erase?

> This is IMHO not the real solution.

Why? No other filesystem can be mounted on empty media without some form of 
mkfs.

In fact you wouldn't need to do every block. All you'd have to do is put 
the 12-byte cleanmarker node at the beginning of the first block and it'd 
be sufficient. 

You could do this with a suitable 'echo' command.


--
dwmw2
