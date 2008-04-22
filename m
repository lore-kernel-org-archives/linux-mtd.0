Subject: Re: [PATCH 1/2] [MTD] Add support for RAM & ROM mappings
	in	the	physmap_of MTD driver.
From: David Woodhouse <dwmw2@infradead.org>
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
In-Reply-To: <480E479C.7040408@ru.mvista.com>
References: <200803261344.03438.laurentp@cse-semaphore.com>
	<47EA6B11.7050804@ru.mvista.com>
	<777c028aa41fe870542afdb4fa7d2db6@kernel.crashing.org>
	<200803271026.51555.laurentp@cse-semaphore.com>
	<1208894995.9212.669.camel@pmac.infradead.org>
	<480E479C.7040408@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 21:18:16 +0100
Message-Id: <1208895496.9212.671.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: ben@simtec.co.uk, Segher Boessenkool <segher@kernel.crashing.org>,
	Laurent Pinchart <laurentp@cse-semaphore.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 00:16 +0400, Sergei Shtylyov wrote:
> David Woodhouse wrote:
> 
> >>Ok. I'll submit a new patch as soon as we agree on a compatible name.
> 
> > Did we?
> 
>     IIRC, The latest agreement was that we don't need the "compatible" and 
> will match on node name.

Ok. Is there a current patch I should be merging?

-- 
dwmw2
