Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Kcg0-0000V2-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2001 10:22:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B4D6B4E.2040303@crf.canon.fr> 
References: <3B4D6B4E.2040303@crf.canon.fr> 
To: valette@crf.canon.fr
Cc: linux-mtd@lists.infradead.org
Subject: Re: Moving from 2.2.18 + M-system proprietray code to 2.4.6 => does not work 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 12 Jul 2001 10:27:49 +0100
Message-ID: <7474.994930069@redhat.com>
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


valette@crf.canon.fr said:
> NB : /dev/discs/disc1# ls -l
> total 0
> brw-------    1 root     root      93,   0 Jan  1  1970 disc
> brw-------    1 root     root      93,   1 Jan  1  1970 part1

> But I can not mount the filesystem. The filesystem is valid as it
> works with the 2.2.18 kernel...

Does it work without devfs?

--
dwmw2
