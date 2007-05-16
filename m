Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoJ12-0008SP-Rk
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 08:54:16 -0400
Date: Wed, 16 May 2007 14:49:33 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516124933.GF5472@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<17994.1241.436841.681216@stoffel.org>
	<20070515191926.GB1220@lazybastard.org>
	<1179291255.2859.195.camel@shinybook.infradead.org>
	<20070516110933.GA5472@lazybastard.org>
	<20070516113434.GC20482@mail.shareable.org>
	<1179315498.3642.19.camel@sauron>
	<20070516122548.GA25239@mail.shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070516122548.GA25239@mail.shareable.org>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Greg KH <greg@kroah.com>, John Stoffel <john@stoffel.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Albert Cahalan <acahalan@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 May 2007 13:25:48 +0100, Jamie Lokier wrote:
> 
> Is LogFS really slower than JFFS2 in practice?

Not sure.  I ran a benchmark before adding compression support in QEMU
with a lightning-fast device.  So the results should differ quite a bit
from practice.

http://logfs.org/~joern/logfs/benchmark/benchmark_overview

LogFS was actually faster than JFFS2.  So for that particular
unrealistic benchmark, updating the LogFS tree was less expensive than
trying (and failing) to compress and calculating the CRC was for JFFS2.

With compression finished, I would expect LogFS numbers to degrade.  If
file data had checksums (not done yet, should be optional for users to
decide) even more so.

> I would have guessed reads to be a similar speed, tree updates to be a
> similar speed  to journal  updates for sustained  non-fsyncing writes,
> and the difference unimportant for tiny individual commits whose index
> updates are not merged with any other.  I've not thought about it much
> though.

LogFS isn't that good yet.  Right now, writing 10 adjacent blocks to a
file requires 10 tree updates instead of 1.  Not full updates though,
just up to the inode.

Quite surprisingly, read speed in the benchmark was significantly better
for LogFS, even after substracting mount time.  I don't know if all of
that can be explained with CRC checks or there is more to it.

Jörn

-- 
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000
