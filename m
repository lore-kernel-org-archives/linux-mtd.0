Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166AeS-0001nz-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2001 13:09:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BF97017.B80B3DC1@virgin.net> 
References: <3BF97017.B80B3DC1@virgin.net> 
To: dave <david.harris18@virgin.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Help 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 20 Nov 2001 13:19:55 +0000
Message-ID: <10496.1006262395@redhat.com>
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

david.harris18@virgin.net said:
>  I have a DOC1000 with all the right patches to 2.4.9. And the erase
> ioctl returns this.

> I can read from it using dd. But writes fail with similar results.

The DiskOnChip 1000 driver hasn't been looked at for some time, because I 
don't have one - it's been out of production for years now, I believe. 

It should be turned into a 'map' driver and use the generic flash chip 
drivers, rather than having its own standalone driver. Look at the paging 
setup in something like drivers/mtd/maps/vmax301.c for inspiration.

--
dwmw2
