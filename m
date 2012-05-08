Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRiCb-0001YJ-M2
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 11:03:34 +0000
Message-ID: <4FA8FD24.6060908@openwrt.org>
Date: Tue, 08 May 2012 13:01:56 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: xway_nand does not build
References: <1336474838.23308.28.camel@sauron.fi.intel.com>
In-Reply-To: <1336474838.23308.28.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/05/12 13:00, Artem Bityutskiy wrote:
> Hi John,
>
> I get the following build error when building xway_nand.c:
>
> dedekind@blue:~/git/l2-mtd$ make ARCH=mips CROSS_COMPILE=mips-linux-
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   UPD     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   CC      kernel/sys.o
>   LD      kernel/built-in.o
>   LD      drivers/mtd/nand/nand.o
>   CC      drivers/mtd/nand/xway_nand.o
> drivers/mtd/nand/xway_nand.c: In function 'xway_select_chip':
> drivers/mtd/nand/xway_nand.c:78:3: error: implicit declaration of function 'ltq_ebu_w32_mask' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> make[3]: *** [drivers/mtd/nand/xway_nand.o] Error 1
> make[2]: *** [drivers/mtd/nand] Error 2
> make[1]: *** [drivers/mtd] Error 2
> make: *** [drivers] Error 2
>
> and I cannot figure out how to fix this. This build failure makes
> me really unhappy and shame on me I did not notice it before, of
> course. Would you have a fix?

Hi,

I should have spotted this myself infact. I split these patches out of a
huge series and did infact check that it builds outside the series.
looks like i missed a define. Would it be possible, that patch 4 of my
series flows via Ralfs MIPS tree ? That way we dont need to split out a
single "#define ltq_ebu_w32_mask" out of the bigger MIPS series ?

Sorry about this,
John



> I am attaching the defconfig which I used.
>
