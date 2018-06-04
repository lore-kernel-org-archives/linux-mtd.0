Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPvdD-00051U-QK
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2018 19:59:10 +0000
Received: by mail-wm0-x242.google.com with SMTP id q4-v6so16102097wmq.1
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2018 12:58:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASK=ENQC6f8EB78YSYz9n067uj8=tHarNT1J627FPRuhA@mail.gmail.com>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
 <CAK7LNASK=ENQC6f8EB78YSYz9n067uj8=tHarNT1J627FPRuhA@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 4 Jun 2018 21:58:54 +0200
Message-ID: <CAFLxGvwWfC5LAXwhzhP+k=HPzhaEGe=v1K4yvofW6Lz+ZPnrCg@mail.gmail.com>
Subject: Re: DENALI: can't detect NAND chip
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Philipp Rosenberger <p.rosenberger@linutronix.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Benedikt Spranger <b.spranger@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 13, 2018 at 9:48 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-03-12 23:29 GMT+09:00 Philipp Rosenberger <p.rosenberger@linutronix.de>:
>> Hi,
>>
>> I'm currently porting Linux 4.14 to a Altera Cyclone V based board. The
>> Denali NAND Driver isn't able to detect the NAND chip Micron MT29F4G08) correctly.
>>
>> [    0.862242] nand: device found, Manufacturer ID: 0x00, Chip ID: 0x2c
>> [    0.868604] nand: Unknown denali-nand
>> [    0.872253] nand: bus width 8 instead of 16 bits
>> [    0.876899] nand: No NAND device found
>> [    0.880688] denali-nand-dt: probe of ff900000.nand failed with error -22
>>
>> The correct ManufID is 0x2c and the DevID is 0xdc. Currently we are
>> running a 4.1 kernel with the "old" denali driver without this problem.
>> While researching the issue I found the following Mail in the
>> Rocketboards archive, which seems to be the same issue.
>>
>> https://lists.rocketboards.org/pipermail/rfi/2017-September/003627.html
>>
>>
>> We also tested Linux 4.16-rc5 without any additional patches with the same behavior.
>>
>
>
> I got a similar report before for SOCFPGA.
>
> The reporter found a problem in his clock setting:
> http://linux-mtd.infradead.narkive.com/MMBF5wzm/nand-denali-issue-with-4-13

I got access to that board and did initial debugging of the problem.

The problem seems to be that after your rework the NAND timings get
derived from the NAND clock.
When I make denali_setup_data_interface() a NOP, the NAND is being
detected and works.

Can it be that the function does not calculate the timings correctly
in all cases?
Please see the following debug output for good and bad case.

bad case:
[    0.946757] XXX: denali clk rate: 0x2faf080
[    0.950932] XXX: denali clk phase: 0x0
[    0.954671] XXX: denali clk accuracy: 0x0
[    0.958920] denali-nand-dt ff900000.nand: clk_x_rate: 0x2faf080
[    0.964846] denali-nand-dt ff900000.nand: Dump timing register values:
[    0.964846] acc_clks: 2, re_2_we: 10, re_2_re: 10
[    0.964846] we_2_re: 25, addr_2_data: 20, rdwr_en_lo_cnt: 4
[    0.964846] rdwr_en_hi_cnt: 2, cs_setup_cnt: 3

good case:
[    0.961061] XXX: denali clk rate: 0x2faf080
[    0.965231] XXX: denali clk phase: 0x0
[    0.968967] XXX: denali clk accuracy: 0x0
[    0.973031] denali-nand-dt ff900000.nand: Dump timing register values:
[    0.973031] acc_clks: 4, re_2_we: 20, re_2_re: 20
[    0.973031] we_2_re: 12, addr_2_data: 14, rdwr_en_lo_cnt: 2
[    0.973031] rdwr_en_hi_cnt: 2, cs_setup_cnt: 2

Does this ring a bell?

-- 
Thanks,
//richard
