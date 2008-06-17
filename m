Date: Tue, 17 Jun 2008 17:00:42 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [BUG] JFFS2 power loss recovery issues on NAND
In-Reply-To: <20080617092434.GA27539@logfs.org>
Message-ID: <alpine.LFD.1.10.0806171642280.31079@casper.infradead.org>
References: <alpine.LFD.1.10.0806101438520.27550@casper.infradead.org>
	<48570D5A.1050906@call-direct.com.au> <48577212.9070004@parrot.com>
	<20080617092434.GA27539@logfs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Iwo Mergler <iwo@call-direct.com.au>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

> > > 
> > But what happen if a but flip happen ?
> 
> The exact same problem.
> 
> Changing the default is bogus.  Re-reading without ecc on invalid
> checksums may be the only solution for jffs2, though.  Either that or
> close your eyes and claim that holes in files can happen on power loss.
> 
Correct it is better do not touch OOB area at all since it may broke
compatibility. 

Declare bug as a feature could be not so good. But the issue is rare. I think if we got some time we will fix it in the described way.

Thanks,
Alexey
