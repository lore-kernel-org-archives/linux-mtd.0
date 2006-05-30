Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl9aa-0005QL-Q3
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 15:09:21 -0400
Date: Tue, 30 May 2006 21:09:12 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060530190912.GH26220@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<20060530185017.GG26220@wohnheim.fh-wedel.de>
	<1149015135.849.0.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1149015135.849.0.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 May 2006 19:52:15 +0100, David Woodhouse wrote:
> On Tue, 2006-05-30 at 20:50 +0200, Jörn Engel wrote:
> > Step 3b:
> > Remove the OOB erasemarkers and move them in-band, just as for the
> > other types.
> 
> And waste a whole page for the cleanmarkers instead of putting them in
> the OOB area? No.

Did you notice 3a?  Double-page-write allows you to write to pages
more than once.

Plus, there is the long-term solution as well.  Jffs2 can write the
information anywhere, not just into the same physical eraseblock.  For
logfs, I will store that information in a special file.  JFFS2 doesn't
even need a special file but can introduce a new node type.  Basically
an erase marker for a _different_ erase block, with some versioning to
make sure it doesn't get deleted (through GC) before the erased block
is used.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
