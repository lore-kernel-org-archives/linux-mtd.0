Received: from adsl-110-19.38-151.net24.it ([151.38.19.110] helo=develer.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVGa3-0002p6-7l
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 17:13:58 -0400
Message-ID: <40BCF190.3020509@develer.com>
Date: Tue, 01 Jun 2004 23:13:52 +0200
From: Bernardo Innocenti <bernie@develer.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <40BCE3FD.4080500@develer.com>
	<1086121783.4273.0.camel@localhost.localdomain>
In-Reply-To: <1086121783.4273.0.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

David Woodhouse wrote:
> On Tue, 2004-06-01 at 22:15 +0200, Bernardo Innocenti wrote:
> 
>>Fix linux/mtd/nftl.h for user-space inclusion (required to build mtd-utils).
>>
>>Please apply.
> 
> It should be including mtd/nftl-user.h not linux/nftl.h

The header nftl-user.h doesn't exist in neither
linux-2.6.6 and in the version of mtd-utils
imported in uClinux-dist (a rather old version,
I shall admit).

If nftl.h isn't supposed to be included from user-space,
the "#ifdef __KERNEL__ ... #endif" it contains is
useless.

I may change mtd-utils locally, but I think this
fix should also go into the kernel "just in case".

-- 
  // Bernardo Innocenti - Develer S.r.l., R&D dept.
\X/  http://www.develer.com/
