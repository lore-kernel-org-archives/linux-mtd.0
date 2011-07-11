Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qg4jc-0003if-DA
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2011 00:52:29 +0000
Received: by vxd3 with SMTP id 3so2987628vxd.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jul 2011 17:52:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOS=UCWrc=Zk3usT=5yLect2kncniuBkDC8eenYj=Byt+7=p5g@mail.gmail.com>
References: <CAOS=UCWrc=Zk3usT=5yLect2kncniuBkDC8eenYj=Byt+7=p5g@mail.gmail.com>
Date: Mon, 11 Jul 2011 08:52:25 +0800
Message-ID: <CAOS=UCWE9jBNyEhO-a7=kGnHuEKhMWVWw14ecMKXrEnRqNYBYQ@mail.gmail.com>
Subject: Re: Cramfs: bad root offset issue
From: Qi Zhang <qzhan2009@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nevermind, I just found I was using a customized version of cramfs
thanks.

On Mon, Jul 4, 2011 at 3:53 PM, Qi Zhang <qzhan2009@gmail.com> wrote:
> Hello:
>
> =A0 I'm usinig mkfs.cramfs to generate a simple filesystem
> =A0 # mkdir test
> =A0 # cd test
> =A0 # touch a
> =A0 # cd ..
> =A0 # mkfs.cramfs test test.bin
>
> =A0 Then I burn it to a NAND flash partitions
> =A0 =A0The nand flash page size is 2k. and my platform is android 2.1
> with the kernel version 2.6.29 like.
> =A0 =A0During mount I got below information:
>
> =A0 =A0cramfs: bad root offset 262276752
> =A0 =A0mount: mounting /dev/mtdblock4 on /mnt failed: Invalid argument
>
> =A0 =A0Any one can help me? thanks!
>
> Regards
> Zhang Qi
>
