Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVJdM-0002m2-2l
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 12:51:40 +0000
Received: by mail-vc0-f176.google.com with SMTP id kv7so419413vcb.7
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 05:51:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <54FEDC42.2060407@dave-tech.it>
References: <54FEDC42.2060407@dave-tech.it>
Date: Tue, 10 Mar 2015 13:51:15 +0100
Message-ID: <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Andrea Scian <rnd4@dave-tech.it>
Content-Type: text/plain; charset=UTF-8
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 10, 2015 at 12:57 PM, Andrea Scian <rnd4@dave-tech.it> wrote:
>
> Dear All,
>
> for testing and research purpose, I'm working with an Embedded Linux
> product which mounts an MLC NAND.
>
> I know that one of the trouble with MLC flash on Linux with UBI/UBIFS is
> the power cut management (ref.
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits)
>
> IIUC the solution inside MTD/UBI/UBIFS is not so simple and thus not so
> quick to implement.
>
> I'm wondering if anyone of you already think about managing power cut in
> a different way: many embedded/industrial products already have some
> big/huge bypass capacitor that are able to keep the system alive for
> hundreds of milliseconds (this is useful for power supply
> micro-interruptions), which are commonly enough to complete the latest
> NAND operation.
> Most of the has a GPIO/IRQ that tells whenever such a power cut happens,
> so the kernel can take some actions with it (e.g., in our case, complete
> the last NAND operation and prevent from starting newer operation, which
> may corrupt the NAND pages).
>
> WDYT about this?
> If it sounds reasonable is there any suggestion where to place such a code?

Customers often use DYI uninterruptible power supplies using capacitors.
But managing a power cut is the least problem you have with MLC NAND.

-- 
Thanks,
//richard
