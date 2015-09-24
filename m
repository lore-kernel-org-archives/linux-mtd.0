Received: from mail-pa0-f46.google.com ([209.85.220.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zf7Ql-0005Pj-CQ
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 14:23:28 +0000
Received: by pacgz1 with SMTP id gz1so7994542pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2015 07:23:06 -0700 (PDT)
Message-ID: <1443104575.7429.49.camel@linux>
Subject: Re: UBI on dual NAND chips
From: Nathan Williams <nathan.williams@flightdata.com.au>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Date: Fri, 25 Sep 2015 00:22:55 +1000
In-Reply-To: <CAFLxGvxN-6EQtzO4z7AsJX1QrGU2Nuf9mhqFqrxyE+dGXDWYqw@mail.gmail.com>
References: <1443062690.32223.70.camel@ubuntu.flightdata.com.au>
 <CAFLxGvxN-6EQtzO4z7AsJX1QrGU2Nuf9mhqFqrxyE+dGXDWYqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-09-24 at 11:02 +0200, Richard Weinberger wrote:
> Using UBI on MLC is not supported yet.
> IOW, you have been warned. ;-)

Thanks. I wasn't sure, despite my background reading.

> > From what I've read, it's possible to use UBI on a concatenated MTD.
> > If I have two identical chips, will these be concatenated automatically?
> 
> You mean using the mtd_concat driver?

Yes.

> > Is creating a single UBI volume over the two NAND chips (and using UBIFS
> > on it) the best way to make use of a redundant NAND chip? Would
> > mirroring data on a second UBI volume offer additional improvements to
> > data reliability?
> 
> Depends on how you define "data reliability".
> You're looking for something like an MTD RAID1 to deal with a dead chip?

Yes that would be ideal. The NAND flash will be used for data logging.
We'd like to use multiple chips to improve our chances of recovering
recorded data in the event that either a chip dies or there are too many
errors.

> > Also, what's the current status of the "unstable bits issue"?
> 
> It is a known issue but nobody cared hard enough so far.
> Mostly due to the fact that nobody actually can trigger it.
> 
> Can you trigger it? If so, I'd like to get access to that hardware
> and have a look.

No I haven't seen it. Our hardware is still in the planning phase.
