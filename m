Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5H70-00054x-VF
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 14:13:19 +0000
Received: by wibhm2 with SMTP id hm2so2332594wib.0
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 07:13:16 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH V4] mtd: m25p80: Make fast read configurable via DT
Date: Sat, 25 Aug 2012 16:06:48 +0200
References: <1345729313-10831-1-git-send-email-marex@denx.de>
 <1345899551.1815.10.camel@kyv>
In-Reply-To: <1345899551.1815.10.camel@kyv>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201208251606.48789.marex@denx.de>
Cc: robherring2@gmail.com, devicetree-discuss@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem Bityutskiy,

> On Thu, 2012-08-23 at 15:41 +0200, Marek Vasut wrote:
> > Add DT property "m25p,fast-read" that signalises the particular
> > chip supports "fast read" opcode.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > Cc: David Woodhouse <david.woodhouse@intel.com>
> 
> Does not compile if (I think) OF is not enabled.
> 
> drivers/mtd/devices/m25p80.c: In function 'm25p_probe':
> drivers/mtd/devices/m25p80.c:920:2: error: implicit declaration of function
> 'of_property_read_bool' [-Werror=implicit-function-declaration] cc1: some
> warnings being treated as errors
> make[4]: *** [drivers/mtd/devices/m25p80.o] Error 1

Argh, of course. Wrapping that part in ifdef CONFIG_OF should do the trick. So 
much for having CONFIG_OF on all the time.

Thanks!

Best regards,
Marek Vasut
