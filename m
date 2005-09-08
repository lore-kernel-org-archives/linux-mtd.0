From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050908194915.GG20668@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>
	<20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com> <431E772B.9090004@ak.jp.nec.com>
	<20050908194915.GG20668@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Sep 2005 20:54:42 +0100
Message-Id: <1126209282.4171.162.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: James Morris <jmorris@redhat.com>, Ma Yun <sx_yunma@hotmail.com>,
	linux-mtd@lists.infradead.org, Stephen Smalley <sds@tycho.nsa.gov>,
	Kaigai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-08 at 21:49 +0200, Jörn Engel wrote:
> I prefer a longer name.  jffs2_fs_xattr.h would be fine.
> jffs2_xattr.h would also, the "_fs" is more redundant that "attr".

Now would probably be a good time to drop jffs2_fs_i.h and jffs2_fs_sb.h
anyway. We no longer have the inode and superblock unions; this stuff
can be entirely contained within the fs/jffs2/ directory instead of
being in include/linux/

-- 
dwmw2
