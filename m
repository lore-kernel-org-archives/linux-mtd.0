Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190irL-0005Q0-Cf
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 15:04:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030402140304.GA752@wohnheim.fh-wedel.de>
References: <002201c2f91d$8c6ff330$1200a8c0@JOHNB>
	 <1049291095.2652.2.camel@passion.cambridge.redhat.com>
	 <20030402140304.GA752@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1049292292.2652.4.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: 02 Apr 2003 15:04:53 +0100
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: John Burch <jburch@vincisystems.com>
Subject: Re: reach of jffs2 within image vs. partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-02 at 15:03, Jörn Engel wrote:
> In my experience, better always use images of the same size as the
> partition.
> 
> You don't *have* to, but then some will figure out how to not erase
> the partition, write the image to it, remount the partition and find
> some old data in the filesystem that was supposed to be erased.
> 
> Give people the option to shoot themselves in the foot and eventually
> someone will do it - and blame you. ;)

Oh yeah, that too -- good point :)

-- 
dwmw2
