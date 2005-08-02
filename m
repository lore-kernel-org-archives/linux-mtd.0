Received: from fallback.mail.ru ([194.67.57.14] helo=mx4.mail.ru)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DzxrD-0001b6-7k
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2005 10:35:14 -0400
Received: from f37.mail.ru (f37.mail.ru [194.67.57.75])
	by mx4.mail.ru (mPOP.Fallback_MX) with ESMTP id 3D02F3EF134
	for <linux-mtd@lists.infradead.org>;
	Tue,  2 Aug 2005 16:12:55 +0400 (MSD)
From: Timofey Kutergin <tkutergin@mail.ru>
To: J=?koi8-r?Q?=F6?=rn Engel <joern@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Date: Tue, 02 Aug 2005 16:12:25 +0400
In-Reply-To: <20050708193257.GA30728@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
Message-Id: <E1DzvdB-000DM2-00.tkutergin-mail-ru@f37.mail.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re[2]: working mphysmap.c
Reply-To: Timofey Kutergin <tkutergin@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No big deal. I think it may be useful for many people

-----Original Message-----
From: Jörn Engel <joern@wohnheim.fh-wedel.de>
To: Timofey Kutergin <tkutergin@mail.ru>
Date: Fri, 8 Jul 2005 21:32:57 +0200
Subject: Re: working mphysmap.c

> 
> On Wed, 22 June 2005 11:08:04 +0400, Timofey Kutergin wrote:
> > 
> > Attached is working mphysmap.c which can be configured via menuconfig (no commandline support). It uses existing Multiple CFI flash devices window.
> > In our system it successfully configured two independent flash devices
> 
> Thanks!  I'll have a look next week and add your changes to cvs.  Do
> you want a copyright line for your changes?
> 
> Jörn
> 
> -- 
> Rules of Optimization:
> Rule 1: Don't do it.
> Rule 2 (for experts only): Don't do it yet.
> -- M.A. Jackson 
> 
