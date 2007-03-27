Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HWAaW-000602-Aq
	for linux-mtd@lists.infradead.org; Tue, 27 Mar 2007 08:15:47 -0400
Date: Tue, 27 Mar 2007 14:12:07 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [PATCH] Speed up mount for cfi_cmdset_0001 users
Message-ID: <20070327121206.GC27290@lazybastard.org>
References: <1174995841.26465.431.camel@gentoo-jocke.transmode.se>
	<1174996173.26465.433.camel@gentoo-jocke.transmode.se>
	<20070327115422.GB27290@lazybastard.org>
	<1174997053.7553.0.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1174997053.7553.0.camel@zod.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 March 2007 07:04:13 -0500, Josh Boyer wrote:
> On Tue, 2007-03-27 at 13:54 +0200, Jörn Engel wrote:
> > 
> > While your works seems useful, pardon me if I don't care too much about
> > JFFS2 anymore. ;)
> 
> Then you shouldn't respond to emails asking for feedback on it.

Unless Joakim is interested in an alternative to his work.  I don't know
whether LogFS could be useful to his current or any future projects.

Take a look at logfs.org/logfs/patches and decide for yourself.  Mount
time has been a non-issue for a long time.  Other problems still exist.
If you want something production-ready now, keep using JFFS2.

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
