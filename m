Received: from wproxy.gmail.com ([64.233.184.201])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cs7Ls-0003Zs-Hy
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 17:34:01 -0500
Received: by wproxy.gmail.com with SMTP id 36so47158wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Jan 2005 14:33:57 -0800 (PST)
Message-ID: <6934efce05012114333793db8f@mail.gmail.com>
Date: Fri, 21 Jan 2005 14:33:57 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050120143525.GA18170@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<20050120143525.GA18170@wohnheim.fh-wedel.de>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> a) Never generate checksums.
> b) Always generate checksums, but never check them.
> 
> Strategy b) sounds pretty stupid, but it optimizes the 90% case - read
> - and allows the user to remount the filesystem to switch to PARANOID
> mode.  So, we could go as you proposed, we could settle for either a)
> or b) or we could allow both.  In that case I'd call a) the SLOPPY
> case and b) the RELAXED, just to distinguish things.
> 
> Which one makes most sense?

Allowing for both makes the most sense.  Keep in mind that most other
filesystems aren't nearly as paranoid as JFFS2.
