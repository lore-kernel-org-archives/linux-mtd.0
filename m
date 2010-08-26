Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OoVZ3-0000m3-UN
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2010 06:03:55 +0000
Received: by bwz13 with SMTP id 13so1098896bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Aug 2010 23:03:51 -0700 (PDT)
Subject: Re: NAND flash data table
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <4C75FF39.9010709@gmail.com>
References: <4C75FF39.9010709@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Aug 2010 09:02:29 +0300
Message-ID: <1282802549.24044.267.camel@localhost>
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

On Wed, 2010-08-25 at 22:44 -0700, Brian Norris wrote:
> Hello,
> 
> I am submitting two documents to the general Linux MTD community
> (attached). They are two tables: one in simple CSV format and the other
> in a lightly formatted HTML page. They comprise the summary of a few
> months' work in studying and cataloging NAND flash parts and their data
> sheets. The attached data should be helpful to other developers in
> debugging support for various chips as well as in determining future
> methods for detection of new chips. There are a few extra comments and
> color-labeling in the HTML doc.
> 
> I am open to the wider use of these documents (e.g., incorporation into
> the MTD website as additional documentation) and have GPL'd the table.
> It could very easily be converted to a kind of XML mini-database with
> functionality to build into a web-page. Of course, I don't have time to
> do this at the moment :) Send me any comments or questions, though.
> 
> I hope this is useful!

Impressive! How about sending a patch against mtd-www.git and we'll put
this to the web site?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
