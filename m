Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190dTh-0001dN-74
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:20:13 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 190dTc-0006jJ-00
	for linux-mtd@lists.infradead.org; Wed, 02 Apr 2003 09:20:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Bob Koninckx <bob.koninckx@mech.kuleuven.ac.be>
In-Reply-To: <1049269724.25405.8.camel@pc086-2.mech.kuleuven.ac.be>
References: <1049057380.1180.36.camel@pc-002>
	 <1049095079.16365.768.camel@imladris.demon.co.uk>
	 <1049142569.1913.11.camel@pc-002>
	 <1049150862.16365.793.camel@imladris.demon.co.uk>
	 <1049269724.25405.8.camel@pc086-2.mech.kuleuven.ac.be>
Message-Id: <1049271603.4175.4.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: 02 Apr 2003 09:20:04 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: ecos-discuss@sources.redhat.com
Subject: Re: jffs2 / eCos
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-02 at 08:48, Bob Koninckx wrote:
> > We should just fix jffs2_read_inode_range() to handle reads which don't
> > start at the beginning of a node. It's not hard.
> 
> I removed the above mentioned check and now it _appears_ to work
> correctly. Is this all that needs to be done ?

Can you show me the patch or resulting code? 

> Are there similar issues when writing to the filesys ?

No, writing should be fine -- but you really do want to try to ensure
that you don't get writes split up into 256-byte chunks, since that'll
waste space on the file system (till it gets GC'd and merged).
 
-- 
dwmw2
