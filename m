Received: from crl-mail.crl.dec.com ([192.58.206.9])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZWmX-000219-1P
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2003 15:15:53 +0100
From: Jamey Hicks <jamey.hicks@hp.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1057324808.12384.314.camel@passion.cambridge.redhat.com>
References: <000701c3422d$eb1417f0$1d00a8c0@cristianop>
	 <1057324808.12384.314.camel@passion.cambridge.redhat.com>
Message-Id: <1057587225.3151.1483.camel@vimes.crl.hpl.hp.com>
Mime-Version: 1.0
Date: 07 Jul 2003 10:13:45 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Cristiano Parzani <c.parzani@tattile.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Secure Digital on Linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-07-04 at 09:20, David Woodhouse wrote:
> On Fri, 2003-07-04 at 14:12, Cristiano Parzani wrote:
> > Hi to all,
> > I am interested in Secure Digital (SD) under Linux, I have read the
> > previous email posted here, someone could gladly tell me where to find
> > information? 
> 
> SD is a problem because the specs are fairly hard to get hold of, and
> without them we don't know how to initialise the cards. 
> 
> There is some information at
> http://polysat.calpoly.edu/documents_cp2/cdh/data_sheets/toshiba_m1283bx.pdf
> 

I think that document has nearly enough information to make SD work.

Luc Saillard sent me the following two document pointers, along with a
patch adding support for SD cards to the MMC framework used by
handhelds.org on the iPAQ.

-Jamey

Somes pointers found with google:
> 
>
www.intel.com/design/pca/applicationsprocessors/applnots/278533-001.htm
> ==>
>
ftp://download.intel.com/design/pca/applicationsprocessors/applnots/278533-
> At the end the pdf, you will find some code example to initialize the
> sdcard.
> 
> This documentation details all public registers (not secure register)
and
> all commands (only number not parameters).
> many documentation can be found written by toshiba
>
http://polysat.calpoly.edu/documents_cp2/cdh/data_sheets/toshiba_m1283bx.pdf
> http://i.cmpnet.com/chipcenter/memory/images/prod055.pdf
> or http://www.chipcenter.com/memory/images/prod055.pdf
> 
