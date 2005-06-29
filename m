Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DnWEW-00039e-0T
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2005 02:39:41 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050628T205336-2@post.gmane.org>
References: <200506271409.42449.charles.tilbury@comcast.net>
	<200506280941.14702.charles.tilbury@comcast.net>
	<1119983460.12240.22.camel@hades.cambridge.redhat.com>
	<200506281157.39708.charles.tilbury@comcast.net>
	<loom.20050628T205336-2@post.gmane.org>
Content-Type: text/plain
Date: Wed, 29 Jun 2005 10:39:07 +0400
Message-Id: <1120027147.16978.27.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND flash question
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-06-28 at 19:20 +0000, Sergei Sharonov wrote:
> Charles,
> > How could one change the flush interval to around 100mS?  Or does that sound 
> > like a stupid idea?
> 
> Just call sync/fsync as needed. Your application should know when to do it.
> Secondly, I believe JFFS2 will flush write buffer no latter then 5 s after 
> write (?). Can anybody comment on that?
> 
The write buffer flushing mechanism works as follows.

Every time something is written to the WB, the in-RAM superblock
structure object is marked as dirty (sb->s_dirt = 1). pdflush daemon is
the standard daemon which periodically wakes up and flushes dirty pages
and superblocks. So, the jffs2_write_super() will be called by pdflush
when the dirty interval is expired, and the WB will be flushed (and of
course, the s_dirty flag is cleaned). This flushing delay take a chance
that the next writes will be merged with the previous writes before the
WB is flushed.

The dirty expire interval is adjusted by means
of /proc/sys/vm/dirty_expire_centisecs
(seeDocumentation/filesystems/proc.txt) for details.

HTH.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
