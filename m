Received: from adsl-110-19.38-151.net24.it ([151.38.19.110] helo=develer.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVGz9-00037g-Av
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 17:39:54 -0400
Message-ID: <40BCF7A0.70203@develer.com>
Date: Tue, 01 Jun 2004 23:39:44 +0200
From: Bernardo Innocenti <bernie@develer.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <40BCE3FD.4080500@develer.com>	
	<1086121783.4273.0.camel@localhost.localdomain>	
	<40BCF190.3020509@develer.com>
	<1086125112.4273.2.camel@localhost.localdomain>
In-Reply-To: <1086125112.4273.2.camel@localhost.localdomain>
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

>>The header nftl-user.h doesn't exist in neither
>>linux-2.6.6 and in the version of mtd-utils
>>imported in uClinux-dist (a rather old version,
>>I shall admit).
> 
> nftl-user.h is in CVS, along with a version of the userspace tools which
> uses it.

Ok, I'll check it out from CVS and post a patch to
the uClinux-dev mailing-list adding this header in
user/mtd-utils.

Is it 100% binary-compatible with all kernels?

-- 
  // Bernardo Innocenti - Develer S.r.l., R&D dept.
\X/  http://www.develer.com/
