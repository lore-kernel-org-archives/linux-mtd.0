Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dghtj-0006X7-U0
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2005 07:42:05 -0400
Date: Fri, 10 Jun 2005 13:41:26 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Caj Nordstrom <caj.nordstrom@beamex.com>
Message-ID: <20050610114126.GB29546@wohnheim.fh-wedel.de>
References: <1118391398.12760.3.camel@cen_linux.beamex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1118391398.12760.3.camel@cen_linux.beamex.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 space behavior when adding data to a file
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 10 June 2005 11:16:37 +0300, Caj Nordstrom wrote:
> 
> I have found a strange behavior for space usage when adding small data
> to an existing file. In my test I have used Intel/STM Nor flash with
> several mtd versions and currently mtd-snapshot-20050516.tar.bz2. The
> processor environment is arm7.
> 
> The problem is that far too much space is used when adding data a little
> at a time to a file. In my tests done with the included test program the
> results are the following when df shows around 1.4M free space at start.
> 
> 115k in each file for WITH_FLUSH or WITH_OPEN_CLOSE enabled
> 350k in each file without the options.
> 
> When coping directly the 115k file there are space for 162 files!!!!
> Totally around 18M data compared to 575k WITH_FLUSH.
> 
> Is this a known feature or bug?

Hmm.  This is pretty much expected behaviour.  Not wanted, but at
least expected.

Basically, jffs2 much more efficient when writing data in large
chunks.

Case 1: 4096 writes appending a single byte to a file.
Jffs2 will write a struct jffs2_raw_inode for each individual write,
containing the full header plus a single byte.  That should be
4096 * (68+1) = 282624 bytes in total.

Case 2: A single aligned write of 4096 bytes.
Jffs2 will compress the data, gaining maybe 50% by that.  It will
write a struct jffs2_raw_inode plus the compressed data.  That should
be 68 + (4096 * 50%) = 2116 bytes.

So, depending on compression ratio, case 2 will be about 100 times
more efficient than case 1.

For completeness, you write in chunks of about 20 bytes.  So here goes
Case 3: 204 writes of 20 bytes each.
Jffs2 will compress the data.  Short amount of data usually don't
compress well, but let's still assume we save 50%.  Adding the
headers, we get 204 * (68+10) = 15912 bytes.

So your testcase will be 8 times less efficient than aligned writes of
4096 bytes.

Jörn

-- 
Unless something dramatically changes, by 2015 we'll be largely
wondering what all the fuss surrounding Linux was really about.
-- Rob Enderle
