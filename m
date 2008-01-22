Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHExt-0006eO-0W
	for linux-mtd@lists.infradead.org; Tue, 22 Jan 2008 08:58:48 +0000
Message-ID: <4795AFE3.506@parrot.com>
Date: Tue, 22 Jan 2008 09:57:07 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
References: <20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<479073D1.5010406@parrot.com>
	<20080118064852.026b0c82@zod.rchland.ibm.com>
	<4790D11E.6060201@parrot.com>
	<20080118115531.2deef9fb@zod.rchland.ibm.com>
	<20080118181744.GA15039@lazybastard.org>
	<4794C107.7070600@parrot.com>
	<20080121212555.GA14472@lazybastard.org>
	<20080121161612.3ca2f093@zod.rchland.ibm.com>
	<20080121222952.GC14472@lazybastard.org>
In-Reply-To: <20080121222952.GC14472@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Mon, 21 January 2008 16:16:12 -0600, Josh Boyer wrote:
>> Wait... you're writing a flash filesystem that doesn't really deal with
>> bad blocks?
> 
> I never said that.  Like any other new piece of code, logfs has bugs.
> Plain and simple.  And having blocks rot underneith you is something I
> don't have automated tests for, so don't be surprised to find bugs in
> this area.
On mtd->read I have see no checking for EBADMSG or EUCLEAN.
There no call to mtd->block_markbad or mtd->block_isbad (it is only 
called in mtd_find_sb).

So I don't see how this can work on NAND flash.


Good test could be to add bad block simulation to nandsim.
There is some patch  for this 
(http://lists.infradead.org/pipermail/linux-mtd/2006-December/017107.html). 
Note they don't simulate bit-flip on read.


Matthieu
