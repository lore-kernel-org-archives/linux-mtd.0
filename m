Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CrHk1-0001db-Lj
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2005 10:27:30 -0500
Date: Wed, 19 Jan 2005 16:27:26 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ben Dooks <ben-mtd@fluff.org>
Message-ID: <20050119152726.GC26711@wohnheim.fh-wedel.de>
References: <20050118154658.GA6404@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050118154658.GA6404@home.fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: new driver - generic platform device for ram mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 January 2005 15:46:58 +0000, Ben Dooks wrote:
> 
> This patch adds a generic platform_device driver for
> adding areas of RAM to be exported as an MTD device.
> 
> Using the platform_device method enables boards to
> register areas of RAM with the MTD system without
> having to update a driver in the MTD map code. As
> an example, an patch to add the 1024KiB area of
> static RAM on the VR1000 has also been attached
> 
> If people do not object, I will commit this to the
> CVS in a couple of days.

How is this different from slram/phram?  Both your description and the
code look awfully similar.

Jörn

-- 
Correctness comes second.
Features come third.
Performance comes last.
Maintainability is needed for all of them.
