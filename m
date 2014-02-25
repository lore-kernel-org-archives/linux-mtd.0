Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIJyO-0005qZ-KI
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2014 15:31:09 +0000
Date: Tue, 25 Feb 2014 12:30:41 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v6 1/3] ubi: Introduce block devices for UBI volumes
Message-ID: <20140225153041.GB22740@localhost>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392581041-8099-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392633946.12215.150.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1392633946.12215.150.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 17, 2014 at 12:45:46PM +0200, Artem Bityutskiy wrote:
> On Sun, 2014-02-16 at 17:03 -0300, Ezequiel Garcia wrote:
> 
[..]
> > @@ -0,0 +1,660 @@
> > +/*
> > + * Copyright (c) 2014 Ezequiel Garcia
> > + * Copyright (c) 2011 Free Electrons
> 
> If you copy-pasted _any_ code from UBI, do not forget to add original
> copyrights here too. Otherwise, this is fine.
> 

Hm... after re-reading the code in detail, it's obvious I took the
parameter handling code from mtd/ubi/build.c. So I'll push a v8 with
this additional copyright notice:

"""
  Driver parameter handling strongly based on drivers/mtd/ubi/build.c

    Copyright (c) International Business Machines Corp., 2006
    Copyright (c) Nokia Corporation, 2007
    Authors: Artem Bityutskiy (Битюцкий Артём), Frank Haverkamp
"""
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
