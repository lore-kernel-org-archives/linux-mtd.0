Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkPOd-0004Vu-BA
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 11:40:44 -0400
To: tharbaugh@lnxi.com
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m33c3widyq.fsf@maxwell.lnxi.com>
	<1089705743.2899.46.camel@hades.cambridge.redhat.com>
	<m3u0wcj899.fsf@maxwell.lnxi.com> <1089729938.8696.115.camel@tubarao>
	<m3acy4j6dn.fsf@maxwell.lnxi.com> <1089732108.8696.127.camel@tubarao>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 13 Jul 2004 09:40:48 -0600
In-Reply-To: <1089732108.8696.127.camel@tubarao>
Message-ID: <m3n0237w5b.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thayne Harbaugh <tharbaugh@lnxi.com> writes:
> > Thayne this problem I am not familiar with.  Could I have some details?
> 
> Errrr . . . the problem of the unlock address or of the harry, ugly
> code?
> 
> The unlock story is that there was *no* unlock code in cfi_cmdset_0002.
> One of the newer SST chips requires unlocking of the blocks.  Unlike
> other chips that need unlocking, the addresses for unlocking this
> particular chip is not at the block address but below the address of the
> entire chip.

Ah. yes.  Sorry the way you phrased it I was thinking of the unlock_addr address
prefix that needs to be applied to commands.  The magic Firmware hub addresses
that are used for locking/unlocking block I am familiar with.  

Eric

 
