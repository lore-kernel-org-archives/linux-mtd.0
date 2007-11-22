Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IvCg2-000097-E1
	for linux-mtd@lists.infradead.org; Thu, 22 Nov 2007 09:05:16 -0500
Date: Thu, 22 Nov 2007 14:26:50 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
Message-ID: <20071122132650.GA27525@lazybastard.org>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
	<20071121213257.GI20871@lazybastard.org>
	<305035a40711211433x9054a11r11636ad708a325cd@mail.gmail.com>
	<20071121225425.GA24327@lazybastard.org>
	<Pine.LNX.4.64.0711220858190.523@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0711220858190.523@lnxricardw.se.axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 November 2007 08:58:58 +0100, Ricard Wanderlof wrote:
> On Wed, 21 Nov 2007, Jörn Engel wrote:
> 
> >> If data is corrupted between tow read even journalized are log file
> >> system will loose data.
> >> Either there is a mechanism I missed in this file system or 2 bits
> >> flipped are so rare that this event can be ignored.
> >
> > It means that NAND needs scrubbing.
> 
> By 'scrubbing' do you mean erasing the blocks in question and rewriting 
> them with the same data in order to put fresh data back in the bit cells?

Please don't reply to the list only.  If you are asking me a question,
it is really impolite to send it elsewhere.  And I bet others would like
to stay on Cc: as well.

http://en.wikipedia.org/wiki/Memory_scrubbing

Trivial scrubbing could leave the block in an erased or
partially-written state if power-loss occurs at an inconvenient time.
So scrubbing should be performed in some higher layer like an FTL, a
filesystem, system maintenance applications, etc.

Jörn

-- 
Science is like sex: sometimes something useful comes out,
but that is not the reason we are doing it.
-- Richard Feynman
