Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GNxT-0004hq-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 17:23:15 +0000
Date: Tue, 18 Dec 2001 18:34:00 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Map driver usage
Message-ID: <20011218183400.A15564@wohnheim.fh-wedel.de>
References: <7139.1008691545@redhat.com> <Pine.LNX.4.21.0112181738560.2667-100000@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.21.0112181738560.2667-100000@dagobert.svc.sysgo.de>; from rob@sysgo.de on Tue, Dec 18, 2001 at 06:13:27PM +0100
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

> Yep. Only my problem here is, that I want some physically non-contiguous
> blocks to form a single MTD partition. Is that possible with the
> MTD partition API ?

You should have a look at Aleksander Sanochkin's code. He changed the
partitioning code to do exactly, what you need. But my guess is, that
this won't go into the development kernel for some month and might
never make it into 2.4.

He gave a quick overview in some mail to this list. Happy grepping.
:-)

Jörn

-- 
My Favorite IA64 Opcode-guess ( see arch/ia64/lib/memset.S )
"br.ret.spnt.few" - got back from getting beer, did not spend a lot.
