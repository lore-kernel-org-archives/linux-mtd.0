Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bLID-00047D-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 12:47:17 +0000
Date: Thu, 14 Feb 2002 13:58:25 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: patch for 64 bit wide flash
Message-ID: <20020214135825.D26200@wohnheim.fh-wedel.de>
References: <20020214133223.A26200@wohnheim.fh-wedel.de> <3C1FD0DD.9A4F2CC8@comdev.cc> <20020214133223.A26200@wohnheim.fh-wedel.de> <9375.1013690304@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9375.1013690304@redhat.com>; from dwmw2@infradead.org on Thu, Feb 14, 2002 at 12:38:24PM +0000
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

Hi!

> I fixed this yesterday, for most people at least. The 64-bit stuff was being
> included even if you didn't explicitly turn it on. Now you do have to turn 
> it on - and if you do, you're expected to provide a read64/write64 that 
> works somehow.

You are incredible! Solving a problem, before it gets reported! :-)

Jörn

-- 
Any tool should be useful in the expected way, but a truly great tool
lends itself to uses you never expected.
-- Eric Raymond in "The cathedral and the bazaar"
