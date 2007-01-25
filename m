Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HAA9J-0000Fu-Nw
	for linux-mtd@lists.infradead.org; Thu, 25 Jan 2007 19:20:47 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id l0PJIa8P024110
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2007 14:18:36 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l0PJIatr536442
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2007 12:18:36 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l0PJIZsl006767
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2007 12:18:35 -0700
Subject: Re: [MTD] UBI: Per volume update marker
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1169748994.9477.15.camel@sauron>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
	<1169748994.9477.15.camel@sauron>
Content-Type: text/plain
Date: Thu, 25 Jan 2007 13:19:36 -0600
Message-Id: <1169752776.7011.120.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-01-25 at 20:16 +0200, Artem Bityutskiy wrote:
> Hi Alexander,
> 
> 
> The patch in general (did not look closely to the details) looks good
> for me. But are you sure you want this patch? It was a requirement from
> your team to implement the update marker. Note, your patch means that
> the boot-loader needs to read and interpret the volume table which
> increases its size.

Small thing to remember.  Requirements change and patch submissions may
or may not reflect the current code base used in a product.  They may
not even reflect back to a product at all.

And since this is open source, no single team has control over it
anyway.

josh
