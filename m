Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1898wi-0000jo-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 19:01:05 +0000
Date: Tue, 5 Nov 2002 20:31:16 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Junping Zhang <JZhang@erinc.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: seeking help on JFFS2
Message-ID: <20021105193116.GC29951@wohnheim.fh-wedel.de>
References: <F4608F665DF5D311B231009027B70F700131DEB6@MAIL>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F4608F665DF5D311B231009027B70F700131DEB6@MAIL>
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

On Tue, 5 November 2002 12:39:31 -0500, Junping Zhang wrote:
> Yes, the minor number is 2, and I checked mkfs.jffs2 source, hex is ok. I
> also tried with
> the method you mentioned, the crashed happened right away.

Ok.

> I just tried using the stock JFFS2 in 2.4.18 kernel. It actually got me
> further than JFFS2
> in my mtd-20021022 snapshot, I could use either image or direct mount to
> create JFFS2,
> but it still crashed under stress test. On the other hand, JFFS works quite
> well.

Ok.

> Does stock 2.4.19 have a stable JFFS2 without patch? I downloaded a
> shared-zlib patch
> for 2.4.19-pre10 but am not sure it will fix my JFFS2 problem.

2.4.19 should have a stable jffs2, as should 2.4.18. You can try
2.4.19, but I don't expect any better behaviour.

What flashes do you exactly use? And can you provide ssh login to the
development host?

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
