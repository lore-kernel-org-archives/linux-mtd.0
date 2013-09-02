Received: from mail1.bemta7.messagelabs.com ([216.82.254.109])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGR6l-0003q9-JO
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2013 10:11:47 +0000
Message-ID: <52246421.1020900@digi.com>
Date: Mon, 2 Sep 2013 12:10:41 +0200
From: Hector Palacios <hector.palacios@digi.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com> <20130831025344.GA9971@gmail.com>
 <5220B8F6.3080405@digi.com> <20130831033438.GA13704@gmail.com>
 <5220C8C4.5010305@digi.com>
 <CAOMZO5CTQZBmvQc4y761kGHWYWRXr7GwVrTuTPE+JU=bmjq62w@mail.gmail.com>
 <5220CB56.7040505@digi.com> <20130831133728.GA22069@gmail.com>
 <52244886.8060205@digi.com> <52244B22.3020605@freescale.com>
 <52244F85.4030904@digi.com> <52245171.3050900@freescale.com>
In-Reply-To: <52245171.3050900@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Marek Vasut <marex@denx.de>, Huang Shijie <shijie8@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 scottwood@freescale.com, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang,

On 09/02/2013 10:50 AM, Huang Shijie wrote:
> 于 2013年09月02日 16:42, Hector Palacios 写道:
>> I am writing the JFFS2 partition from my custom U-Boot. Do you mean
>> that they way it writes it could not be compatible with what the new
>> driver expects? That sounds really bad.
>
> The mtd code(as well as the gpmi driver) has merge many patch to the kernel,
> BUT, the relative patches are not submitted to uboot maillist. So the
> code is not aligned between the
> uboot and the kernel.

Ok, I just rewrote the JFFS2 partition using the mtd-utils and now it mounts correctly 
and without any error.
So does this mean that U-Boot is now unable to properly write a JFFS2 partition for it 
to be understood by the linux-next kernel? What is exactly the difference? Does it 
only affect Freescale NAND controllers?

I'm including the U-Boot mailing list in CC.
The complete thread for reference: http://patchwork.ozlabs.org/patch/271322/

Best regards,
--
Hector Palacios
