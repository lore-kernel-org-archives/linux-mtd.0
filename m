Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4bpU-0004c1-17
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 04:32:13 -0500
Date: Fri, 25 Feb 2005 09:31:44 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: extabe@bredband.net
In-Reply-To: <20050224231739.LCON24441.mxfep03.bredband.com@mxfep03>
Message-ID: <Pine.LNX.4.58.0502250931370.5525@phoenix.infradead.org>
References: <20050224231739.LCON24441.mxfep03.bredband.com@mxfep03>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND Driver skeleton?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

extabe@bredband.net wrote:
> Hi all!
> I will make a new NAND board driver for our own hardware. Is there a 
good and basic driver whitch I can start from?
> I saw drivers/mtd/nand/skeleton was mentioned in the "MTD NAND Driver 
Programming Interface" manual, but I cant find the skeleton anyware.
> 
I don't know about drivers/mtd/nand/skeleton, but IMO nand_base.c contains 
good enough "skeleton" comprised on default handlers of NAND operations.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
