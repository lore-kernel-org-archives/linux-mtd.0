Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7ph4-0002pW-6v
	for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2003 06:20:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Selwyn Tang <selwyn@hectrix.com>
In-Reply-To: <3F860E15.1060008@hectrix.com>
References: <20031009163345.54331.qmail@web9907.mail.yahoo.com>
	 <3F860E15.1060008@hectrix.com>
Message-Id: <1065763141.30987.315.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 10 Oct 2003 06:19:01 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Slim <slimaffi@yahoo.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: redhat 9, doc 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-10 at 09:40 +0800, Selwyn Tang wrote:
> >    mount: /dev/nftla: unknown device
> 
> /dev/nftla is the nftl device representing your doc, but not a
> partition. You have to create a new partition on it. 

No, you don't have to. If you were going to make only one partition,
that'd just be a gratuitous waste of space -- you'd do better just to
create your file system on /dev/nftla instead.

The problem is elsewhere. Check the driver is loaded and present in
/proc/devices. Check it's actually detected the NFTL on the DiskOnChip
-- what messages did you get at boot or when you loaded the modules?

-- 
dwmw2
