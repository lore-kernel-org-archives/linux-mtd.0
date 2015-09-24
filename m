Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zf2QE-0004XC-LE
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 09:02:35 +0000
Received: by obbmp4 with SMTP id mp4so53320341obb.3
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2015 02:02:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1443062690.32223.70.camel@ubuntu.flightdata.com.au>
References: <1443062690.32223.70.camel@ubuntu.flightdata.com.au>
Date: Thu, 24 Sep 2015 11:02:13 +0200
Message-ID: <CAFLxGvxN-6EQtzO4z7AsJX1QrGU2Nuf9mhqFqrxyE+dGXDWYqw@mail.gmail.com>
Subject: Re: UBI on dual NAND chips
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Nathan Williams <nathan.williams@flightdata.com.au>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nathan,

On Thu, Sep 24, 2015 at 4:44 AM, Nathan Williams
<nathan.williams@flightdata.com.au> wrote:
> We are planning to use two 32GiB MLC NAND flash chips in a product using
> a SoC FPGA with two NAND interfaces. The motivation for wanting to use
> multiple NAND chips is to improve reliability, not capacity.

Using UBI on MLC is not supported yet.
IOW, you have been warned. ;-)

> From what I've read, it's possible to use UBI on a concatenated MTD.
> If I have two identical chips, will these be concatenated automatically?

You mean using the mtd_concat driver?

> Is creating a single UBI volume over the two NAND chips (and using UBIFS
> on it) the best way to make use of a redundant NAND chip? Would
> mirroring data on a second UBI volume offer additional improvements to
> data reliability?

Depends on how you define "data reliability".
You're looking for something like an MTD RAID1 to deal with a dead chip?

> Also, what's the current status of the "unstable bits issue"?

It is a known issue but nobody cared hard enough so far.
Mostly due to the fact that nobody actually can trigger it.

Can you trigger it? If so, I'd like to get access to that hardware
and have a look.

-- 
Thanks,
//richard
