Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Na8c-0001ri-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jan 2002 13:48:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB84064B08A0@srvmail-mtl.montreal.ubisoft.org> 
References: <9A1957CB9FC45A4FA6F35961093ABB84064B08A0@srvmail-mtl.montreal.ubisoft.org> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to Sync properly ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 07 Jan 2002 13:59:20 +0000
Message-ID: <20732.1010411960@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

pallaire@gameloft.com said:
>  If I want to move a file from a ram drive to the flash, I will issue
> a 'mv' command followed by a 'sync' command. Sometime it will be
> updated but sometime it wont !!! 'sync' should not return until the
> flash is updated ? no ? 

> To see what was happening I added some printk in the driver, in the
> delete and write ! I saw some stranges behaviour. After a 'mv',
> sometimes the sync command does not do any things, sometime I see
> somes delteting and writing of buffers but not all of the blocks ...
> the remaining block will be written to the flash in a delay from 1 to
> 5 mintutes later ... and sometime the sync work fine !!! 

What file system? If you're using a 'normal' filesystem on the mtdblock 
device, you shouldn't expect it to be reliable. 

Linux stupidly just assumes that block devices never do any write caching, 
and a sync request is therefore never passed to the block device driver. 

--
dwmw2
