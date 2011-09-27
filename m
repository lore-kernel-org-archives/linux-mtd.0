Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R8XCS-0002XC-Fc
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2011 12:55:53 +0000
Received: by wyi11 with SMTP id 11so6789689wyi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Sep 2011 05:55:49 -0700 (PDT)
Subject: Re: [PATCH V5] mtd: Add DiskOnChip G3 support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 27 Sep 2011 15:58:37 +0300
In-Reply-To: <1316805250-11105-1-git-send-email-robert.jarzmik@free.fr>
References: <1316702729.4849.114.camel@sauron>
	<1316805250-11105-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1317128326.6207.30.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-09-23 at 21:14 +0200, Robert Jarzmik wrote:
> Add support for DiskOnChip G3 chips. The support is quite
> limited yet :
>  - no flash writes/erases are implemented
>  - ECC fixes are not implemented
>  - powerdown is not implemented
>  - IPL handling is not yet done
> 
> On the brighter side, the chip reading does work.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Sparse complains:

[dedekind@sauron l2-mtd-2.6 (master)]$ make C=1
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHECK   drivers/mtd/devices/docg3.c
drivers/mtd/devices/docg3.h:217:21: error: dubious one-bit signed bitfield

And indeed:

        int device_id:4;
        int if_cfg:1;

should be unsigned int bit-fields, not signed.

-- 
Best Regards,
Artem Bityutskiy
