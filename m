Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjFJD-0004Ce-H9
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 09:55:57 -0400
Date: Wed, 2 May 2007 15:51:33 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 wrong data CRC message
Message-ID: <20070502135133.GC20776@lazybastard.org>
References: <46385786.5020804@nokia.com>
	<1178108604.2875.182.camel@pmac.infradead.org>
	<46388BF9.4060807@nokia.com>
	<1178111184.2875.185.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1178111184.2875.185.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 May 2007 14:06:24 +0100, David Woodhouse wrote:
> On Wed, 2007-05-02 at 16:02 +0300, Adrian Hunter wrote:
> > Unfortunately I started with an empty flash and have not rebooted at all.
> > 
> > I've been running stress tests constantly for about a week, and this is
> > the only JFFS2 message.  The tests do unmount and remount, but there are
> > no error messages.
> > 
> > So unless you can offer an alternative explanation I am going to have to
> > assume it is an error.
> 
> That's certainly possible -- and in fact is why I've resisted the
> persistent requests _not_ to print that message.

You could add a new node type to mark "safe" crc errors.  Something
roughly like this:
- Print error for crc errors, unless the next node in eraseblock is a
  "known crc error" node.
- Write "known crc error" node on mount for any node that is the last in
  an eraseblock if there still is enough room to write further data.

That should be able to eliminate most false positive.  If you care.

Jörn

-- 
The wise man seeks everything in himself; the ignorant man tries to get
everything from somebody else.
-- unknown
