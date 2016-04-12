Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aq3Et-0000h3-Cj
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2016 18:40:40 +0000
Received: by mail-wm0-x22d.google.com with SMTP id v188so138253282wme.1
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2016 11:40:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160412202732.30d291c2@bbrezillon>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160412202732.30d291c2@bbrezillon>
Date: Tue, 12 Apr 2016 15:40:17 -0300
Message-ID: <CAAEAJfBay646E3e3yX0aFpeXMHA=CruU7oQkJ_wAK4GsuHA-TQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: trigger: Introduce a MTD (NAND/NOR) trigger
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Jacek Anaszewski <j.anaszewski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 April 2016 at 15:27, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Ezequiel,
>
> On Tue, 12 Apr 2016 13:26:35 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
>> This commit introduces a MTD trigger for flash (NAND/NOR) device
>> activity. The implementation is copied from IDE disk.
>>
>> This deprecates the "nand-disk" LED trigger, but for backwards
>> compatibility, we still keep the "nand-disk" trigger around.
>>
>> The motivation for deprecating the "nand-disk" LED trigger is that
>> it only works for NAND drivers, whereas the "mtd" LED trigger
>> is more generic (in fact, "nand-disk" currently only works for
>> certain NAND drivers).
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>  drivers/leds/trigger/Kconfig       |  8 +++++++
>>  drivers/leds/trigger/Makefile      |  1 +
>>  drivers/leds/trigger/ledtrig-mtd.c | 49 +++++++++++++++++++++++++++++++=
+++++++
>>  drivers/mtd/mtdcore.c              |  7 ++++++
>>  drivers/mtd/nand/nand_base.c       | 29 +---------------------
>>  include/linux/leds.h               |  6 +++++
>
> I'd suggest splitting this patch in 2, one adding ledtrig-mtd code, and
> another one make use of ledtrig_mtd_activity() and removing
> nand-trigger code.
>

Sure, that sounds good.

> IMHO, we should also factorize ledtrig-ide and ledtrig-mtd code
> (after all, you just copied the implementation from ledtrig-ide).
> How about renaming the ledtrig-ide into ledtrig-storage and
> ledtrig_ide_activity() into ledtrig_storage_activity()?
>
> You can then add a trigger named "storage" in addition to the existing
> "nand-disk" and "ide-disk" ones.
>

I'm not exactly following you: are you suggesting to suggest factorize
the code, or to meld the two triggers in a single "storage" trigger?

In the former, the code is so small, that I'm not sure it will be actually
reduced with some factorization. In the latter, wouldn't we loose
the capability to trigger on MTD and IDE activity independently?

> Anyway, this is just a suggestion, and I let leds maintainers decide
> whether this is appropriate or not.
>

Thanks for the reviewing Boris!

> Best Regards,
>
> Boris
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
