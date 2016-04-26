Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auy8U-0000Xc-Bt
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 08:14:23 +0000
Reply-To: hs@denx.de
Subject: Re: [U-Boot] Porting Linux's MTD/NAND changes into U-Boot
References: <20160425164314.15c3fc94@bbrezillon>
 <20160425173646.GM3732@bill-the-cat> <571EFA04.4000803@denx.de>
 <571F16A1.70800@nod.at>
To: Richard Weinberger <richard@nod.at>
Cc: Tom Rini <trini@konsulko.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marex@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Scott Wood <oss@buserror.net>, u-boot@lists.denx.de,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Scott Wood <scottwood@freescale.com>, Alexander Kaplan <alex@nextthing.co>,
 Brian Norris <computersforpeace@gmail.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <571F2341.1090705@denx.de>
Date: Tue, 26 Apr 2016 10:13:53 +0200
MIME-Version: 1.0
In-Reply-To: <571F16A1.70800@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard,

Am 26.04.2016 um 09:20 schrieb Richard Weinberger:
> Am 26.04.2016 um 07:17 schrieb Heiko Schocher:
>> Also, as the UBI/UIFS case may show, it is not always a trivial job
>> to do such a sync, as concepts in Linux changes ...
>
> While we are at it, how do you QA?

I do some very basic ubi/ubifs tests with tbot [1] on the aristainetos2 [2]
and dxr2 board [3].

> Did you ever port port UBI or MTD tests to u-boot and let them run?

No, patches are welcome.

> Maybe there are more issues hidden which didn't came up in quick "builds and boots a kernel" tests. ;-)
> As you offer the full UBI and UBIFS feature sets advanced users may get surprised.

Yes, possible.

bye,
Heiko

[1] https://github.com/hsdenx/tbot
[2] U-Boot cyclic tests on the aristainetos2 board
     (used UBI on sf nor and nand, UBIFS on the nand, U-Boot test only)
     http://xeidos.ddns.net/buildbot/builders/ari_ubi/builds/50
[3] U-Boot / Linux UBI/UBIFS tests, last log:
     http://xeidos.ddns.net/buildbot/builders/dxr2/builds/12/steps/shell/logs/tbotlog

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
