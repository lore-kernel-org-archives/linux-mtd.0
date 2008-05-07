Received: from djurbala-pt.tunnel.tserv2.fmt.ipv6.he.net
	([2001:470:1f01:ffff::eb] helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtqTR-0005x8-Hg
	for linux-mtd@lists.infradead.org; Wed, 07 May 2008 20:42:50 +0000
In-Reply-To: <1210157630.25560.884.camel@pmac.infradead.org>
References: <20080507102724.GE4326@pengutronix.de>
	<1210157630.25560.884.camel@pmac.infradead.org>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <9146b2e7fde34e912d20e6ea954bb067@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: jffs2 and unaligned access
Date: Wed, 7 May 2008 22:42:28 +0200
To: David Woodhouse <dwmw2@infradead.org>
Cc: linuxppc-dev@ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> memcpy_from/to_io() use word aligned accesses on the io side of 
>> memory.
>> The MPC5200 local plus bus where our flashes are connected does not
>> allow unaligned accesses, so we have to use the io versions of memcpy.
>
> But this region of flash is marked as suitable for execute-in-place,
> otherwise the point() function wouldn't be working to give a direct
> pointer to it. It sounds like we shouldn't be allowing that.
>
> Which in turn means that perhaps we should have a property in the
> corresponding node in the device-tree which indicates that it's not
> suitable for direct access?

This isn't usually a property of the flash device, but of the various
buses/controllers above the flash device.  The device tree should mimic
reality (and it does, it just seems the kernel doesn't use this 
information
yet?)


Segher
