Received: from ns2.discountwebhost.com ([64.170.22.131]
	helo=ns1.discountwebhost.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Bd1k-0001hv-HB
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 17:04:48 +0100
Message-Id: <5.1.0.14.0.20030502105515.02464fa8@ns.webzsite.com>
Date: Fri, 02 May 2003 11:03:06 -0500
To: David Woodhouse <dwmw2@infradead.org>,dge@sixnetio.com
From: Vipin Malik <vipin@embeddedlinuxworks.com>
In-Reply-To: <1051889041.23448.30.camel@passion.cambridge.redhat.com>
References: <00512BA4F9D3D311912A009027E9B8F407E4ED@NT>
 <00512BA4F9D3D311912A009027E9B8F407E4ED@NT>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: linux-mtd@lists.infradead.org
Subject: RE: Oops in mounting jffs2 (jffs2_get_ino_cache())
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

May I humbly suggest that this is the type of info one should comment in 
the relevant place in the code.

Just a suggestion. I am happy someone has already fixed the problem though!

Regards,

Vipin

At 04:24 PM 5/2/2003 +0100, David Woodhouse wrote:
>On Fri, 2003-05-02 at 16:18, Dave Ellis wrote:
> > I think it is OK. Even during mount the inode crc is checked in
> > jffs2_scan_inode_node() before adding a _new_ inode to the cache (it
> > checks only if the inode isn't already in the cache). So every inode
> > number in the cache must have at least one valid inode node, which
> > keeps the bad inodes like #0xffffffef and #0xffffffff out of the cache.
> >
> > The inode numbers that change c->highest_ino all come from the inode
> > cache, so it should never see the bad values.
>
>You're right -- evidently I did think of this at the time :)
>
>--
>dwmw2
