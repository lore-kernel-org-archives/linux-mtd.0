Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DDaJ-00074U-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 00:09:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0106211659100B.11839@golan> 
References: <0106211659100B.11839@golan> 
To: M Butcher <mbutcher@aleph-null.tv>
Cc: "MTD for Linux" <linux-mtd@lists.infradead.org>
Subject: Re: DOC Millenium not found by docprobe 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Jun 2001 00:15:17 +0100
Message-ID: <26595.993165317@redhat.com>
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

mbutcher@aleph-null.tv said:
> But I wanted to create a single partition, so I followed the steps in
> the  jffs howto and did the following: 
> (0: sometimes do an 'erase')
> 1: nftl_format /dev/mtd0
> 2: fdisk /dev/nftla (make one big partition)

You didn't need step 1. We definitely shouldn't be encouraging people to do 
that. Just using fdisk to change the partitioning would have been enough.

> 3: mke2fs /dev/nftla

Is this a typo? Having made a partition you then erased it by using mkfs on 
the _whole_ device rather than the single partition. That's fine if it's 
what you wanted... but...

> 4: mount -t ext2 /dev/nftla1 /mnt

I'm amazed this worked.


mbutcher@aleph-null.tv said:
>  When I used the Millenium Only driver, I got an error from docprobe
> saying  something like "no driver", though I could see it with lsmod. 

To use that, you need to undef DOC_SINGLE_DRIVER in docprobe.c

--
dwmw2
