Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Kxql-0007cL-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 10:03:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D115F9B.9030203@ctam.com.au> 
References: <3D115F9B.9030203@ctam.com.au> 
To: brendan.simon@ctam.com.au
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: doc2000 nftl[abcd] devices 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 20 Jun 2002 10:03:20 +0100
Message-ID: <12942.1024563800@redhat.com>
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

brendan.simon@ctam.com.au said:
>  Now I try the same thing with nftlb and I get errors saying "Cannot
> open  disk drive".  It should be the same process shouldn't it ?  Any
> ideas of  where to look to fix or debug this ??  I've had a look at
> nftldump and I  can see the 3 sets of media headers and they seem like
> they are in the  right place.

It should be the same process, yes -- although perhaps you might want a 
file system directly on each NFTL device, rather than partitioning them. 

Stick some debugging printks into the nftl_open routine to see why it fails.
(Or just enable debugging so the existing ones happen.)

--
dwmw2
