Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ES0nD-0002TG-Hh
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 19:22:55 -0400
Date: Wed, 19 Oct 2005 01:22:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Paul Webster <pjwebster@gmail.com>
Message-ID: <20051018232238.GA20236@wohnheim.fh-wedel.de>
References: <dc98d8d90510171653r4b0e193bi9fd066ff8aefb752@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc98d8d90510171653r4b0e193bi9fd066ff8aefb752@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Definition of MTD's
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 October 2005 09:53:43 +1000, Paul Webster wrote:
> 
> I was wondering what type of devices fall under the category of an mtd
> rather than block device or char device? Are mtd's non-removable
> media? I understand that USB flash disks and built in CompactFlash
> card readers are not mtd's but what about devices such as built in
> MemoryStick, SD, XD, MMC and SmartCard readers?

http://www.linux-mtd.infradead.org/faq/general.html

mtd's can be either removable or not.  Generally, mtd is just a
different abstraction than char or block devices and better suited for
flash than the other two.  Any device can be represented as an mtd.
Whether it actually makes sense is a different matter.

Jörn

-- 
When in doubt, punt.  When somebody actually complains, go back and fix it...
The 90% solution is a good thing.
-- Rob Landley
