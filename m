Received: from ns4a.townisp.com ([216.195.0.138] helo=ns4.townisp.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1C68p1-0001nv-Nc
	for linux-mtd@lists.infradead.org; Sat, 11 Sep 2004 10:25:48 -0400
Received: from gemini.home.net (dhcp-0-10-57-0-7-57.cpe.townisp.com
	[216.195.15.243])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by ns4.townisp.com (Postfix) with ESMTP id 8F5B629920
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Sep 2004 10:25:40 -0400 (EDT)
Date: Sat, 11 Sep 2004 10:26:15 -0400 (EDT)
From: Jamie Guinan <guinan@bluebutton.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.44.0408311207130.9460-100000@gemini.home.net>
Message-ID: <Pine.LNX.4.44.0409092347290.6169-100000@gemini.home.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Re: Setting up MTD via command line?
Reply-To: Jamie Guinan <guinan@bluebutton.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 31 Aug 2004, Jamie Guinan wrote:

> > Can anyone explain, or is there docs on how to setup MTD via command
> > line, which I think was introduced so 
> > you don't need to write your own driver for e.g. embedded processors
> > such as ARM.
> 
> Hi Bo,
> 
> I found it in the config help for "Command line partition table parsing",
> and also in the comments in cmdlinepart.c.
> 
> For the LogicPD board (lpd7a404 here), I used this kernel command-line,
> 
>   boot console=ttyAM1 root=/dev/mtdblock3 rootfstype=jffs2 \
>     mtdparts=phys_mapped_flash:256k,256k,1536k,2048k

Erm, that only gets access to 4MB (one of my test boards has only 4MB,
which is why I tested it as above).  To use the full 16MB of flash on 
some LogicPD boards,

   mtdparts=phys_mapped_flash:256k,256k,1536k,14336k

-Jamie
