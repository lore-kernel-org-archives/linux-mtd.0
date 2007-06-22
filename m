Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1gOe-0001lV-Fu
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 06:30:00 -0400
Date: Fri, 22 Jun 2007 12:24:44 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Martin =?utf-8?Q?D=C3=A4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
Subject: Re: Real-time flash simulator
Message-ID: <20070622102444.GD17988@lazybastard.org>
References: <467B77F7.2000007@informatik.tu-chemnitz.de>
	<1182499773.4403.76.camel@sauron>
	<467B952E.30308@informatik.tu-chemnitz.de>
	<20070622093945.GC17988@lazybastard.org>
	<467BA051.50202@informatik.tu-chemnitz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <467BA051.50202@informatik.tu-chemnitz.de>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 June 2007 12:11:29 +0200, Martin Däumler wrote:
> 
> that is right! The idea is to use a (not specified) file system which 
> performs in-place updates on top of this layer. This layer should map
> logical to physical erase units. So, wear-levelling possibly could be
> used to "displace" garbage collection. The goal is to decrase latency
> and above all make it more deterministic.

Sounds just like FAT on smartmedia.  Worst case latency is both
deterministic and low.  Random writes of small blocks are also
prohibitively slow.  Works great when writing few large files, like jpg
images in digital cameras.

> But please note that is just one theoretical idea to make a flash file
> system real-time capable. Indeed, other approaches and file systems like
> LogFS has to be investigated further for this purpose too.
> 
> It seems the development of a real-time flash file system is still in
> the fledgling stages, hence I asked here for a flash simulator to make
> work easier.

I guess the first thing you need to do is define what real-time actually
means.  In particular you need to define the following:
o Maximal latency for single read.
o Maximal latency for single write.
o Maximal throughput for reads.
o Maximal throughput for writes.
o Read behaviour (random bytes from random files, sequential, etc.)
o Write behaviour (dito)
o Acceptable rate of higher latency reads/writes.

Once you have this, it is possible to determine whether some storage
stack (filesystem, middle layers, hardware) can fulfill your
requirements, or how it would need to be changed to do so.

Alternatively you can go the other way and take a given storage stack,
trying to determine the characteristics of it.

Jörn

-- 
A quarrel is quickly settled when deserted by one party; there is
no battle unless there be two.
-- Seneca
