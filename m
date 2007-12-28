Received: from pasmtpa.tele.dk ([80.160.77.114])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J8BZf-0006JK-97
	for linux-mtd@lists.infradead.org; Fri, 28 Dec 2007 09:32:23 +0000
Date: Fri, 28 Dec 2007 10:32:13 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: May I received a UBIFS sourcecode based on kernel 2.6.22?
Message-ID: <20071228093213.GA2220@uranus.ravnborg.org>
References: <bae050c10712271727p133ca598x8440d5b82c4bc0ac@mail.gmail.com>
	<20071228032745.GA1232@old.davidb.org>
	<bae050c10712272233n3f0b894aka1408d8c22e9925a@mail.gmail.com>
	<bae050c10712272248ib8642c8ia50b7a0c99102880@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bae050c10712272248ib8642c8ia50b7a0c99102880@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 28, 2007 at 02:48:19PM +0800, Nancy wrote:
> [yrtan@st ubifs-olpc-2.6]$ git checkout -b stable-ubifs master/stable-ubifs
> git: warning: invalid extra options ignored
> 
> GNU Interactive Tools 4.3.20 (i686-pc-linux-gnu), 14:03:33 Dec 28 2007
> GIT is free software; you can redistribute it and/or modify it under the
> terms of the GNU General Public License as published by the Free Software
> Foundation; either version 2, or (at your option) any later version.
> Copyright (C) 1993-1999 Free Software Foundation, Inc.
> Written by Tudor Hulubei and Andrei Pitis, Bucharest, Romania
> 
> git: can't find the 'cl' terminal capability.
> git: can't find the 'cm' terminal capability.
> git: 2 errors. Your terminal is too dumb :-< .
> 
> 
> what's wrong again???

You are using the wrong git binary.
There is git the SCM and git the GNU Interactive Tools.

And you have the latter first in your PATH.

	Sam
