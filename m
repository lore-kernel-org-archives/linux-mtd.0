Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sO2y-0006sq-Aj
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 15:46:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: John Hall <john-news1@cambridgetechgroup.com>
In-Reply-To: <9bb.3f4e10e8.4a743@irwin2.crw.uk.net>
References: <6306.3f4dd070.667ee@irwin2.crw.uk.net>
	 <1062066193.8465.1571.camel@hades.cambridge.redhat.com>
	 <696f.3f4dd944.a899d@irwin2.crw.uk.net>
	 <1062070043.8465.1615.camel@hades.cambridge.redhat.com>
	 <414.3f4e0a87.b6729@irwin2.crw.uk.net>
	 <1062080106.12122.1.camel@hades.cambridge.redhat.com>
	 <9bb.3f4e10e8.4a743@irwin2.crw.uk.net>
Message-Id: <1062081982.12122.21.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 28 Aug 2003 15:46:23 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Lost space on JFFS2 partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-28 at 15:25 +0100, John Hall wrote:
> 2.4.18 is considered ancient? :(

March 2002? Yes, that's ancient.

> I've discovered the backward-compat stuff - seems to mainly be 'BUG_ON'
> and 'likely'. I did get some compiler warnings about %z in printf
> strings - is this just gcc 2.95.3 not being aware of them?

Get lib/vsprintf.c from a current kernel; that kernel doesn't grok %z
either. Then the warning from gcc is a harmless false positive.

> I found this in the archives:
> "Just replace jffs2_{de,}compress() with NOPs. Return zero from
> jffs2_compress()", which seems to be more of a hack...

Yeah -- I want to make it a per-file and/or per-directory ioctl to
disable compression, but haven't got round to it yet.

-- 
dwmw2
