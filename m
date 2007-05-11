Received: from [149.6.83.202] (helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HmPPs-0003kZ-VF
	for linux-mtd@lists.infradead.org; Fri, 11 May 2007 03:19:55 -0400
Message-ID: <46441839.2020004@parrot.com>
Date: Fri, 11 May 2007 09:16:09 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: NAND flash write goes wrong
References: <200705102150.31171.borasah@gmail.com>	<Pine.LNX.4.64.0705110825530.3951@lnxricardw.se.axis.com>
	<1178866648.3643.7.camel@sauron>
In-Reply-To: <1178866648.3643.7.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Artem Bityutskiy a écrit :
> Just FYI,
> 
> we have recently fixed a bug in MTD which caused JFFS2 to mark good
> eraseblocks bad. It was caused by the mtdpart module. One had to have
> partitions to trigger this bug. The bug was that when JFFS2 wanted to
> mark eraseblock X within its partition as bad, mtdpart did not translate
> correctly to the _absolute_ number, but marked _absolute_ eraseblock
> number X as bad instead.
> 
> So basically, once one met a true bad eraseblock, JFFS2 started trying
> to mark it as bad, but marked other eraseblock as bad instead.
> 
> I'd recommend everybody to backport this fix.
> 
Could you give a link to your fix ?


Thanks

Matthieu
