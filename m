Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JDeTE-0003Ym-PQ
	for linux-mtd@lists.infradead.org; Sat, 12 Jan 2008 11:24:18 +0000
Date: Sat, 12 Jan 2008 10:03:43 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: JFFS2 determine writing state
Message-ID: <20080112100343.GC1497@shareable.org>
References: <298338.39997.qm@web56002.mail.re3.yahoo.com>
	<20080111075730.052c821d@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080111075730.052c821d@zod.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org, Jeff S <jsolman33@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> The open call doesn't cause any writes, and close
> is supposed to flush all pending writes before it returns.

Oh, that's interesting.  So on JFFS2, fsync() is unnecessary before close()?

(On other filesystems it's necessary, of course).

-- Jamie
