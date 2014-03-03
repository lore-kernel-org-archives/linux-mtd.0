Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKYhQ-0002x8-W0
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 19:38:56 +0000
Received: by mail-la0-f50.google.com with SMTP id y1so4875772lam.23
 for <linux-mtd@lists.infradead.org>; Mon, 03 Mar 2014 11:38:30 -0800 (PST)
MIME-Version: 1.0
Sender: pladow@gmail.com
In-Reply-To: <CAN8Q1Ee+5=Gp=ur_+i_Vw0W6MTQGkCRHy_HvwS1sTCa1GRsgJw@mail.gmail.com>
References: <CAN8Q1Ed_o3xFK_xag76CbiSWNuM-rnSbGSFc5uZ7KjcA5kOXqQ@mail.gmail.com>
 <CAN8Q1Ee+5=Gp=ur_+i_Vw0W6MTQGkCRHy_HvwS1sTCa1GRsgJw@mail.gmail.com>
Date: Mon, 3 Mar 2014 11:38:30 -0800
Message-ID: <CAN8Q1EdvzX_WztEKWC_m92FFM7wZmTCD5Oz3UkgNL9hqQXetSA@mail.gmail.com>
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

On Mon, Mar 3, 2014 at 11:22 AM, Peter LaDow <petela@gocougs.wsu.edu> wrote:
> Then a ubiformat followed by a ubimkvol/ubiupdatevol work fine.  And
> after rebooting, things look good.  In fact, this disabling of
> sub-pages makes the NAND perfectly functional (though the number of
> LEB was reduced from 16384 to 16376--ignoring bad blocks).

I made a mistake above.  The total number of LEB's is the same,
regardless:  16384.  I misread the values.

Thanks,
Pete
