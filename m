Received: from host-84-9-200-140.bulldogdsl.com ([84.9.200.140]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Etk1L-0006kZ-7u
	for linux-mtd@lists.infradead.org; Tue, 03 Jan 2006 06:08:08 -0500
Date: Tue, 3 Jan 2006 10:34:36 +0000
From: Ben Dooks <ben@fluff.org.uk>
To: Deepak Saxena <dsaxena@plexity.net>
Message-ID: <20060103103436.GA2152@home.fluff.org>
References: <20051229232138.GA32463@plexity.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051229232138.GA32463@plexity.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] Make physmap into a platform device driver...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 29, 2005 at 03:21:38PM -0800, Deepak Saxena wrote:
> 
> I'm working on a system where I want to use the physmap driver
> but the size or buswidth of the flash device might change depending
> on the specific board layout. I want to be able to build a single kernel
> that boots on all boards using this NPU (IXP2350) and with the hardcoded
> approach to buswidth and such, it makes it rather impossible. On ARM
> platforms, we've been using the following data structure to pass
> board-specific flash information to the SOC-specific drivers and I 
> am wondering if it makes sense to move it out of ARM into the generic
> MTD layer and have the physmap driver use it. The physmap driver
> could register itself as a platform driver for "phys-mtd" devices
> and boards would just fill in platform_device structure with the
> appropriate resource window and the needed fields below as the
> platform_data. We may want to trim down the structure to remove 
> ARM-specific fields and let ARM have it's own structure that contains
> the generic structure as a member. Thoughts?

Several people have said they where going to modify the
plat-ram driver I wrote a while ago to support flash...

I think a number of the flash drivers currently in the
mtd system could be rolled into a generic mtd flash driver

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
