Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178bzI-00054C-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 08:17:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020517065835.4FB6B36F9@sitemail.everyone.net> 
References: <20020517065835.4FB6B36F9@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Quesion on copying to mtdblock0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 May 2002 08:17:13 +0100
Message-ID: <937.1021619833@redhat.com>
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

zeusj@firstlinux.net said:
> Yes, I create it with mkfs.jffs2 : mkfs.jffs2 --root=/some/place/
> --eraseblock=8192KiB --output=jffs2.img Is there anything I
> missed?should I change pagesize from default 4KiB?

--big-endian?

> Yes, its dragonball. But after I change the endianness of jffs.img/
> jffs2.img (exactly,I change the .b file), the problem is still there,
> just like what it shows before changing.Changing seems no use.

Can you show me the image you loaded onto the flash? Just the first few 
kilobytes should do.

--
dwmw2
