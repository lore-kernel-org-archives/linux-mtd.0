Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG7B8-0007oM-H0
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 12:22:39 +0000
Message-ID: <1363263812.11441.112.camel@sauron.fi.intel.com>
Subject: Re: MTD : Kernel oops when remounting ubifs as read/write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 14 Mar 2013 14:23:32 +0200
In-Reply-To: <1363263529.11441.109.camel@sauron.fi.intel.com>
References: <5134CEF9.5070502@mimc.co.uk>
 <1363087506.3348.62.camel@sauron.fi.intel.com>
 <51405F3A.3090901@mimc.co.uk>
 <1363252425.11441.94.camel@sauron.fi.intel.com>
 <51419E3A.8030007@mimc.co.uk>
 <1363257009.11441.97.camel@sauron.fi.intel.com>
 <5141B154.6050504@mimc.co.uk>
 <1363260202.11441.108.camel@sauron.fi.intel.com>
 <5141BC63.6060501@mimc.co.uk>
 <1363263529.11441.109.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-03-14 at 14:18 +0200, Artem Bityutskiy wrote:
> > Is this size larger than the allocated buffer ?
> 
> I believe so.

Err, I mean, the buffer is large enough. I do not believe there is a
stupid bug like too small buffer. This code has worked for years and I
do not think it was changes much.

The oops may be cause by memory corruption - some of your drivers may
corrupt memory. You need to spend more time debugging this carefully.

Do you have fastmap UBI feature enabled?

-- 
Best Regards,
Artem Bityutskiy
