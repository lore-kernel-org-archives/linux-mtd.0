Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVH13-0003Ge-Qz
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 17:41:50 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Bernardo Innocenti <bernie@develer.com>
In-Reply-To: <40BCF7A0.70203@develer.com>
References: <40BCE3FD.4080500@develer.com>
	<1086121783.4273.0.camel@localhost.localdomain>
	<40BCF190.3020509@develer.com>
	<1086125112.4273.2.camel@localhost.localdomain>
	<40BCF7A0.70203@develer.com>
Content-Type: text/plain
Date: Tue, 01 Jun 2004 22:41:36 +0100
Message-Id: <1086126096.4273.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: TRIVIAL: Fix linux/mtd/nftl.h for user-space inclusion
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-06-01 at 23:39 +0200, Bernardo Innocenti wrote:
> David Woodhouse wrote:
> 
> >>The header nftl-user.h doesn't exist in neither
> >>linux-2.6.6 and in the version of mtd-utils
> >>imported in uClinux-dist (a rather old version,
> >>I shall admit).
> > 
> > nftl-user.h is in CVS, along with a version of the userspace tools which
> > uses it.
> 
> Ok, I'll check it out from CVS and post a patch to
> the uClinux-dev mailing-list adding this header in
> user/mtd-utils.
> 
> Is it 100% binary-compatible with all kernels?

Yes, I believe so.

-- 
dwmw2
