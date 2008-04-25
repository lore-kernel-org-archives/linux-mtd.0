Date: Fri, 25 Apr 2008 10:59:31 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
In-Reply-To: <4810F549.6030107@users.sourceforge.net>
Message-ID: <Pine.LNX.4.64.0804251052290.30914@pentafluge.infradead.org>
References: <4807B552.7090501@users.sourceforge.net>
	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>
	<20080418163536.GD31520@shareable.org>
	<6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>
	<48091C7A.1070709@users.sourceforge.net>
	<012501c8a1fe$4a5308e0$def91aa0$@Tjernlund@transmode.se>
	<4809F7EC.9010808@users.sourceforge.net>
	<Pine.LNX.4.64.0804241524310.16953@pentafluge.infradead.org>
	<4810F549.6030107@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

> > After applying it the issue is not seen on test items which usually
> > fails. (However to prove that it is Ok
> > we need to execute whole bunch. It will be completed on next day)
> 
> Works a lot better but it has failed one time so far with the patch applied.
>
Could you please specify how it fails. I'm not sure that we are talking
about the same issue. Also I need to see the data read just after broken
erase. Could you please read the same data several times just after
broken erase and compare it? Will data in erase block be the same? Is 
you flash configuration interleaved? 

Thanks,
Alexey
