MIME-Version: 1.0
In-Reply-To: <201210181251.15116.marex@denx.de>
References: <1350538335-29026-1-git-send-email-b32955@freescale.com>
 <201210181049.21556.marex@denx.de> <507FC827.40601@freescale.com>
 <201210181251.15116.marex@denx.de>
Date: Thu, 18 Oct 2012 11:11:15 -0400
Message-ID: <CAMiH66HCDLZaxXckQz1bfqscNm2X2480HTr4bFHdJNteDLb=ig@mail.gmail.com>
Subject: Re: [PATCH] dma: add new DMA control commands
From: Huang Shijie <shijie8@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 artem.bityutskiy@linux.intel.com, perex@perex.cz,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux@arm.linux.org.uk, cjb@laptop.org, lrg@ti.com, ben-linux@fluff.org,
 linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Vinod Koul <vinod.koul@linux.intel.com>, broonie@opensource.wolfsonmicro.com,
 linux-mmc@vger.kernel.org, w.sang@pengutronix.de, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, djbw@fb.com, khali@linux-fr.org,
 shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 18, 2012 at 6:51 AM, Marek Vasut <marex@denx.de> wrote:
> Dear Huang Shijie,
>
>> =E4=BA=8E 2012=E5=B9=B410=E6=9C=8818=E6=97=A5 16:49, Marek Vasut =E5=86=
=99=E9=81=93:
>> > Dear Huang Shijie,
>> >
>> >> =E4=BA=8E 2012=E5=B9=B410=E6=9C=8818=E6=97=A5 16:16, Marek Vasut =E5=
=86=99=E9=81=93:
>> >>> So we can't stream data from the chip? About time to adjust the MTD
>> >>> framework to allow that. Maybe implement a command queue?
>> >>
>> >> IMHO, it's not possible. Because the READ-PAGE(00h-30h) command needs=
 to
>> >> check the busy status
>> >> which means we have to stop in the middle, so we can not chain the al=
l
>> >> the read-pages DMA commands.
>> >
>> > Can the DMA not branch?
>>
>> it's too complicated to the MTD layer, as well as the gpmi driver.
>
> Can you please elaborate ?
could you read the nand spec about how to read a page out with the
READ-PAGE(00-30) command,
and tell me how to make the DMA branch?
I really have no idea about how to make the DMA branch.

thanks
Huang Shijie
.


> Best regards,
> Marek Vasut
