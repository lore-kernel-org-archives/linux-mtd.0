Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiF0-0006YB-1m
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2004 10:13:41 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m31xic6d79.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m3658sj5ex.fsf@maxwell.lnxi.com>
	<1089735455.29112.14.camel@weaponx.rchland.ibm.com>
	<m31xic6d79.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1092665599.2912.120.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 16 Aug 2004 09:13:19 -0500
Content-Transfer-Encoding: 7bit
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

On Thu, 2004-08-12 at 02:13, Eric W. Biederman wrote:
> So far I have been busy with other things so I have been taking the slow route
> to refactoring.  I have just reported the cfi_fixup function from cfi_util
> and have gotten nearly all of the variation in cfi_cmdset_0001 and cfi_cmdset_0002
> under control.  
> 
> It is probably enough infrastructure so that cfi_cmdset_0001 and 0020 could be
> merged.

Sorry for the delay.  Maybe I can convince Joern to get them merged. 
Most of the stuff can probably be done in a fixup function now that they
take a struct mtd_info *.

> 
> For the deeper pieces of command set common code moving their helper functions
> into cfi_util is probably a good place to start.
> 
> I'm hoping I have accomplished enough I don't need to touch the code again for quite a while but...

We can always hope :).

josh
