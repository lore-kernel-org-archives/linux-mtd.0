Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Crznq-0008U4-Dh
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 09:30:25 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0LEUJ8S022204
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jan 2005 09:30:19 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0LEUJDW277566
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jan 2005 09:30:19 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0LEUJZU016203
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jan 2005 09:30:19 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050120173341.GA24657@wohnheim.fh-wedel.de>
References: <20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<20050120143525.GA18170@wohnheim.fh-wedel.de>
	<1106233518.2903.15.camel@sauron.oktetlabs.ru>
	<20050120152736.GA20639@wohnheim.fh-wedel.de>
	<1106235461.2903.25.camel@sauron.oktetlabs.ru>
	<20050120161306.GG20639@wohnheim.fh-wedel.de>
	<1106238673.7940.0.camel@sauron.oktetlabs.ru>
	<20050120164153.GM20639@wohnheim.fh-wedel.de>
	<1106240903.7940.12.camel@sauron.oktetlabs.ru>
	<20050120173341.GA24657@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=
Message-Id: <1106317818.6524.7.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Fri, 21 Jan 2005 08:30:18 -0600
Content-Transfer-Encoding: 8bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-01-20 at 11:33, Jörn Engel wrote:
> > One more by the way, compression mode and whatever people implement in
> > xattr flags may go to that inode flags node.
> 
> Extended attributes can be arbitrary, so they should go somewhere
> else.  Basically, have a pseudo-directory for each inode and treat the
> inodes inside that pseudo-directory as extended attributes.  Similar
> to reiser4.  Didn't Josh plan to work in this area?

<Delayed reaction>

What I'd like to do and what time allows are two separate things :). 
And time will be in very short supply for me in a while.

I'd be happy to review anything in this area.  And if I do get some
time, I'll look into it as well.  But I wouldn't hold your breath.

You know what they say about best laid plans...

</Delayed reaction>

josh
