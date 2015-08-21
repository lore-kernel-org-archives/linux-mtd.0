Received: from s159.web-hosting.com ([68.65.121.203])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSgVD-0008IK-Sc
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 07:12:40 +0000
Received: from mail-la0-f54.google.com ([209.85.215.54]:36397)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.85) (envelope-from <jteki@openedev.com>) id 1ZSgUo-003WL8-6S
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 03:12:18 -0400
Received: by lagz9 with SMTP id z9so36027411lag.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 00:12:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CY1PR0301MB07801D6328FCB80967CF2CA58B660@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <1439978205-6092-1-git-send-email-jteki@openedev.com>
 <1439978205-6092-3-git-send-email-jteki@openedev.com>
 <CY1PR0301MB07803A969EC23D39E0FC9F7A8B670@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <CAD6G_RSVwXjyXRfqXYtusE1n+BZ=3H8AXJiU3idsyMymAQXGLQ@mail.gmail.com>
 <CY1PR0301MB07801D6328FCB80967CF2CA58B660@CY1PR0301MB0780.namprd03.prod.outlook.com>
Date: Fri, 21 Aug 2015 12:42:12 +0530
Message-ID: <CAD6G_RTQLx8Q-aiDzM3jmZXdZhFuASV=a7iAFT0Tgzs5A-2GEQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: sf: Add clear flag status register
 support
From: Jagan Teki <jteki@openedev.com>
To: Hou Zhiqiang <B48286@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hu Vincent <Mingkai.Hu@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Zhiqiang,

On 20 August 2015 at 08:36, Hou Zhiqiang <B48286@freescale.com> wrote:
> Hello Jagan,
>
>> -----Original Message-----
>> From: Jagan Teki [mailto:jteki@openedev.com]
>> Sent: 2015=E5=B9=B48=E6=9C=8820=E6=97=A5 1:49
>> To: Hou Zhiqiang-B48286
>> Cc: linux-mtd@lists.infradead.org; Hu Mingkai-B21284; Brian Norris; Davi=
d
>> Woodhouse; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH 3/3] mtd: spi-nor: sf: Add clear flag status registe=
r
>> support
>>
>> Hi Zhiqiang,
>>
>> On 19 August 2015 at 17:42, Hou Zhiqiang <B48286@freescale.com> wrote:
>> > Hi Jagan,
>> >
>> >> -----Original Message-----
>> >> From: Jagan Teki [mailto:jteki@openedev.com]
>> >> Sent: 2015=E5=B9=B48=E6=9C=8819=E6=97=A5 17:57
>> >> To: linux-mtd@lists.infradead.org
>> >> Cc: linux-kernel@vger.kernel.org; Jagan Teki; Hou Zhiqiang-B48286; Hu
>> >> Mingkai-B21284; David Woodhouse; Brian Norris
>> >> Subject: [PATCH 3/3] mtd: spi-nor: sf: Add clear flag status register
>> >> support
>> >>
>> >> The clear flag status register operation was required by Micron
>> >> SPI-NOR chips, which support FSR. And if an error bit of FSR have
>> >> been set like protection, voltage, erase, and program, it must be
>> >> cleared by the clear FSR operation.
>> >>
>> >> Signed-off-by: Jagan Teki <jteki@openedev.com>
>> >> Cc: Hou Zhiqiang <B48286@freescale.com>
>> >> Cc: Mingkai.Hu <Mingkai.Hu@freescale.com>
>> >> Cc: David Woodhouse <dwmw2@infradead.org>
>> >> Cc: Brian Norris <computersforpeace@gmail.com>
>> >> ---
>> >>  drivers/mtd/spi-nor/spi-nor.c | 35 +++++++++++++++++++++++++++++++--=
-
>> -
>> >>  include/linux/mtd/spi-nor.h   |  9 +++++++++
>> >>  2 files changed, 40 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-
>> >> nor.c index f954d03..c5c472d5 100644
>> >> --- a/drivers/mtd/spi-nor/spi-nor.c
>> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> >> @@ -100,6 +100,28 @@ static int read_fsr(struct spi_nor *nor)  }
>> >>
>> >>  /*
>> >> + * Read the clear flag status register.
>> >> + * The clear flag status register operation was required by Micron
>> >> + * SPI-NOR chips, which support FSR. And if an error bit of FSR
>> >> + * have been set like protection, voltage, erase, and program,
>> >> + * it must be cleared by the clear FSR operation.
>> >> + * Returns zero for FSR bits cleared and negative if error occurred.
>> >> + */
>> >> +static int read_cfsr(struct spi_nor *nor) {
>> >> +     int ret;
>> >> +     u8 val;
>> >> +
>> >> +     ret =3D nor->read_reg(nor, SPINOR_OP_RDCFSR, &val, 1);
>> >
>> > There should be a write_reg instead of read_reg.
>> > There isn=E2=80=99t a register named CFSR, and the command SPINOR_OP_R=
DCFSR is
>> > used to clear the FSR, another words reset FSR to default value.
>>
>> Yes, SPINOR_OP_RDCFSR is clear flag status register, for clearing errors
>> bits on fsr we need to read cfsr once.
>>
>
> Sorry, I'm not clear for this operation. Please correct me if I'm wrong.
> As far as I understand, this command is used to reset the FSR. Does a val=
ue
> Will be read back? And there is not the register CFSR, so I don't know wh=
ich
> register will be read by SPINOR_OP_RDCFSR?

Sorry for the confusion in previous email.

If there is any error bits set during FSR operation, those will reset
back to original
values by reading CFSR ie means the bits on flag status register
revert back to original
state, so-that the flag status register is ready for next FSR operation.

I have defined this, SPINOR_OP_RDCFSR on the patch

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index c5a58c4..36c1681 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -35,6 +35,7 @@
 #define SPINOR_OP_RDID         0x9f    /* Read JEDEC ID */
 #define SPINOR_OP_RDCR         0x35    /* Read configuration register */
 #define SPINOR_OP_RDFSR                0x70    /* Read flag status registe=
r */
+#define SPINOR_OP_RDCFSR       0x50    /* Read clear flag status register =
*/

For more information pls- refer flash datasheet[1]

Page, 29: about fsr
Page, 41: about cfsr

[1] https://www.google.co.in/url?sa=3Dt&rct=3Dj&q=3D&esrc=3Ds&source=3Dweb&=
cd=3D2&cad=3Drja&uact=3D8&ved=3D0CCIQFjABahUKEwjTwY3zzbnHAhXVj44KHdiWDVU&ur=
l=3Dhttps%3A%2F%2Fwww.micron.com%2F~%2Fmedia%2Fdocuments%2Fproducts%2Fdata-=
sheet%2Fnor-flash%2Fserial-nor%2Fn25q%2Fn25q_512mb_1ce_3v_65nm.pdf&ei=3DUc3=
WVZPVCNWfugTYrbaoBQ&usg=3DAFQjCNEN4dLie4U9OTSbNxN-h9jyN9InDQ&sig2=3DvRQTvlk=
bgsgJw1Fy9z1K8A

thanks!
--=20
Jagan | openedev.
