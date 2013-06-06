Received: from moutng.kundenserver.de ([212.227.126.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UkbTP-0002p5-Gt
 for linux-mtd@lists.infradead.org; Thu, 06 Jun 2013 14:47:32 +0000
Message-ID: <51B0A0EA.5000703@efe-gmbh.de>
Date: Thu, 06 Jun 2013 16:47:06 +0200
From: "Jens Renner (EFE)" <renner@efe-gmbh.de>
MIME-Version: 1.0
To: Peter Crosthwaite <rpeter.crosthwaite@xilinx.com>
Subject: Re: [RFC] Micron M25P80 Part name variants
References: <CAEgOgz6jjh9-G6PmzrjJcG7LKCnh4cAooSnCiZ9cmz_qUs8AXg@mail.gmail.com>
In-Reply-To: <CAEgOgz6jjh9-G6PmzrjJcG7LKCnh4cAooSnCiZ9cmz_qUs8AXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.06.2013 07:57, schrieb Peter Crosthwaite:
> Hi All,
> 
> For micron M25P80 parts there is a mix of naming conventions in the
> device table:
> 
>         /* Micron */
>         { "n25q064",  INFO(0x20ba17, 0, 64 * 1024, 128, 0) },
>         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024, 256, 0) },
>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
>         { "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
> 
> n25q128 has a11 and a13 variants, while 256 does not. Should this be
> consistent across parts? If so should we adopt Liming Wangs "axx"
> precedent universally? Here is a hunk from Ed Maste that applies the
> relevant change to QEMU (currently on list) that would be nice to
> merge. Can we fix this Linux side in similar fashion?
> 
>      /* Micron */
> -    { INFO("n25q032a",    0x20bb16,      0,  64 << 10,  64, ER_4K) },
> -    { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, 0) },
> -    { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, 0) },
> -    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("n25q032a11",  0x20bb16,      0,  64 << 10,  64, ER_4K) },
> +    { INFO("n25q032a13",  0x20ba16,      0,  64 << 10,  64, ER_4K) },
> +    { INFO("n25q064a11",  0x20bb17,      0,  64 << 10, 128, ER_4K) },
> +    { INFO("n25q064a13",  0x20ba17,      0,  64 << 10, 128, ER_4K) },
> +    { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, ER_4K) },
> +    { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, ER_4K) },
> +    { INFO("n25q256a11",  0x20bb19,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K) },
> 
> Regards,
> Peter
> 

Hi Peter,

Thanks for your RFC, as I was thinking about the same thing. At the moment we
are testing various serial flash memories (Micron and others) on our own
Microblaze platform. In the N25Q256A datasheet and while testing I noticed that
there are specific features on the A83ESF40 and A83E1240 parts which the other
variants are lacking and vice versa. It is mainly about 4-byte access using
commands 12h (program), 13h (read), DCh (erase) that seem to be available only
on these two variants. Opposed to that the commands B7h, E9h (enter / exit
4-byte mode) are not supported by A83ESF40 and A83E1240.

If you want to use the upper 128 Mbit only one of the two methods actually
works. So relying on the manufacturer / device ID won't help because you still
don't know which is implemented by the component. In the code there is a check
if the device exceeds 64M, and if so it tries to activate 4-byte mode. (Btw,
the drawback of the dedicated 4-byte mode is that you run into problem when
using the flash also for Xilinx FPGA configuration which is 3-byte.) There was
a recent patch / proposal by Brian Norris to use 4-byte opcodes if available
just by checking the JEDEC ID:
http://lists.infradead.org/pipermail/linux-mtd/2013-April/046443.html
As he points out he was not able to distinguish between devices that support
the opcodes and those who don't.

So that might be something to consider when thinking about naming conventions.
Maybe I can contribute to this process; at least I could make some tests with
my Spartan-6 board and some flash devices.
Regards,

Jens.
