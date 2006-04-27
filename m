Received: from emc.emcraft.com ([80.240.96.158])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FZ7L1-0004GA-92
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 10:19:26 -0400
Received: from emc.emcraft.com ([127.0.0.1] helo=[::1])
	by emc.emcraft.com with esmtp (Exim 4.10) id 1FZ7Ie-0005NW-00
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 18:16:56 +0400
From: Dmitry Bazhenov <atrey@emcraft.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 27 Apr 2006 18:19:25 +0400
References: <200604271140.37488.atrey@emcraft.com>
	<1146146360.11909.456.camel@pmac.infradead.org>
In-Reply-To: <1146146360.11909.456.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200604271819.25608.atrey@emcraft.com>
Subject: Re: JFFS2: scan leaves dirent for inode which has no valid data
	nodes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 27 April 2006 17:59, David Woodhouse wrote:
> You should still be able to unlink it.

I was not and I am still not able to do any operation upon the file. The 
jffs2_read_inode() function marked the inode as bad and all I/O operations 
return EIO, even unlink() does.

For the moment, I have to find and eliminate the reason(s) that could lead to 
appearance of the situation. I think, there is some kind of a race here. My 
experience with the filesystem is much to be desired and I would appreciate 
any points to the possible places of error.

Thanks,
Dmitry
