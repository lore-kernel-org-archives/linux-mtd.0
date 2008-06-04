Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3mKh-0006L9-CD
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 06:18:51 +0000
Date: Wed, 4 Jun 2008 08:18:41 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: big flash disks?
Message-ID: <20080604061841.GA6492@logfs.org>
References: <20080601184239.GA11135@shareable.org>
	<20080602072842.GB19219@logfs.org>
	<20080602104106.GC31032@shareable.org>
	<20080602114339.GB21359@logfs.org>
	<20080602124822.GB2679@shareable.org>
	<20080603181226.GF1224@logfs.org>
	<20080603185659.GB6899@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080603185659.GB6899@shareable.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 3 June 2008 19:56:59 +0100, Jamie Lokier wrote:
> 
> If that's the logfs journal - why would extra static tree depth near
> the root add any write-commit overhead as you said in the grandparent
> post? :-)

Because I only do it for the root of the tree, as of today.

> (Btw, I thought a difference between logfs and ubifs is the latter
> does async writes?  Or do they both?)

Logfs does async writes for metadata, not for payload data.  That is
enough to get close to jffs2 write performance.  For long streaming
writes it should perform identical to ubifs, short bursts look faster in
ubifs, as the data only goes to cache, not to flash.  Frequent rewrites
of the same data without sync in between are where ubifs currently wins.

Jörn

-- 
It does not require a majority to prevail, but rather an irate,
tireless minority keen to set brush fires in people's minds.
-- Samuel Adams
