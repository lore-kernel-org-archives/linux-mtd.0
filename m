Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CEQDt-0004jt-8n
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 06:37:44 -0400
Message-ID: <416127B7.3070505@yandex.ru>
Date: Mon, 04 Oct 2004 14:36:39 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096885344.30942.559.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [OBORONA-SPAM]  Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> It seems to make a lot of sense. We could write such checkpoints only on
> files which are large enough to warrant them, and we could tune the
> frequency of such checkpoints.

The following are required features (as I think) of the checkpoint 
creation algorithm and strategy.
1 New checkpoint nodes must not be created if there is little free space 
left on the file system.
2 New checkpoint nodes ought to be created only for large inodes.
3 The checkpoint nodes creation process must not decrease the JFFS2 
performance very much.

Checkpoints should be created in background by the GC thread. GC begins 
creating checkpoints if the following is true:
1 there is no other work to do for GC (i.e., there is no need to check 
inodes and to garbage collect the dirt);
2 there is sufficient amount of free space on the file system

The checkpoint creation process consists of two major steps:
1 locating the most appropriate inode;
2 providing that the inode is found, write the checkpoint(s) for it.

Also, when there are few space left on the file system, GC may begin 
obsoleting checkpoints, starting from checkpoints for smaller files, 
etc. Thus, the spase may appear.

> 
> Of course as with many cute ideas it may turn out to be utterly
> impractical when we implement it :) It does look sane though.

I hope this will be practical if we implement this.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
