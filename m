Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tMax-0007XC-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 06:16:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BCB8F35.61CC1A8B@Rikers.org> 
References: <3BCB8F35.61CC1A8B@Rikers.org>  <3BCAED35.3000309@tid.es> 
To: Tim Riker <Tim@Rikers.org>
Cc: Jose =?gb2312?B?Um9kcu1ndWV6?= Argente <jradc@tid.es>,
    linux-mtd@lists.infradead.org
Subject: Re: Read Only FS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 16 Oct 2001 06:26:01 +0100
Message-ID: <18185.1003209961@redhat.com>
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

Having a large romfs and then a relatively small jffs2 will make it boot 
faster, because the jffs2 scan obviously doesn't have as much to do. But 
you won't get the wear levelling - obviously the R/W bits are then limited 
to the area of flash that you partitioned for jffs2. 

romfs will work happily on /dev/mtdblock<n> devices, either the full 
CONFIG_MTD_BLOCK device which would also allow you to update the contents 
(as long as it's not mounted at the time, of course) or the smaller 
CONFIG_MTD_BLOCK_RO module which provides the same device, just without 
write functionality.

--
dwmw2
