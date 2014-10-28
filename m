Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj4d9-0001YQ-BG
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 11:08:05 +0000
Received: by mail-wi0-f175.google.com with SMTP id h11so6923614wiw.2
 for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2014 04:07:40 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <1081390030.524273.1414353711820.JavaMail.open-xchange@oxbsltgw08.schlund.de>
References: <1081390030.524273.1414353711820.JavaMail.open-xchange@oxbsltgw08.schlund.de>
Date: Tue, 28 Oct 2014 12:07:40 +0100
Message-ID: <CABkLObrLAdGWA4MHqUR9c2ribZ9E-bM7m7ahSNgb4LMpQC8E8g@mail.gmail.com>
Subject: Re: Questions about OTP driver
From: Christian Riesch <christian.riesch@omicron.at>
To: Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan,
I am not an expert in the mtd field, but in the last years I added OTP
support for the drivers/mtd/chips/cfi_cmdset_0002.c driver and did a
little cleanup.

On Sun, Oct 26, 2014 at 9:01 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> Hi,
>
> currently i try to port a driver for One Time Programmable memory pages on
> Freescale MX23/MX28 (ARM9) SoC.
> This driver gives readonly access to these memory pages via Sysfs.
>
> As i created a patch RFC [1], Arnd Bergmann suggested me to move the driver to
> MTD.
>
> Now i have some questions:
>
> 1. What exact directory is suggested for OTP on SoC driver?

drivers/mtd/devices?

> 2. What is a good example implementaton of an OTP driver?

For drivers that support OTP see git grep _read_user_prot_reg. It's
the cfi_cmdset_0001.c (both from drivers/mtd/chips), the
cfi_cmdset_0002.c, the drivers/mtd/devices/mtd_dataflash.c, and the
drivers/mtd/onenand/onenand_base.c. All these devices are memory chips
that have a little OTP memory in addition to the regular flash memory.
I am not aware of OTP drivers for SoCs.

The most simple implementation of OTP is probably the one in
drivers/mtd/devices/mtd_dataflash.c (see the dataflash_get_otp_info
and dataflash_read_{user,fact}_otp functions). The others are more
complex since they support several flash devices concatenated, which
means that there may be several OTP memory blocks. The driver must
then walk through these blocks.

Regarding your question on the arm kernel mailing list [1]:
> Does MTD drivers have a readonly text (non binary) user interface?

No, you offer a /dev/mtdX interface, with an ioctl you switch it to
OTP operation (see flash_otp_dump from mtd-utils[2]). Then the OTP
memory is offered in binary and can be read using read() etc.

Regards, Christian

[1] http://marc.info/?l=linux-arm-kernel&m=141381928515849&w=2
[2] http://git.infradead.org/mtd-utils.git/blob/HEAD:/flash_otp_dump.c
