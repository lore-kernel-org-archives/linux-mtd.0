Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCjt4-0006gS-4L
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2004 15:13:15 -0400
Date: Wed, 29 Sep 2004 20:13:07 +0100
From: Ben Dooks <ben@fluff.org.uk>
To: "lp4u@inwind.it" <lp4u@inwind.it>
Message-ID: <20040929191307.GL22627@home.fluff.org>
References: <I4SQEX$87F965B35ECF509E90791E3541F12398@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <I4SQEX$87F965B35ECF509E90791E3541F12398@libero.it>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: s3c2410 nand controller (#2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 29, 2004 at 11:30:33AM +0200, lp4u@inwind.it wrote:
> Hi,
> 
> I've trying, but I receive an error; this is my compiling error message:

[snip]

rmk posted a fix for the first compile problem, that I think got into
either 2.6.9-rc2-bk12 or 2.6.9-rc2-bk13, so go and get the latest release.

Secondly, you will also need to apply the following patch:

http://www.fluff.org/ben/linux-26/mtd-bast1.patch
and ensure CONFIG_BAST_NAND is set


-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
