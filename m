Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKYSQ-0002e4-Oq
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 19:23:23 +0000
Received: by mail-la0-f46.google.com with SMTP id hr17so4958886lab.33
 for <linux-mtd@lists.infradead.org>; Mon, 03 Mar 2014 11:22:59 -0800 (PST)
MIME-Version: 1.0
Sender: pladow@gmail.com
In-Reply-To: <CAN8Q1Ed_o3xFK_xag76CbiSWNuM-rnSbGSFc5uZ7KjcA5kOXqQ@mail.gmail.com>
References: <CAN8Q1Ed_o3xFK_xag76CbiSWNuM-rnSbGSFc5uZ7KjcA5kOXqQ@mail.gmail.com>
Date: Mon, 3 Mar 2014 11:22:59 -0800
Message-ID: <CAN8Q1Ee+5=Gp=ur_+i_Vw0W6MTQGkCRHy_HvwS1sTCa1GRsgJw@mail.gmail.com>
Subject: Re: ECC Errors/Sub-page Read Failures
From: Peter LaDow <petela@gocougs.wsu.edu>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 28, 2014 at 7:27 PM, Peter LaDow <petela@gocougs.wsu.edu> wrote:
> What boggles me is that things work just fine with our NAND controller
> and driver with the earlier revision part, and suddenly fail with this
> new part.  Samsung claims the flash layout is identical (OOB space is
> the same), the level of ECC necessary is the same, etc.

After more digging through the mailing list and the MTD web page, I've
tried some things.  I disabled the sub-pages:

u-boot> set bootargs 'ubi.mtd=1,2048 ...'

Then a ubiformat followed by a ubimkvol/ubiupdatevol work fine.  And
after rebooting, things look good.  In fact, this disabling of
sub-pages makes the NAND perfectly functional (though the number of
LEB was reduced from 16384 to 16376--ignoring bad blocks).

This is confusing that our controller/driver works fine with the
previous part.  In fact, the mtd_subpagetest works fine with the exact
same controller/driver/kernel version with the older revision part,
but fails with the same controller/driver/kernel on the newer part.
So clearly our driver handles sub-page reads fine.

So, this leads me to the conclusion that the newer part does not
support sub-page reads OR the part has changed the sub-page read
mechanism.  Yet reviewing the datasheets there is nothing to indicate
that this is the case.  In fact, the datasheets look identical (except
for the maximum busy pulse time).  And the datasheets suggest sub-page
reads are possible via random data out accesses.

Now, we can of course get around this by disabling sub-page reads.
But of course this isn't ideal, and isn't consistent with our previous
use of the NAND.  In fact, it breaks compatibility with our older
firmware and newer hardware.

Any suggestions on how to debug this would be very helpful.

Thanks,
Pete
