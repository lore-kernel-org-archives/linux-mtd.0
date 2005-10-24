Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EU2PX-0001He-8B
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2005 09:31:08 -0400
To: Ben Dooks <ben@fluff.org.uk>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Mon, 24 Oct 2005 10:57:48 BST."
	<20051024095748.GA6566@home.fluff.org>
Date: Mon, 24 Oct 2005 15:30:10 +0200
Sender: wd@denx.de
Message-Id: <20051024133010.79DCD353450@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: Add support for the "TQM834x" Boards 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <20051024095748.GA6566@home.fluff.org> you wrote:
>
> > [PATCH] MTD: Add support for the "TQM834x" Boards
...
> > +#define NB_OF(x)  (sizeof(x)/sizeof(x[0]))
> 
> how about ARRAY_SIZE() here?

Good idea. Thanks for pointing out.

Um... what shall I do now? Resubmit the whole  patch,  or  submit  an
incremental one?

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Sorry, but my karma just ran over your dogma.
