Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187jwA-0006Ub-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2002 22:06:42 +0000
Date: Fri, 1 Nov 2002 23:36:15 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Eugene Surovegin <ebs@innocent.com>
Cc: Anders Olsson <Anders.Olsson@matchpointds.com>,
   linux-mtd@lists.infradead.org
Subject: Re: MTD devices at the wrong place
Message-ID: <20021101223615.GA12891@wohnheim.fh-wedel.de>
References: <1036137508.26545.46.camel@Europa.matchpointds> <5.1.0.14.2.20021101002546.03b61038@pop.prodigy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5.1.0.14.2.20021101002546.03b61038@pop.prodigy.net>
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

On Fri, 1 November 2002 00:28:22 -0800, Eugene Surovegin wrote:
> At 11:58 PM 10/31/2002, you wrote:
> 
> >##I guess it's ok to just create one device? or do I have to create them
> >all? Or a directory structure under /dev/mtd0 and /dev/mtd1
> >mknod /dev/mtd4 c 90 4
> 
> /dev/mtd4 should be c 90 8

Correction:
/dev/mtd4 *should be* c 90 4, but for historical reasons, it is c 90 8.

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
