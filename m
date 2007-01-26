Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HAMom-0002hh-9L
	for linux-mtd@lists.infradead.org; Fri, 26 Jan 2007 03:52:24 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id l0Q8ll8O002850
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2007 03:47:47 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l0Q8llbN278786
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2007 03:47:47 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l0Q8llsH004344
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2007 03:47:47 -0500
Subject: Re: [MTD] UBI: Per volume update marker
From: Frank Haverkamp <haver@vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1169748994.9477.15.camel@sauron>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
	<1169748994.9477.15.camel@sauron>
Content-Type: text/plain
Date: Fri, 26 Jan 2007 09:47:45 +0100
Message-Id: <1169801265.4389.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Thu, 2007-01-25 at 20:16 +0200, Artem Bityutskiy wrote:

> The patch in general (did not look closely to the details) looks good
> for me. But are you sure you want this patch? It was a requirement from
> your team to implement the update marker. 

The requirement was that we are able to avoid using an UBI volume where
the update was interrupted, and _not_ the update marker. The
update-marker was just one idea how this feature could be implemented.
Alexanders proposal is another idea, which we think helps to reduce
complexity.

> Note, your patch means that
> the boot-loader needs to read and interpret the volume table which
> increases its size.
> 

The simplest form of our boot-loader does not know anything about the
volume table and update maker block at all, but just deals with static
volumes. If all blocks of a static volumes are available and have good
CRC the boot-code will use it.

There is also a boot-code enhancement done by Josh which exploits the
volume table and possibly the update marker. If we decide to use the new
mechansim, I think this code needs a little adjustement too, but I think
we can handle that. If that becomes neccessary we also hope that some
complexity will go away there.

Alexander will update the patch according to the comments you gave in
your last mail and resend the patch.

Frank
