Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDbT-0003HY-GP
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 14:06:31 +0000
Message-ID: <1413813912.7906.305.camel@sauron.fi.intel.com>
Subject: Re: UBI/UBFS: ubi_eba_read_leb() reporting unmapped LEB
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Steve B <steve@baconbits.demon.co.uk>
Date: Mon, 20 Oct 2014 17:05:12 +0300
In-Reply-To: <alpine.DEB.2.02.1410201442380.2556@ubuntu>
References: <alpine.DEB.2.02.1410101444510.2556@ubuntu>
 <1413812127.7906.282.camel@sauron.fi.intel.com>
 <alpine.DEB.2.02.1410201442380.2556@ubuntu>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-10-20 at 14:48 +0100, Steve B wrote:
> Hi Artem,
> 
> Thanks for the reply.
> 
> I have the kernel built with:
> CONFIG_MTD_UBI_DEBUG=y
> CONFIG_UBIFS_FS=y
> 
> The failure was seen on an embedded device, I dumped the flash
> contents (raw format) and then re-constructed the image on my Linux PC
> using nandsim with UBI and UBIFS modules i've built with some extra debugging.
> The call stack in the log posted is the same as the one seen on the device
> that showed the original problem.
> 

I see. Would you post the full log, not just the extract near the
failure message?

>From what I see so far, UBIFS believes that the data of a file is stored
in LEB 352. But UBI says: "nope, this LEB was unmapped".

So the bug may be in both UBIFS and UBI.

When we were writing this code years ago, we were stressing UBIFS
power-cut tolerance a lot. We dead real power cuts, but we did emulated
power cuts a lot more than real. And emulated power cuts only test
UBIFS, not UBI. On the other hand, UBI is very simple comparing to
UBIFS.

BTW, do you have fastmap enabled or disabled?

Are you doing deliberate power cut testing, or you hit this error by
chance? In the former case, you may enable additional debugging,
probably, depending on how many test-boxes are you stressing
simultaneously.

Also, are you 100% sure you "reconstructed" the image correctly, and you
are not wasting time looking at irrelevant errors?

Artem.
