Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0SHh-0007pQ-CE
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 17:59:57 -0400
Date: Thu, 26 Aug 2004 22:59:46 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: Matthew Reimer <mreimer@vpop.net>
Message-ID: <20040826215946.GA3137@home.fluff.org>
References: <412E5AFC.5050000@joshuawise.com> <412E5CD8.5020706@vpop.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <412E5CD8.5020706@vpop.net>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org,
	h2200-port mailing list <h2200-port@handhelds.org>,
	Kernel-discuss@handhelds.org
Subject: Re: [H2200-port] HAMCOP NAND driver
Reply-To: Ben Dooks <ben@fluff.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 26, 2004 at 02:57:44PM -0700, Matthew Reimer wrote:
> Hi Joshua.
> 
> Joshua Wise wrote:
> 
> >Hi folks,
> >
> >Is there any reason why HAMCOP NAND driver is not in the MTD directory 
> >and MTD CVS as all the other NAND drivers are?
> 
> I can't recall exactly, but I probably put it there because it seemed 
> like it ought to live with the rest of its SoC brethren, or it was 
> easier. I think my first version did live in with mtd. It doesn't matter 
> to me where it lives. Where does its cousin S3C2410 NAND driver live?

nowhere atm, there is an 2.4 version which is in the last EB2410ITX
kernel patch I did, and possibly one for the 2.6 to be done.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
