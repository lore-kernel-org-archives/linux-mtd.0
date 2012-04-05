Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFtnE-00021K-R3
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2012 21:00:37 +0000
Received: by bkcjk13 with SMTP id jk13so2204153bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Apr 2012 14:00:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5D308BD40154E4439D82454FE483A50206619BAA@EVS4.nam.ci.root>
References: <5D308BD40154E4439D82454FE483A50206619995@EVS4.nam.ci.root>
 <4F7DEF7A.1090100@gmail.com>
 <5D308BD40154E4439D82454FE483A50206619BAA@EVS4.nam.ci.root>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 5 Apr 2012 17:00:09 -0400
Message-ID: <CAMjpGUcNA5rCxAsxFhFE6QFiGw7puUJ8kdFtcjhvi81nKtwG=w@mail.gmail.com>
Subject: Re: nanddump shows all bad blocks
To: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 5, 2012 at 15:38, Bishop, Mark wrote:
>> Sounds as if the kernel is using a different ECC method to read the
>> data than what u-boot used to write it...
>
> This has nothing to do with the internal ECC being turned on or off on
> the part?

if you're booting off the nand on the bf52x/bf54x, you should enable
CONFIG_BFIN_NFC_BOOTROM_ECC in u-boot and
CONFIG_MTD_NAND_BF5XX_BOOTROM_ECC in the kernel.

if you aren't booting off the nand, you should disable both.

hardware vs software ecc shouldn't matter.  but don't quote me on that :p.

switching between the two modes is easiest by going into u-boot and
running "nand scrub".  obviously that'll erase your nand in the
process, but so it goes ;).
-mike
