Subject: Re: [PATCH-V2] Bug in m25p80.c during whole-chip erase
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Steven A. Falco" <sfalco@harris.com>
In-Reply-To: <4A1D45E3.2090104@harris.com>
References: <49F71052.4060505@harris.com>  <4A1D45E3.2090104@harris.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 May 2009 17:01:27 +0300
Message-Id: <1243432887.11172.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-05-27 at 09:53 -0400, Steven A. Falco wrote:
> I sent the following patch about a month ago.  There seemed to
> be some interest, but I never saw anyone say they would/could
> merge it.
> 
> So, is there any interest in merging this?

It is already in linus's tree:
http://git.infradead.org/linux-2.6.git?a=commit;h=3f33b0aaac4e208579fe5aa2964857d4e9ba10c5

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
