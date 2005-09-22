Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EINYW-0001Cr-Rq
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 05:40:22 -0400
Message-ID: <43327C07.6020506@inf.u-szeged.hu>
Date: Thu, 22 Sep 2005 11:40:23 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <20050921211326.GK8421@lunn.ch>
	<43324D42.5060407@yandex.ru>	<20050922064104.GM8421@lunn.ch>
	<43325439.1060307@yandex.ru>
In-Reply-To: <43325439.1060307@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: Andrew Lunn <andrew@lunn.ch>, Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Another compiler error: sumtool.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrew,

Thanks for warning. You are right, making target_endian to non-static is
a correct fix. I've commited it. We are using GCC 3.3.5, and it did not
warned us. I suppose you use newer GCC.

Artem B. Bityutskiy wrote:

> Andrew Lunn wrote:
>
>> Could you define small.
>
> No, I cannot. This must be found out experimentally. I just warned you
> about possible EBS effect.
>
>> I will be checking this anyway. I need to improve the mount time
>> performance of eCos's version of JFFS2. For the system i'm working on
>> now the eCos redboot loader has JFFS2 from CVS from a year or so
>> ago. It takes four or five times longer to mount the filesystem than
>> the JFFS2 code in the Linux 2.4.x version of the kernel redboot is
>> booting. For the particular application this device is being used in i
>> need very fast boot times and currently the RedBoot JFFS2 mount is the
>> bottleneck. So i was hopeing that bringing JFFS2 up to date in eCos's
>> Redboot and adding EBS might match the performance of the old 2.4.x
>> code. Testing will soon tell.
>
>
> EBS makes mount really faster. But then the JFFS2 checker is working,
> and in case of NOR+EBS it will work longer and eat more CPU. JFFS2
> writers are blocked while the checker is working, so it may slow down
> the boot process. That's the theory, experiments are needed.
>
Artem, I think you have a little bit negative attitude against
summary/EBS. :) You are right, we should write docs for summary, and we
will do it soon.

Just for information: EBS was mainly designed for NAND, because JFFS2
was designed for NOR, and produces very very slow mounting on big NAND
chips. The idea is simple, and it seems to cause mount speed up at NOR,
too. We've got many positive feedbacks. The price of the using EBS at
NOR is to disable the obsolating method of NOR and apply the one used on
NAND. I don't think it cause too much CPU penalty in normal usage, at
least nobody complained of it.

Bye,
Ferenc
