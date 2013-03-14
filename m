Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG76Z-0007LO-H4
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 12:17:56 +0000
Message-ID: <1363263529.11441.109.camel@sauron.fi.intel.com>
Subject: Re: MTD : Kernel oops when remounting ubifs as read/write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 14 Mar 2013 14:18:49 +0200
In-Reply-To: <5141BC63.6060501@mimc.co.uk>
References: <5134CEF9.5070502@mimc.co.uk>
 <1363087506.3348.62.camel@sauron.fi.intel.com>
 <51405F3A.3090901@mimc.co.uk>
 <1363252425.11441.94.camel@sauron.fi.intel.com>
 <51419E3A.8030007@mimc.co.uk>
 <1363257009.11441.97.camel@sauron.fi.intel.com>
 <5141B154.6050504@mimc.co.uk>
 <1363260202.11441.108.camel@sauron.fi.intel.com>
 <5141BC63.6060501@mimc.co.uk>
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

On Thu, 2013-03-14 at 12:02 +0000, Mark Jackson wrote:
> But there's also a call to crc with a size of 122880 bytes, and that's
> when the oops occurs.
> 
This is when we do the atomic LEB change.

> Is this size larger than the allocated buffer ?

I believe so.

-- 
Best Regards,
Artem Bityutskiy
