Received: from mail.free-electrons.com ([88.190.12.23])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScLe2-00059q-OU
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 19:11:51 +0000
Received: from skate (AToulouse-555-1-5-124.w92-156.abo.wanadoo.fr
 [92.156.88.124])
 by mail.free-electrons.com (Postfix) with ESMTPSA id 5B26AE5
 for <linux-mtd@lists.infradead.org>; Wed,  6 Jun 2012 21:11:31 +0200 (CEST)
Date: Wed, 6 Jun 2012 21:11:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Q: Cramfs Vs. Ubifs
Message-ID: <20120606211125.62aba982@skate>
In-Reply-To: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
Mime-Version: 1.0
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

Hello,

Ricard has already answered your points, but I felt that adding an
additional detail would be useful. See below.

Le Mon, 4 Jun 2012 21:17:34 +0200,
Ran Shalit <ranshalit@gmail.com> a =C3=A9crit :

> I read about cramfs and ubifs, but there is still something I don't
> understand here, I hope you can help me with that...
> 1. It seems reasonable that execution from RAM is faster then Nand flash.
>     So If I'm using ubifs, should I copy the executables to RAM before ex=
ecute ?

This is not needed. The Linux kernel uses the MMU to do demand paging
so load on demand into RAM the portions of the program that are
actually being used. So Linux userspace applications are always
executed from RAM (unless, as Ricard pointed out, you use some XIP
mechanism, but that requires NOR flash and special filesystems, so it's
a very uncommon situation these days). However, an application is not
completely loaded at once at the beginning of its execution, parts of
it are loaded on demand during the execution.

Best regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
