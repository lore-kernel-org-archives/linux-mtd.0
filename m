Received: from blood.actrix.co.nz ([203.96.16.160])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CrKYU-0003xM-HE
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2005 13:27:48 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>,
	Jochen Karrer <j.karrer@lightmaze.com>
Date: Thu, 20 Jan 2005 07:34:06 +1300
References: <MKELJOLMMOHJCMIPKLJKAEBJCBAA.j.karrer@lightmaze.com>
	<Pine.LNX.4.58.0501191302470.8174@phoenix.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501191302470.8174@phoenix.infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050119182739.02A3F44AC@blood.actrix.co.nz>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mysqld on jffs2: MyISAM Index write is slow
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I expect it could help to add some caching to JFFS2 to handle stuff 
like this. I did something like this for YAFFS.

YAFFS supports a "short op" cache for handling reads and writes that are 
smaller than parts of a page (it is bypassed by all whole page read/writes).  
The cache has typically 10 page-size "slots".  The cache entries associated 
with a file get flushed whenever the file gets flushed, closed or pushed out 
by a new entry.

At first I only used this cache for WinCE and YAFFS direct and disabled this 
cache for Linux, thinking that the Linux cache would do the job better. 
However, the Linux cache is  write-through cache (ie does not cache writes). 
Enabling the cache improved short write performance dramatically. I expect it 
would in this case too.

The cache is quite simple so implementing a similar cache in JFFS2 would not 
be a big deal.

-- Charles


On Thursday 20 January 2005 02:03, Artem B. Bityuckiy wrote:
> Not expert in this issue, but I was told by David that JFFS2 is
> synchronous, and you need redesigning it if you want asynchronous
> behaviour.
>
> > Hi,
> > I am using mysqld on jffs2. Tables work fine, but as soon as
> > i am using indexes the writing of new entries becomes very slow.
> > I found that mysql is writing one 1024 byte block to the index file
> > of the MyISAM table (.MYI) for every new row. This is up to 20 times in
> > sequence
> > the same block. On non synchronous filesystems
> > this goes to a Buffer in RAM, but on jffs2 this causes many writes to
> > the flash. In my amdflash emulator I found that mysql writes about 180MB
> > to the flash
> > for a table of 13MB with 88000 rows.
> >
> > Is there a way to make jffs2 a little bit asynchronous ? Or does anybody
> > know
> > how to tell mysqld to write smaller blocks ? Mounting a reiser as
> > loopback from
> > a file on jffs2 does not work because jffs2 doesn't support mmap.
> >
> > Jochen
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
