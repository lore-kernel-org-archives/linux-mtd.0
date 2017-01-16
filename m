Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTABV-0008Mv-Mz
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 16:31:08 +0000
Subject: Re: UBIFS errors are randomly seen after reboots
To: chaitanya vinnakota <chaitanya.sai.v@gmail.com>,
 linux-mtd@lists.infradead.org
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
 <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
 <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <01b355e9-6095-a2af-5c77-3e15751ff8da@nod.at>
Date: Mon, 16 Jan 2017 17:30:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
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

Chaitanya,

Am 16.01.2017 um 16:21 schrieb chaitanya vinnakota:
> Hi Richard,
> 
> Thanks for your response.
> 
> Based on your response I enabled chk_io , chk_gen,
> tst_emulate_bitflips and tst_emulate_power_failure  options in
> /sys/kernel/debug/ubi/ubi0 directory. I carried on with my test which
> keeps on creating/writing data to files in all the available nand
> partitions and during which a reboot is issued .
> 
>  Below are the various UBI messages I'm seeing quite consistently at
> different times after enabling the debug options.
> 
> 1. UBI error: do_sync_erase: cannot erase PEB 200 (emulated)
> 2. UBI error: erase_worker: failed to erase PEB 200, error -5
> 3. UBI: mark PEB 200 as bad
> 4. UBI error: ubi_io_write: cannot write 2048 bytes to PEB 452:0 (emulated)
> 5. UBI error: erase_worker: failed to erase PEB 452, error -5
>      UBI: mark PEB 452 as bad
>      Bad block table written to 0x00000ffe0000, version 0x0B
>      Bad block table written to 0x00000ffc0000, version 0x0B
>      UBI: 40 PEBs left in the reserve
> 
> Are all the above errors forecasting any doom or are they expected ?

You've enabled UBI self-tests and error *emulation*. This is not what I meant.

I had in mind:
1. MTD tests, these are available in the kernel source:
   http://linux-mtd.infradead.org/doc/general.html#L_mtd_tests
   And now also as part of mtd-utils.
2. UBI tests, you can find them in the tests/ubi-tests/ directory
   of the mtd-utils source package.

David, I think we should add a page to mtd-www on testing. :-)

Thanks,
//richard
