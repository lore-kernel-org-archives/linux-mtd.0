Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqFmO-00055z-ID
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 09:08:38 +0000
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
 [209.85.161.173]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v2L97lGg023867
 for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2017 18:07:47 +0900
Received: by mail-yw0-f173.google.com with SMTP id o4so106142460ywd.3
 for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2017 02:07:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170315085521.16914ec2@bbrezillon>
References: <1489513548-3248-1-git-send-email-yamada.masahiro@socionext.com>
 <20170314215839.1df07d13@bbrezillon>
 <CAK7LNAT3dBOHxFUWJ9Tvs7cQ9sAi71RDBHu3MkqJf2LHPQzYZQ@mail.gmail.com>
 <20170315085521.16914ec2@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 21 Mar 2017 18:07:45 +0900
Message-ID: <CAK7LNASmq=N=uzw1pNFH+Cnm35EUFFsVQWQv1=i8k1ECkupSjA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: use .read_oob() instead of .cmdfunc() for bad
 block check
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


2017-03-15 16:55 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Wed, 15 Mar 2017 09:55:13 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi Boris,
>>
>> Thanks for your review.
>>
>> 2017-03-15 5:58 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>> > On Wed, 15 Mar 2017 02:45:48 +0900
>> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >
>> >> The nand_default_block_markbad() is the default implementation of
>> >> chip->block_markbad().  This is called for marking a block as bad.
>> >> It invokes nand_do_write_oob(), then calls a higher level accessor
>> >> ecc->write_oob().
>> >>
>> >> On the other hand, when reading BBM from the OOB, chip->block_bad()
>> >> is called, and nand_block_bad() is the default implementation.  This
>> >> function calls a lower level chip->cmdfunc().  If a driver wants to
>> >> re-use nand_block_bad(), it is required to support NAND_CMD_READOOB
>> >> in its cmdfunc().


I just noticed duplicated efforts for reading BBM.

When creating BBT at initialization, functions are called as follows:

check_create()
  create_bbt()
    scan_block_fast()


scan_block_fast() calls high-level API mtd_read_oob() to check BBM.


On the other hand, we have nand_block_bad() implemented with lower API.


Perhaps, we can merge them.


So, do you want to align to the scan_block_fast approach
(high level API)?



-- 
Best Regards
Masahiro Yamada
