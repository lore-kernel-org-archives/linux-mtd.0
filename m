Message-ID: <1363016099.3348.47.camel@sauron.fi.intel.com>
Subject: Dead mappings and drivers in MTD
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 11 Mar 2013 17:34:59 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi MTD folks,

we have huge amount of drivers, espacially mapping drives in
'drivers/mtd', and for sure may of them are for ancient devices which
are long dead and not supported by modern kernels anyway. I would like
to do a small clean-up. It is difficult to judge which ones are dead for
me, so I am asking the community to help. Thanks!

There are few easy cases - some drivers depend on Kconfig symbols which
are not defined anywhere - I guess these are clear candidates for
removal. For example this one:

config MTD_DBOX2
        tristate "CFI Flash device mapped on D-Box2"
        depends on DBOX2 && MTD_CFI_INTELSTD && MTD_CFI_INTELEXT && MTD_CFI_AMDSTD
        help
          This enables access routines for the flash chips on the Nokia/Sagem
          D-Box 2 board. If you have one of these boards and would like to use

Grepping for "DBOX2" gives nothing.

-- 
Best Regards,
Artem Bityutskiy
