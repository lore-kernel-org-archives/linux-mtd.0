Received: from mercuryimc.plus.com ([80.229.200.144]
 helo=centos1.newflow.co.uk)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG4rV-0001WO-VJ
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 09:54:14 +0000
Message-ID: <51419E3A.8030007@mimc.co.uk>
Date: Thu, 14 Mar 2013 09:54:02 +0000
From: Mark Jackson <mpfj-list@mimc.co.uk>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: MTD : Kernel oops when remounting ubifs as read/write
References: <5134CEF9.5070502@mimc.co.uk>
 <1363087506.3348.62.camel@sauron.fi.intel.com> <51405F3A.3090901@mimc.co.uk>
 <1363252425.11441.94.camel@sauron.fi.intel.com>
In-Reply-To: <1363252425.11441.94.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14/03/13 09:13, Artem Bityutskiy wrote:
> On Wed, 2013-03-13 at 11:12 +0000, Mark Jackson wrote:
>> Sorry ... this just locks up the unit.
> 
> OK, I've reproduced the issue with 3.9-rc2 in nandsim, see the details
> below. The patch I proposed did not get the error path correctly, but it
> does fix the issue.
> 
> I think what you treat as "lockup" is the fixup process. UBIFS basically
> reads the entire UBI volume and writes it back. And it uses the atomic
> change UBI service, which means it also calculates CRC of everything it
> writes. And this all just takes a lot of time. This has to be done only
> once on the first mount.

Okay ... I've retried, but how long is "a lot of time" ?

I've waited 15 minutes and still nothing.

And I can see that there's no activity on the NAND chip select !?!

I'll put some debug info into the fixup routines to see if I can trace what's going on.

Regards
Mark J.
