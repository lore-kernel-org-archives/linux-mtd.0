Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MODYs-0004ws-EC
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 16:30:37 +0000
Subject: Re: [Patch] Support large devices for flash_eraseaal
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20090707162543.GB26579@logfs.org>
References: <20090707140337.GA24749@logfs.org>
	<20090707162231.GA26579@logfs.org> <20090707162543.GB26579@logfs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jul 2009 19:29:45 +0300
Message-Id: <1246984185.20721.329.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-07-07 at 18:25 +0200, Jörn Engel wrote:
> On Tue, 7 July 2009 18:22:32 +0200, Jörn Engel wrote:
> > 
> > +static int get_info(const char *devname, struct mtd_info_user64 *mtd64)
> > +static int do_erase(int fd, struct erase_info_user64 *ei64, struct mtd_info_user64 *mtd64)
> 
> Thinking about it, these two functions probably ought to go into a
> library of some sorts.  I just used flash_eraseall as a proof-of-concept
> test program, so my interest in this area is exhausted.  But maybe
> someone else feels young and energetic. :)

In ubi-utils I created libmtd library. It can be used in other
places as well.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
