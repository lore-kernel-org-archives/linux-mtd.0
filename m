Received: from linuxgrrls.org ([212.18.228.66] helo=mail.linuxgrrls.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cmw5v-0001j4-DD
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 10:32:08 -0500
Date: Fri, 7 Jan 2005 15:31:50 +0000 (GMT)
From: jasmine@linuxgrrls.org
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501071527190.13073@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.61.0501071531220.29077@hex.linuxgrrls.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>   
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>   
	<20041222160942.GC9783@wohnheim.fh-wedel.de>   
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>   
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<33370.192.168.0.2.1105109729.squirrel@192.168.0.2>
	<Pine.LNX.4.58.0501071519100.13073@phoenix.infradead.org>
	<Pine.LNX.4.61.0501071522160.28962@hex.linuxgrrls.org>
	<Pine.LNX.4.58.0501071527190.13073@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
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



On Fri, 7 Jan 2005, Artem B. Bityuckiy wrote:

> Ah, you meant the *code* should be cache-line aligned ?!?

Yes!  The data array starts on a 32-byte boundary already, does it not?

-J.
