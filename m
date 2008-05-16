Received: from smtp-out1.atlngahp.sys.nuvox.net ([70.43.63.18]
	helo=smtp01.atlngahp.sys.nuvox.net)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jwz8Q-0007rm-AW
	for linux-mtd@lists.infradead.org; Fri, 16 May 2008 12:34:06 +0000
Message-ID: <39423.137.237.242.42.1210941221.squirrel@webmail.nuvox.net>
In-Reply-To: <20080516055424.GA10763@cloud.net.au>
References: <57616.137.237.242.138.1210774371.squirrel@webmail.nuvox.net><Pine.LNX.4.64.0805141752210.5183@pentafluge.infradead.org>
	<20080516055424.GA10763@cloud.net.au>
Date: Fri, 16 May 2008 08:33:41 -0400 (EDT)
Subject: Re: Porting to Intel P33 flash
From: jkimble@one.net
To: "Hamish Moffatt" <hamish@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Alexey Korolev <akorolev@infradead.org>,
	jkimble@one.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Funny you say that...  I just modified the code where it checks CFI
version  and it seems to be working without further modification. I've not
tested much though so I may have more to do. I do have to write to this
but not much.

James

>
> I've been running 2.6.15 with P33 CFI 1.5 without issue. Almost
> completely read-only operation though in my application.
>
> Hamish
> --
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
