Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CES2j-0005OR-6h
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 08:34:20 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <416127B7.3070505@yandex.ru>
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
	<416127B7.3070505@yandex.ru>
Content-Type: text/plain
Message-Id: <1096893242.22034.5.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 07:34:02 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [OBORONA-SPAM]  Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 05:36, Artem B. Bityuckiy wrote:
> > It seems to make a lot of sense. We could write such checkpoints only on
> > files which are large enough to warrant them, and we could tune the
> > frequency of such checkpoints.
> 
> The following are required features (as I think) of the checkpoint 
> creation algorithm and strategy.
> 1 New checkpoint nodes must not be created if there is little free space 
> left on the file system.
> 2 New checkpoint nodes ought to be created only for large inodes.

Can we extend this to be "files with a large amount of nodes"?  I'm
thinking of the fifo problem here too...

> 3 The checkpoint nodes creation process must not decrease the JFFS2 
> performance very much.
> 
> Checkpoints should be created in background by the GC thread. GC begins 
> creating checkpoints if the following is true:

eCos doesn't have a GC thread IIRC.  Not a big deal in my opinion, but
others might care :).

josh
