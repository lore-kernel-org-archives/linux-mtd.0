Received: from ptb-relay03.plus.net ([212.159.14.214])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1ChDQC-0005JC-33
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 15:49:28 -0500
In-Reply-To: <1f9886eb04122212431223a508@mail.gmail.com>
References: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
	<Pine.LNX.4.58.0412221328430.23254@phoenix.infradead.org>
	<20041222140331.GG31282@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221442510.30556@phoenix.infradead.org>
	<20041222151403.GA8943@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221522400.30689@phoenix.infradead.org>
	<1f9886eb041222122244c01216@mail.gmail.com>
	<1f9886eb04122212431223a508@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <F522C620-545A-11D9-8375-0030656C90F6@linuxgrrls.org>
Content-Transfer-Encoding: 7bit
From: Jasmine Strong <jasmine@linuxgrrls.org>
Date: Wed, 22 Dec 2004 20:49:22 +0000
To: xemc <xemcnet@gmail.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 22 Dec 2004, at 20:43, xemc wrote:

> LH7A400

Sadly this is only an ARM9TDMI core and so misses out on the
(substantial) benefits that the extra instructions in the 9EJ and
11J architectures confer on such routines.  Packed arithmetic
makes a huge difference to CRC16.

I've been meaning to write some ARM SIMD routines for
checksumming; if I can get permission to release them, I'll let you
know.  (My employer is a bit paranoid...)

-J.
