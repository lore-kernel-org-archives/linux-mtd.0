Received: from mtagate4.uk.ibm.com ([195.212.29.137])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMQ6e-0007aK-Nl
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 14:48:41 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate4.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l1SEmHed021350
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 14:48:17 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l1SEmHEG1343726
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 14:48:17 GMT
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l1SEmG5R011093
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 14:48:16 GMT
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org, dedekind@infradead.org
Subject: Re: [RFC] [PATCH] UBI: convert to kthread API
Date: Wed, 28 Feb 2007 15:48:11 +0100
References: <200702271450.41167.alexs@linux.vnet.ibm.com>
	<200702280915.26914.alexs@linux.vnet.ibm.com>
	<1172657053.17031.20.camel@sauron>
In-Reply-To: <1172657053.17031.20.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200702281548.11627.alexs@linux.vnet.ibm.com>
Cc: Christoph Hellwig <hch@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 28 February 2007, Artem Bityutskiy wrote:
> C. The stuff which stops the thread is _debugging_ stuff and you may
> remove it if it causes troubles. I will add something like "do not spawn
> the thread" debugging option later when I need it.

I have finished a patch which removes the sysfs write function and has
some further simpifications. The code is still in its own background unit,
so please comment on moving it or not. I will send "try 2" then.

Regards,
Alex
