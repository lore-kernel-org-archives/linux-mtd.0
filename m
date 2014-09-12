Received: from mail-yh0-f50.google.com ([209.85.213.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSTzw-0003WJ-AB
 for linux-mtd@lists.infradead.org; Fri, 12 Sep 2014 16:47:02 +0000
Received: by mail-yh0-f50.google.com with SMTP id 29so577757yhl.23
 for <linux-mtd@lists.infradead.org>; Fri, 12 Sep 2014 09:46:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5412B4C0.505@ti.com>
References: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <5412B4C0.505@ti.com>
Date: Fri, 12 Sep 2014 17:46:37 +0100
Message-ID: <CAAEAJfCJNN_rOm7dp1crohuD7or1D7RN3bLqu6WzLW32goX8kA@mail.gmail.com>
Subject: Re: [PATCH 0/3] nand: Renaming, moving and fixing NAND and ELM drivers
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Tony Lindgren <tony@atomide.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 September 2014 09:54, Roger Quadros <rogerq@ti.com> wrote:
> Hi Ezequiel,
>
> On 09/11/2014 04:47 PM, Ezequiel Garcia wrote:
>> Following the recent discussion with Roger, here's a few patches that
>> (hopefully) fix all the issues.
>>
>> The first patches rename the OMAP NAND drivers, so they are now called
>> omap2_nand and omap_elm.
>>
>> The last patch picks an idea from Yann E. Morin and fixes the build issu=
e
>> reported by Roger. Quoting Roger:
>>
>> ""
>> I still get the following error if I set CONFIG_MTD_NAND_OMAP2 to y and
>> CONFIG_MTD_NAND_OMAP_BCH to m.
>>
>> CONFIG_MTD_NAND_OMAP_BCH is used to select the ELM driver and it must be=
 limited to
>> be built-in if CONFIG_MTD_NAND_OMAP2 is built-in.
>>
>> Maybe it should be a sub option of CONFIG_MTD_NAND_OMAP2.
>> IMHO the elm.c file must be moved from mtd/devices to mtd/nand and renam=
ed to omap_elm.c
>>
>> drivers/built-in.o: In function `omap_nand_probe':
>> /work/linux-2.6/drivers/mtd/nand/omap2.c:2010: undefined reference to `e=
lm_config'
>> /work/linux-2.6/drivers/mtd/nand/omap2.c:1980: undefined reference to `e=
lm_config'
>> /work/linux-2.6/drivers/mtd/nand/omap2.c:1927: undefined reference to `e=
lm_config'
>> drivers/built-in.o: In function `omap_elm_correct_data':
>> /work/linux-2.6/drivers/mtd/nand/omap2.c:1444: undefined reference to `e=
lm_decode_bch_error_page'
>> make: *** [vmlinux] Error 1
>> ""
>>
>> [1] https://lkml.org/lkml/2013/5/4/84
>>
>> Ezequiel Garcia (3):
>>   mtd: nand: Move ELM driver and rename as omap_elm
>>   mtd: nand: Rename OMAP NAND driver
>>   mtd: nand: Force omap_elm to be built as a module if omap2_nand is a
>>     module
>
> Thanks for the patches. I see a lot of errors reported by checkpatch.pl w=
hich need fixing.
>

You mean on these patches or across the file?

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
