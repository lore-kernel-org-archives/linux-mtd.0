Received: from av2-1-sn3.vrr.skanova.net ([81.228.9.107])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSErZ-0005Wh-8M
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2004 08:19:48 -0500
From: "Per Hedblom" <per.hedblom@abem.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
	"'Mark Hamilton'" <mhamilton@alliantnetworks.com>
Date: Thu, 11 Nov 2004 14:19:29 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1100172461.8191.1369.camel@hades.cambridge.redhat.com>
Message-Id: <20041111131932.D32EF3800F@smtp1-2-sn3.vrr.skanova.net>
Cc: linux-mtd@lists.infradead.org
Subject: RE: [JFFS2] GC patch for eCos port
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 11 November 2004 12:28 David Woodhouse Wrote
>Yes, that is the expected behaviour and looks like the correct fix. I've
>just committed the corresponding change to the eCos version of
>jffs2_gc_fetch_page().

Will this code handle files larger than PAGE_SIZE?
I believe the patch for ecos should look like:
{
        /* FIXME: This works only with one file system mounted at a time */
        int ret;

        ret = jffs2_read_inode_range(c, f, gc_buffer, offset,
PAGE_CACHE_SIZE);
        if (ret)
                return ERR_PTR(ret);

        return gc_buffer - ( offset & ( PAGE_CACHE_SIZE - 1 ) );
}

if you want to do it in fs-ecos.c. (This works in our test case but I think
I prefer the original patch suggested by Mark for readbility.)



>The eCos port could definitely do with some love 

I agree, it is hard to believe that anyone can successfully use the jffs2
file system as a general file system in eCos.

Some experience with jffs2 for eCos so far: 
* it requires a lot of software maintenance to keep it updated and tested
for the a specific usage in eCos.
 
* it uses a lot of memory and memory management - a eCos system without
memory management needs fixed memory pools to run stable for a long time. 
We use a lot of small files and if someone is considering jffs2 for a new
design I would recommend reserving a ram space for jffs2 that is in the
range of the flash area in use.

* it doesn't do gc as a thread in eCos. This means that it almost always
want to do gc at the time when you need to write data.


Tanks,
Per Hedblom
