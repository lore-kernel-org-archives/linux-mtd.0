Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cona0-0007N7-B7
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 13:50:53 -0500
Date: Wed, 12 Jan 2005 19:50:27 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050112185027.GN25638@wohnheim.fh-wedel.de>
References: <41E4D6E5.1090407@imc-berlin.de> <41E4EDBE.8070302@inf.u-szeged.hu>
	<41E52EAD.2090302@imc-berlin.de>
	<Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
	<20050112182638.GK25638@wohnheim.fh-wedel.de>
	<1105555410.3896.34.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105555410.3896.34.camel@weaponx.rchland.ibm.com>
Cc: Steven Scholz <steven.scholz@imc-berlin.de>, linux-mtd@lists.infradead.org
Subject: Re: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 January 2005 12:43:30 -0600, Josh Boyer wrote:
> 
> I've seen them fail.  Multiple times.  And yes, the CRCs detected it and
> helped me figure out that the hardware was borked.

Ok, Empiria has spoken, I stand corrected.

> You may be right that failures are rare, and when they do occur the
> flash definitely needs to be replaced.  But I'd much rather debug a card
> that had CRC errors than one that just had apps mysteriously getting
> SIGILL because a bit flipped and the filesystem didn't bother to verify
> the data before using it.

Agreed.  So we still need checksums, and have the type of checksums
left to argue about.

Jörn

-- 
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
