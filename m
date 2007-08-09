Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJFPm-0004Ck-Ma
	for linux-mtd@lists.infradead.org; Thu, 09 Aug 2007 17:19:33 -0400
Date: Thu, 9 Aug 2007 22:03:16 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch 02/18] include/linux/logfs.h
Message-ID: <20070809200315.GC9036@lazybastard.org>
References: <20070808161234.GB15319@lazybastard.org>
	<20070808161428.GD15319@lazybastard.org>
	<200708090056.30350.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200708090056.30350.arnd@arndb.de>
Cc: akpm@osdl.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 9 August 2007 00:56:29 +0200, Arnd Bergmann wrote:
> On Wednesday 08 August 2007, Jörn Engel wrote:
> > +++ linux-2.6.21logfs/include/linux/logfs.h     2007-08-08 02:57:37.000000000 +0200
> > @@ -0,0 +1,500 @@
> > +/*
> > + * fs/logfs/logfs.h
> > + *
> 
> The comment does not match the file name. Better remove the file names
> entirely from introduction comments.

Maybe.  This file needs to get moved again anyway.

Jörn

-- 
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it.
-- Brian W. Kernighan
