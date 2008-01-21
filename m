Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JGz3Z-0003y2-4F
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2008 15:59:36 +0000
Message-ID: <4794C107.7070600@parrot.com>
Date: Mon, 21 Jan 2008 16:57:59 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<479073D1.5010406@parrot.com>
	<20080118064852.026b0c82@zod.rchland.ibm.com>
	<4790D11E.6060201@parrot.com>
	<20080118115531.2deef9fb@zod.rchland.ibm.com>
	<20080118181744.GA15039@lazybastard.org>
In-Reply-To: <20080118181744.GA15039@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Josh Boyer <jwboyer@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Jörn Engel wrote:
> On Fri, 18 January 2008 11:55:31 -0600, Josh Boyer wrote:
>> That seems consistent with JFFS2 doing the CRC checks and constructing
>> the in-memory representation of your large file.  I suspect the older
>> list-based in-memory implementation would have taken even longer, but
>> there could be something amiss with the rb-tree stuff perhaps.
> 
> There is something conceptually amiss with rb-trees.  Each node
> effectively occupies its own cacheline.  With those 40k+ nodes, you
> would need a rather sizeable cache with at least 20k cachelines to have
> an impact.  Noone does.  So for all practical purposes, every single
> lookup will go to main memory.
> 
> Maybe it is about time to suggest trying logfs?
What's the status of logfs on NAND ?

Last time I check, it didn't manage badblock.


Matthieu
