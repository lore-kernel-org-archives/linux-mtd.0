Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MUUL-0002Ae-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2002 14:38:57 +0000
Date: Thu, 12 Dec 2002 16:09:29 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Tobias Otto-Adamczak <toa@indakom.de>
Cc: linux-mtd@lists.infradead.org, Geoffroy Stevenne <geof@hellea.com>
Subject: Re: bbram access problems
Message-ID: <20021212150929.GC29974@wohnheim.fh-wedel.de>
References: <20021212134542.GB29974@wohnheim.fh-wedel.de> <Pine.LNX.4.31.0212121456200.22502-100000@www.optixsoft.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.31.0212121456200.22502-100000@www.optixsoft.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 12 December 2002 15:09:11 +0100, Tobias Otto-Adamczak wrote:
> [joern's ignorance of braindead pc hardware removed]
> 
> Other question: does the slram driver map this area in when it is
> already covered by the kernel ?

To my knowledge, yes. The driver is unaware of linux memory management
and simply ioremaps physical memory. If the kernel already uses this
area, you are in trouble.
But I think to remember that for i386 architecture the first 1MB of
memory has special treatment. Might be worth a look.

Jörn

-- 
Fantasy is more important than knowlegde. Knowlegde is limited,
while fantasy embraces the whole world.
-- Albert Einstein
