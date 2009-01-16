Received: from outbox.allstream.net ([207.245.244.41])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LNwCK-000428-CC
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 21:25:50 +0000
Subject: Re: Writing a ubinize'd image to fresh NANDFlash with a burner
From: Pontus Hedman <pontushedman@navcast.com>
To: dedekind@infradead.org
In-Reply-To: <1231936649.5973.57.camel@localhost.localdomain>
References: <1231433726.16113.8.camel@phedman.navcastinc.local>
	<1231857915.5973.18.camel@localhost.localdomain>
	<1231872781.16881.47.camel@phedman.navcastinc.local>
	<1231936649.5973.57.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 16 Jan 2009 16:25:45 -0500
Message-Id: <1232141145.8788.7.camel@phedman.navcastinc.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-01-14 at 14:37 +0200, Artem Bityutskiy wrote:
> On Tue, 2009-01-13 at 13:53 -0500, Pontus Hedman wrote:
> > I think all I have to do is insert 64 bytes of OOB data every 2048 bytes
> > in that image to make it compliant.  So I guess I would make that OOB
> > data be all 0xFFs so that the flash OOB parts are left alone?
> 
> Probably. You may easily add one more ubinize command line option which
> would make it put OOB data to the output image, just like you
> described. 

Ok, thanks for the reassurance.  Since we have other (non-ubifs) binary
hunks that also need to have this done, it's easier for me to just write
a single program that stuffs the 64 byte OOBs into all of them.

Just by the way, we were using jffs2 before.  UBIFS is quite an
improvement!

Thanks again for your help,
-- 
Pontus Hedman
Navcast
