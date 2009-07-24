Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUUMV-0002oR-OF
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 23:39:44 +0000
Date: Sat, 25 Jul 2009 00:39:36 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: UBIFS robustness questions
Message-ID: <20090724233936.GP27755@shareable.org>
References: <200907241600.54640.manningc2@actrix.gen.nz>
	<4A695819.7000705@nokia.com> <4A697DCC.2010302@nokia.com>
	<4A6986FC.6070006@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A6986FC.6070006@nokia.com>
Cc: Charles Manning <manningc2@actrix.gen.nz>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter wrote:
> Sorry to drag this out but it seems like it can be done with symlinks

That's right.  It should be powerfail safe.
Don't forget to "rm -fr version1" at the end :-)

However, if you are looking to use this for atomic update of a
directory while there are programs still running which use the
directory, it won't work.

You can't delete the old directory, because programs might still be
inside it...

It's not even always safe to kill and restart the programs after
renaming the symlink, because they might read some files from the new
directory before they've finished reading other files from the old
directory.

Regarding powerfail safety, it means you might have to defer deleting
the old directory until some major system action, like the next reboot.

-- Jamie
