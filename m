Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HWAPW-0000mS-Em
	for linux-mtd@lists.infradead.org; Tue, 27 Mar 2007 13:04:23 +0100
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2RC4LKk008373
	for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2007 08:04:21 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2RC4K79047902
	for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2007 06:04:20 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2RC4KTj007267
	for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2007 06:04:20 -0600
Subject: Re: [PATCH] Speed up mount for cfi_cmdset_0001 users
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
In-Reply-To: <20070327115422.GB27290@lazybastard.org>
References: <1174995841.26465.431.camel@gentoo-jocke.transmode.se>
	<1174996173.26465.433.camel@gentoo-jocke.transmode.se>
	<20070327115422.GB27290@lazybastard.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 27 Mar 2007 07:04:13 -0500
Message-Id: <1174997053.7553.0.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2007-03-27 at 13:54 +0200, Jörn Engel wrote:
> On Tue, 27 March 2007 13:49:33 +0200, Joakim Tjernlund wrote:
> > On Tue, 2007-03-27 at 13:44 +0200, Joakim Tjernlund wrote:
> > > This will speed up mount greatly for users of point/unpoint method
> > > like cfi_cmdset_0001. Please Apply.
> > > 
> > >  Jocke
> > 
> > Some feedback from the community would not hurt either...
> 
> JFFS2 mount time on OLPC: ~3300ms
> LogFS mount time on OLPC: ~60ms
> 
> While your works seems useful, pardon me if I don't care too much about
> JFFS2 anymore. ;)

Then you shouldn't respond to emails asking for feedback on it.

josh
