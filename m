Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7MAx-00022L-Fy
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2004 18:53:28 -0400
Date: Tue, 14 Sep 2004 23:53:26 +0100
From: Ben Dooks <ben@fluff.org.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20040914225326.GB10212@home.fluff.org>
References: <BAY19-F26rjbudzxxfY00000234@hotmail.com>
	<1095144914.9144.179.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1095144914.9144.179.camel@imladris.demon.co.uk>
Sender: Ben Dooks <ben@fluff.org>
Cc: 
Subject: Re: Need help about mtd on s3c2410
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 14, 2004 at 07:55:14AM +0100, David Woodhouse wrote:
> On Tue, 2004-09-14 at 13:34 +0800, zheng wei wrote:
> > Hi, sir
> >     I download the mtd newest package, and use patchin.sh to install it ... 
> > 
> > But when I make zImage, errors was found...
> >     It says that there sis no bug.h file included in map.h.
> > How can i resolve it?
> 
> The kernel you are using is too old. Make sure you're using a 2.6
> kernel.

The 2.6 s3c2410 support is comming along, but a few of the boards
are lacking peripherals. As I don't have an SMDK2410 (or derivative)
boards to play with, I cannot currently comment on the support for
them.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
