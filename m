Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8blH-00043h-Hs
	for linux-mtd@lists.infradead.org; Thu, 03 Aug 2006 07:53:17 -0400
Received: by ug-out-1314.google.com with SMTP id u40so160830ugc
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Aug 2006 04:53:07 -0700 (PDT)
Message-ID: <625fc13d0608030453u54cc12b2nf9aca1609148d07e@mail.gmail.com>
Date: Thu, 3 Aug 2006 06:53:07 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Iva Salom" <diva@kondor.imp.bg.ac.yu>
Subject: Re: Problem with mounting JFFS2
In-Reply-To: <001601c6b6ea$cb60f790$c6345b93@VLADIMIR>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <001601c6b6ea$cb60f790$c6345b93@VLADIMIR>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/3/06, Iva Salom <diva@kondor.imp.bg.ac.yu> wrote:
>
>
> Hi!
>
> I am a beginner in all these embedded linux - mtd - jffs stuff. I am using
> Intel FLASH 28F320 (2 interleaved 16b chips of 8MB, so we have 32bit
> buswidth) (CFI) with TMS320C5471 platform. I turnd on MTD support, so I have
> 5 partitions: bootloader (/dev/mtd0), bootloader parameters (/dev/mtd1),
> kernel image (/dev/mtd2), ROMFS SDRAM image (/dev/mtd5), primary file
> system, which is romfs (/dev/mtd3) and I want the second to be jffs2
> (/dev/mtd4):

Which kernel are you using?

> I have made jffs2 image:
>
> arm-uclinux-mkjffs2 -d ./jffsfolder -l -e 0x00020000 -o jffs2.img >/dev/null
>
> and I loaded it at addresses from 0x00800000, which correspond to fs2, i.e.
> /dev/mtd4.

Loaded it how?

josh
