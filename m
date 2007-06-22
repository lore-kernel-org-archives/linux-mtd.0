Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1hnx-0003uR-N5
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 08:00:01 -0400
Date: Fri, 22 Jun 2007 13:54:55 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: Real-time flash simulator
Message-ID: <20070622115455.GE17988@lazybastard.org>
References: <467B77F7.2000007@informatik.tu-chemnitz.de>
	<1182499773.4403.76.camel@sauron>
	<467B952E.30308@informatik.tu-chemnitz.de>
	<20070622093945.GC17988@lazybastard.org>
	<467BA051.50202@informatik.tu-chemnitz.de>
	<20070622102444.GD17988@lazybastard.org>
	<1182509994.4403.81.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1182509994.4403.81.camel@sauron>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	Martin =?utf-8?Q?D=C3=A4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 June 2007 13:59:54 +0300, Artem Bityutskiy wrote:
> > 
> > Sounds just like FAT on smartmedia.  Worst case latency is both
> > deterministic and low.  Random writes of small blocks are also
> > prohibitively slow.  Works great when writing few large files, like jpg
> > images in digital cameras.
> 
> It is about EB mappings, not FTL.

EB mapping is all smartmedia does.

Jörn

-- 
Joern's library part 3:
http://inst.eecs.berkeley.edu/~cs152/fa05/handouts/clark-test.pdf
