Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CR8I4-0003yj-6a
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2004 07:06:33 -0500
Date: Mon, 8 Nov 2004 12:06:24 +0000
From: Ben Dooks <ben-mtd@fluff.org>
To: Alexander Hoffmann <ahoffmann@sysgo.de>
Message-ID: <20041108120624.GE13105@home.fluff.org>
References: <418F5E68.3010200@sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <418F5E68.3010200@sysgo.de>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Usage of MTD_UADDR_UNNECESSARY broken?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 08, 2004 at 12:54:16PM +0100, Alexander Hoffmann wrote:
> Hi everyone,
> 
> can anybody please explain me the exact difference between 
> MTD_UADDR_DONT_CARE and MTD_UADDR_UNNECESSARY .
> Because if I use MTD_UADDR_UNNECESSARY an not existing field in the 
> unlock_addrs array is beeing referenced
> (/drivers/mtd/chips/jedec_probe.c, function cfi_jedec_setup, line 1740):
> 
> /* Mask out address bits which are smaller than the device type */
> mask = ~(p_cfi->device_type-1);
> p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1 & mask;
> p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2 & mask;

hmm, thought this masking had been eliminated in later copies of
the mtd code?

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
