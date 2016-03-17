Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agTjq-00059v-Tj
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2016 08:57:03 +0000
Subject: Re: UBIFS question
To: Martin Townsend <mtownsend1973@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <CABatt_y2rOZAvuamVoOxWSzkkGXNFFGvSQ5di4gb4EBFGYV7oQ@mail.gmail.com>
 <CAFLxGvwwQgKNT6=cL_hc05ZODtWyonA8MWyRWQJN_pXVf9SZOQ@mail.gmail.com>
 <CABatt_w_hXqUA45-MzU3_DRox0P9CwraTCY_TYPthdA3O0N-eQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56EA7148.7050008@nod.at>
Date: Thu, 17 Mar 2016 09:56:40 +0100
MIME-Version: 1.0
In-Reply-To: <CABatt_w_hXqUA45-MzU3_DRox0P9CwraTCY_TYPthdA3O0N-eQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Martin,

Am 17.03.2016 um 09:33 schrieb Martin Townsend:
> Hi Richard,
> 
> Thanks for the reply.  rsync is the backup plan, I just wanted to rule
> other options out first. The flash devices are going to subjected to a
> fairly harsh environment and the idea of being able to fail over to a
> backup docker container was appealing.
> 
> Which leads me to a couple of questions:
> 1) I need to simulate flash devices reading corrupted
> pages/blocks/LEBs. Is there currently a way of doing this? if not
> would it be possible to write something, say a kernel module to sit
> above the NAND driver to do this.  I just want to see what effect
> corruption has on a live system and how these errors manifest
> themselves.

check out nandsim and UBI's debugfs. We have a lot of knobs to
simulate such stuff.

> 2) One thing I'm going to have to do is write a background thread to
> monitor the status of the filesystem and try and detect corruption
> before the system becomes unstable, is there any way to find out the
> validity of the LEBs, ie checking their checksums.

So, what exactly is the error scenario you have in mind?
If the SLC NAND behaves correctly UBIFS can deal with all kinds
of errors.
Of course UBI (and UBIFS) is not a magic bullet, if a NAND block
turns bad all of a sudden there is nothing it can do for you.
But this NAND would also not be with in the spec...

It is not clear do me what this background thread should achieve.

Thanks,
//richard
