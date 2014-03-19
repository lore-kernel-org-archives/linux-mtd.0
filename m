Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQIa6-0007CA-Aw
 for linux-mtd@lists.infradead.org; Wed, 19 Mar 2014 15:39:03 +0000
Received: by mail-lb0-f171.google.com with SMTP id w7so6044430lbi.16
 for <linux-mtd@lists.infradead.org>; Wed, 19 Mar 2014 08:38:39 -0700 (PDT)
MIME-Version: 1.0
Sender: pladow@gmail.com
In-Reply-To: <CAN8Q1Ed_o3xFK_xag76CbiSWNuM-rnSbGSFc5uZ7KjcA5kOXqQ@mail.gmail.com>
References: <CAN8Q1Ed_o3xFK_xag76CbiSWNuM-rnSbGSFc5uZ7KjcA5kOXqQ@mail.gmail.com>
Date: Wed, 19 Mar 2014 08:38:36 -0700
Message-ID: <CAN8Q1Efhzi30St8N_s2Yrj8cY40B8HUMg3S_gEOyY+9LxgeRTA@mail.gmail.com>
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
> We have been using a Samsung NAND part for several years (Samsung
> K9WAG08U1D) without any problems.  We transitioned from 2.6 to the 3.0
> kernel with a few tweaks to our NAND driver without any hiccups.  (Or
> NAND controller is a custom part implemented in an FPGA with our own
> NAND driver in the kernel).
>
> However, Samsung has announced the end of life for the part.  However,
> they have a revision (K9WAG08U1E) they claim is a drop-in replacement.
>  But so far we are having trouble qualifying the part because of ECC
> errors.  We made no changes to our kernel, driver, or NAND controller.
>  The only change is the physical part.

For those that are interested, we tracked down the issue.  The die rev
changed the number of partial programs per page from 4 to 1.  Hence
the additional sub-page writes corrupted the data.

Pete
