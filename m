Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sZa0-0003YU-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 02:28:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020402132818.A10402@friction.hpl.hp.com> 
References: <20020402132818.A10402@friction.hpl.hp.com> 
To: Christopher Hoover <ch@hpl.hp.com>
Cc: linux-arm-kernel@lists.arm.linux.org.uk,
    linux-mtd@lists.infradead.org
Subject: Re: 2.5.7{,-rmk1}: jffs2 on root patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 03 Apr 2002 02:28:45 +0100
Message-ID: <19796.1017797325@redhat.com>
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

ch@hpl.hp.com said:
>  2.5.7-rmk1 (and apparently any 2.5.7 kernel, hence the cross-posting)
> requires the following patch, if you wish to use a jffs2 file system
> as your root.  Without the patch, mount_block_root() won't attempt to
> use jffs2.

I don't like it. We don't require a block device, and I'd rather see the
mechanism fixed to pass the 'root=' argument to the file system, so we can
use the new mount-by-name functionality on the rootfs.

--
dwmw2
