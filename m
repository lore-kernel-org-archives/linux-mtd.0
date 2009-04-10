Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LsFp8-0003Tp-Tv
	for linux-mtd@lists.infradead.org; Fri, 10 Apr 2009 12:27:18 +0000
Subject: Re: ubifs error when do bonnie++ test
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jason Liu <liu.h.jason@gmail.com>
In-Reply-To: <e8775dd00904020249k6dd1146chfae6e74c11a01f82@mail.gmail.com>
References: <e8775dd00904012244o30200226p4e748d89d2a9b9c7@mail.gmail.com>
	<49D47252.3020701@nokia.com>
	<e8775dd00904020249k6dd1146chfae6e74c11a01f82@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Apr 2009 15:27:01 +0300
Message-Id: <1239366421.3390.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-02 at 17:49 +0800, Jason Liu wrote:
> 2009/4/2 Adrian Hunter <adrian.hunter@nokia.com>:
> > Jason Liu wrote:
> >>
> >> I'm working on the 2.6.26 with ubifs enabled, but after some stress
> >> test, ubifs give some err. The following is the steps to reproduce.
> >
> > Please apply all recent UBIFS patches and enable debugging and try
> > again.
> >
> > You could also enable debugging checks, but that will really slow it down.
> >
> >
> After apply all the patches from users/dedekind/ubifs-v2.6.26.git
> I still get errors with bonnie++ test and only run 3times compared 390
> times without the patch
> 
> Using uid:0, gid:0.
> Writing with putc()...done
> Writing intelligently...done
> Rewriting...done
> Reading with getc()...done
> Reading intelligently...done
> start 'em...done...done...done...
> Create files in sequential order...done.
> Stat files in sequential order...Expected 16384 files but only got 16385
> Cleaning up test directory after error.

So have you tried to enable UBIFS extra checks?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
