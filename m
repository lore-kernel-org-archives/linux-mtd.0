Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3Cp-0007EY-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 10:31:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B677B90.B2E244BD@cvs.anu.edu.au> 
References: <3B677B90.B2E244BD@cvs.anu.edu.au>  <E15RXGo-00058Q-00@pentafluge.infradead.org> 
To: Saul Thurrowgood <saul@cvs.anu.edu.au>
Cc: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>,
    linux-mtd@lists.infradead.org, "Walser, Martin" <mwalser@harris.com>
Subject: Re: DOC 2000 driver (NFTL) in kernel 2.4.7 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 10:36:39 +0100
Message-ID: <30960.997176999@redhat.com>
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


saul@cvs.anu.edu.au said:
>  I fixed it by formatting with nftl_format (also comes with MTD
> source), providing it a 240k offset so it would not trash the BIOS at
> the beginning of the chip (Ampro specific).

That's normally 48KiB for the standard on-device firmware, I think.

> Works fine! So, what's the difference between the two formats?!? Both
> start at the exact same place on the DOC, as seen by running nftldump
> before and after. 

Please upgrade to the latest version from CVS (nftlmount.c v1.20). It'll be 
a lot more explicit about its reasons for rejecting any media headers which 
it finds.

--
dwmw2
