Received: from server1.lazerlink.net ([199.234.153.21])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mx3s-0002FQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 13:20:28 +0000
From: "Stephen Bardsley" <sbardsley@rlwinc.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: bad block recovery 
Date: Mon, 18 Mar 2002 08:31:53 -0500
Message-ID: <PCEBLNKIDOKLBPDJECFEKEBDDHAA.sbardsley@rlwinc.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <29597.1016456563@redhat.com>
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

> sbardsley@rlwinc.com said:
> >  My understanding is that the chip is now "unreliable", which I can
> > live with for now.  Does unreliable mean I can still use the chip if I
> > can somehow format it?
> 
> Yes. Blocks can go bad during normal operation, and we have to be able to 
> deal with that case _anyway_. My nftl_format program can be made to do some 
> primitive tests on each erase block, and mark the completely broken ones as 
> such before formatting. But (for the benefit of the peanut gallery) you 
> should _only_ use nftl_format if you have already lost your bad block list.
> 
> --
> dwmw2

Dave, thanks for the prompt response.

I built the mtd/utils, and read the FAQ.  All indications are that the bad
block table is gone.  So I ran nftl_format and received the message
"Erase size not 8Kb - I'm confused".  What exactly does this mean?

I took a quick look at the code and see that meminfo.erasesize is used to
scale various values.  I don't see why 8Kb is a limit.  I have found that
my chip's erase size to be 16Kb; is there any way for me to use nftl_format?
If necessary, I don't mind modifying the code, but I don't want to screw it
up.  Any hints?

Steve
_____________________
Stephen Bardsley
RLW Inc.
Malta, NY 
