Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xXU0-0002pB-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 18:10:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010509190106.A10693@discordia.ch> 
References: <20010509190106.A10693@discordia.ch> 
To: Peter Keel <killer@discordia.ch>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Read Flash-Dumps 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 09 May 2001 18:10:51 +0100
Message-ID: <27428.989428251@redhat.com>
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

killer@discordia.ch said:
>  I got an Igel-Terminal, which features an M-systems DiskOnAChip 2000.
> Now I got these flash-images from an ftp and want to modify them
> before putting them into the flash; preferably on another machine
> (without flash). 

I'm not sure what form those flash-images are in. They may be a similar 
dump to the one you'd get from the 'nanddump' program, in which case you 
could write it back with the 'nandwrite' program and the MTD drivers.


killer@discordia.ch said:
>  Also, nftl doesn't  even appear in /proc/filesystems. 

It would appear as a block device. But last time I knew, I believe Igel were
shipping the M-Systems binary-only driver statically linked into their 
kernel in violation of the GPL. In that case, you're on your own.

Can you show me the contents of /proc/devices?

--
dwmw2
