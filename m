MIME-Version: 1.0
In-Reply-To: <20120210162134.GA2723@r65073-Latitude-D630>
References: <1328612075-5825-1-git-send-email-b32955@freescale.com>
 <1328612075-5825-2-git-send-email-b32955@freescale.com>
 <20120210162134.GA2723@r65073-Latitude-D630>
Date: Sat, 11 Feb 2012 07:36:50 +0800
Message-ID: <CAMiH66EP6UFDYkguzfSFgysDzVREPZ8P1x29TkYvQ+Cuvz-4hg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mxs-dma : move the mxs dma.h to a more common place
From: Huang Shijie <shijie8@gmail.com>
To: Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, vinod.koul@intel.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, w.sang@pengutronix.de,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 artem.bityutskiy@intel.com, b29396@freescale.com,
 linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

On Sat, Feb 11, 2012 at 12:21 AM, Shawn Guo <shawn.guo@linaro.org> wrote:
> On Tue, Feb 07, 2012 at 06:54:34PM +0800, Huang Shijie wrote:
>> Move the header to a more common place.
>> The mxs dma engine is not only used in mx23/mx28, but also used
>> in mx50/mx6q. =C2=A0It will also be used in the future chips.
>>
>> Rename it to mxs-dma.h
>>
>> change mxs-dma driver, mxs-mmc driver, gpmi-nand driver, mxs-saif driver
>> to the new header file.
>>
>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>> ---
>> =C2=A0drivers/dma/mxs-dma.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A02 +-
>> =C2=A0drivers/mmc/host/mxs-mmc.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> =C2=A0drivers/mtd/nand/gpmi-nand/gpmi-nand.h =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> =C2=A0.../include/mach/dma.h =3D> include/linux/mxs-dma.h =C2=A0| =C2=A0=
 =C2=A00
>> =C2=A0sound/soc/mxs/mxs-pcm.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A0sound/soc/mxs/mxs-pcm.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A0sound/soc/mxs/mxs-saif.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
>> =C2=A07 files changed, 6 insertions(+), 6 deletions(-)
>> =C2=A0rename arch/arm/mach-mxs/include/mach/dma.h =3D> include/linux/mxs=
-dma.h (100%)
>
> I suggested you rename it include/linux/fsl/mxs-dma.h [1]. =C2=A0It seems
> you are ignoring the comment. =C2=A0Can you explain why it's not a
> reasonable suggestion?

For gpmi-nand.h is placed in include/linux/mtd/ directory, so i think
it's better to place the mxs-dma.h
to similar include/linux/dma/ directory, but the directory does not exit.

If i place it at include/linux/fsl/mxs-dma.h , i have to create a new
folder, I am not sure i have the right
to do so. But i can try it in the next version.

thanks a lot.



>
> And Wolfram and Mark told you that you need to Cc subsystem maintainers
> to collect their acks [2]. =C2=A0But you are still not Ccing Mark Brown a=
nd
> Chris Ball for sound/soc/ and drivers/mmc changes. =C2=A0So you are not
> listening.

ok, i will CC them in next version.  I=E3=80=80really did not know to whom =
I=E3=80=80should cc .

BR
Huang Shijie

>
> Regards,
> Shawn
>
> [1] http://article.gmane.org/gmane.linux.kernel.mmc/12301
> [2] http://article.gmane.org/gmane.linux.alsa.devel/93751
