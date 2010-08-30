Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq3Z4-0006GW-0a
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 12:34:18 +0000
Received: by vws11 with SMTP id 11so5510221vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 05:34:17 -0700 (PDT)
Subject: Re: NAND flash data table
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1282802549.24044.267.camel@localhost>
References: <4C75FF39.9010709@gmail.com> <1282802549.24044.267.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 15:34:11 +0300
Message-ID: <1283171651.12995.58.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-26 at 09:02 +0300, Artem Bityutskiy wrote:
> On Wed, 2010-08-25 at 22:44 -0700, Brian Norris wrote:
> > Hello,
> > 
> > I am submitting two documents to the general Linux MTD community
> > (attached). They are two tables: one in simple CSV format and the other
> > in a lightly formatted HTML page. They comprise the summary of a few
> > months' work in studying and cataloging NAND flash parts and their data
> > sheets. The attached data should be helpful to other developers in
> > debugging support for various chips as well as in determining future
> > methods for detection of new chips. There are a few extra comments and
> > color-labeling in the HTML doc.
> > 
> > I am open to the wider use of these documents (e.g., incorporation into
> > the MTD website as additional documentation) and have GPL'd the table.
> > It could very easily be converted to a kind of XML mini-database with
> > functionality to build into a web-page. Of course, I don't have time to
> > do this at the moment :) Send me any comments or questions, though.
> > 
> > I hope this is useful!
> 
> Impressive! How about sending a patch against mtd-www.git and we'll put
> this to the web site?

If you cannot do this, let me know, I'll try to adapt this to the mtd
web site - this piece of information is very useful.

Also, I please, take a look at my l2 tree - I think I picked up or
commented on all your patches, but there were many and I could miss
some. Please, let me know if something is missing.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
