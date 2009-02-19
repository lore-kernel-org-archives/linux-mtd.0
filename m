Received: from mail-gx0-f160.google.com ([209.85.217.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1La7Wf-00060Z-5x
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2009 11:57:11 +0000
Received: by gxk4 with SMTP id 4so885501gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Feb 2009 03:57:07 -0800 (PST)
Date: Thu, 19 Feb 2009 06:56:53 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: mike zheng <mail4mz@gmail.com>
Subject: Re: jffs2 on NOR flash
Message-ID: <20090219115653.GA2294@yoda.jdub.homelinux.org>
References: <5c9cd53b0902181913j445175ebgbf7c2ee2d9201547@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c9cd53b0902181913j445175ebgbf7c2ee2d9201547@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 18, 2009 at 07:13:00PM -0800, mike zheng wrote:
>Hi All,
>
>I allocated 3 partitions on my NOR flash. After Linux bootup, all
>paritions are found in the /proc/mtd. I verified the flash driver with
>"od -x /dev/mtdxxx".
>
>Do I have to use mkfs.jffs2 to format the partition before use it? Or
>I can just mount it as "mount -t jffs2 /dev/mtdblock0 /mnt"?

You can mount it like that as long as the flash is freshly erased.
Otherwise, you need to write a jffs2 image to it first.

josh
