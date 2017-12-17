Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eQZso-0006UI-RC
 for linux-mtd@lists.infradead.org; Sun, 17 Dec 2017 14:25:41 +0000
Received: by mail-pg0-x244.google.com with SMTP id y6so8164261pgp.4
 for <linux-mtd@lists.infradead.org>; Sun, 17 Dec 2017 06:25:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171217131705.GA30726@1wt.eu>
References: <20171217120503.GA3323@1wt.eu> <20171217133355.618e5f92@bbrezillon>
 <20171217131705.GA30726@1wt.eu>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 17 Dec 2017 11:25:16 -0300
Message-ID: <CAAEAJfAn64jtYCgUGYiK1xKz-D7Ot2KviPrMOwz11rVViJ41ZA@mail.gmail.com>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
To: Willy Tarreau <w@1wt.eu>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 December 2017 at 10:17, Willy Tarreau <w@1wt.eu> wrote:
> Hi Boris!
>
> On Sun, Dec 17, 2017 at 01:33:55PM +0100, Boris Brezillon wrote:
>> You should have a look at this thread [1], and in case you don't want
>> to read everything,
>
> I've read it entirely, it was very instructive!
>
>> you can just test the solution proposed here [2].
>>
>> [1]http://linux-mtd.infradead.narkive.com/Rd5UaRPO/bug-pxa3xx-wait-time-=
out-when-scanning-for-bb
>> [2]http://patchwork.ozlabs.org/patch/847411/
>
> Well done for such a quick reply! I can confirm that your proposed
> patch below does fix it for me! Now I understand why only jffs2 was
> triggering the issue if it only affects OOB, and I guess I would have
> faced it as well with nanddump had I thought about testing it.
>
> I'm queuing this one here to continue to progress on my machine, feel
> free to add my tested-by if the patch gets merged, or to ping me to
> test any other option you'd like to confirm!
>
> Thanks!
> Willy
>
> ---
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 321a90c..adb9fd8 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -950,6 +950,7 @@ static void prepare_start_command(struct pxa3xx_nand_=
info *info, int command)
>
>         switch (command) {
>         case NAND_CMD_READ0:
> +       case NAND_CMD_READOOB:
>         case NAND_CMD_PAGEPROG:
>                 info->use_ecc =3D 1;
>                 break;
>
>

If we can confirm that with this patch, bad block markers can be read
without issues, then it's good to go.

Willy, think you could try to test that?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
