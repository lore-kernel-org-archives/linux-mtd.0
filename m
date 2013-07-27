Received: from mail-vb0-x233.google.com ([2607:f8b0:400c:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3A9R-00024s-Tb
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2013 19:27:38 +0000
Received: by mail-vb0-f51.google.com with SMTP id x16so311542vbf.38
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 12:27:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1374891256-20248-2-git-send-email-akinobu.mita@gmail.com>
References: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
 <1374891256-20248-2-git-send-email-akinobu.mita@gmail.com>
Date: Sat, 27 Jul 2013 12:27:16 -0700
Message-ID: <CAN8TOE987JxGfj-O5NxVCOCVkjsiFy2pRuNMaY3m6+mHdvqtnA@mail.gmail.com>
Subject: Re: [PATCH -next 1/7] mtd: tests: introduce mtd_test module
From: Brian Norris <computersforpeace@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 26, 2013 at 7:14 PM, Akinobu Mita <akinobu.mita@gmail.com> wrote:
> This introduces mtd_test module which contains the following functions
> used by several mtd/tests modules.
>
> - mtdtest_erase_eraseblock()
> - mtdtest_scan_for_bad_eraseblocks()
> - mtdtest_erase_whole_device()
>
> This mtd_test module also provides the following wrapper functions for
> mtd_read() and mtd_write() in order to simplify the return value check
> in mtd/tests modules.
>
> - mtdtest_read()
> - mtdtest_write()
>
> These functions will be used for reducing code duplication among
> mtd/tests modules later.

I like this idea. There is definitely too much code duplication.

However, there is an important tradeoff here: now to run these (very
simple) tests, we have a two-step process*:

insmod mtd_test.ko
insmod mtd_<actualtest>.ko dev=<MTD>

[* modprobe would solve this problem, but these tests are often
compiled and run by hand, sometimes on systems without the convenience
of modprobe ]

We could still accomplish the reduction in (source) code duplication
by simply including these simple routines in a header, then the code
would be compiled into each test module. I realize this isn't
typically the "best" way to share code, but since these are just test
modules and really don't need to be optimized for code size, I think
it is worth avoiding the extra step of inserting another module.

> ---
>  drivers/mtd/tests/Makefile   |   1 +
>  drivers/mtd/tests/mtd_test.c | 117 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/tests/mtd_test.h |  11 ++++
>  3 files changed, 129 insertions(+)
>  create mode 100644 drivers/mtd/tests/mtd_test.c
>  create mode 100644 drivers/mtd/tests/mtd_test.h

If we still keep the mtd_test module separate, I might rename it to
help distinguish it from any of the other modules, which actually run
tests. Perhaps include "lib" in the name? Like "libmtdtest.{c,h}"?

> diff --git a/drivers/mtd/tests/mtd_test.c b/drivers/mtd/tests/mtd_test.c
> new file mode 100644
> index 0000000..1fa1d63
> --- /dev/null
> +++ b/drivers/mtd/tests/mtd_test.c
> @@ -0,0 +1,117 @@
...
> +MODULE_LICENSE("GPL");

If we're keeping this as a module, we might want at least a
MODULE_DESCRIPTION (to help a user understand why they need this extra
module) and possibly a MODULE_AUTHOR?

Brian
