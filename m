Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JH5FL-0008Nu-Hw
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2008 22:36:09 +0000
Date: Mon, 21 Jan 2008 23:29:52 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080121222952.GC14472@lazybastard.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080121161612.3ca2f093@zod.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 21 January 2008 16:16:12 -0600, Josh Boyer wrote:
> 
> Wait... you're writing a flash filesystem that doesn't really deal with
> bad blocks?

I never said that.  Like any other new piece of code, logfs has bugs.
Plain and simple.  And having blocks rot underneith you is something I
don't have automated tests for, so don't be surprised to find bugs in
this area.

If you send a patch or a nice test setup or even just a bug report, the
chances of getting those bugs fixed improve.

Jörn

-- 
One of my most productive days was throwing away 1000 lines of code.
-- Ken Thompson.
