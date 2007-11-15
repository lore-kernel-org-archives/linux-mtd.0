Date: Thu, 15 Nov 2007 12:55:07 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
In-Reply-To: <Pine.LNX.4.64.0711151241140.30407@pentafluge.infradead.org>
Message-ID: <Pine.LNX.4.64.0711151250550.30407@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195071456.2533.45.camel@shinybook.infradead.org>
	<20071115122042.GA10165@lazybastard.org>
	<Pine.LNX.4.64.0711151241140.30407@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Roman.borisov@intel.com, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
Oh I've completely forgot to say that the issue take place on NOR only.
We think that we can;t reproduce the problem on NAND - because of ECC correction which usually corrupts whole page in case of partial write. (It could be incorrect just an idea). 
> I think using this way the issue could be reproduced.
> Please find image files in the next directly addressed message.
> Thanks,
> Alexey
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
