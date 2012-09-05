Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9KCn-0003PK-3D
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 18:20:02 +0000
Received: by lagu2 with SMTP id u2so528625lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 11:19:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 <1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
 <1346315075.2848.538.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>
Date: Wed, 5 Sep 2012 11:19:57 -0700
Message-ID: <CAN8TOE_ax=8inGyZxS+nTfcSkskyNvHEh9ipnOTVu-moB4FqjA@mail.gmail.com>
Subject: Re: [PATCH] Test for multi-bit error correction
From: Brian Norris <computersforpeace@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 30, 2012 at 3:59 PM, Iwo Mergler
<Iwo.Mergler@netcommwireless.com> wrote:
> This tests ECC biterror recovery on a single NAND page. Mostly intended
> to test ECC hardware and low-level NAND driver.
>
> There are two test modes:

Why does this test even need to be in the kernel? Can't it be done
easily in userspace? I think it could even be a simple script that
utilizes flash_erase + nandwrite / nanddump with the -n (no ECC)
option. And anything that's lacking in nandwrite for this
functionality could easily be added there (for instance, support
erasure in nandwrite, rather than having to use flash_erase).

I would also note that this test doesn't explicitly test for bad
blocks, although it should fail when running the erase command.

> diff --git a/drivers/mtd/tests/mtd_nandbiterrs.c b/drivers/mtd/tests/mtd_nandbiterrs.c
> new file mode 100644
> index 0000000..94e908e
> --- /dev/null
> +++ b/drivers/mtd/tests/mtd_nandbiterrs.c
> @@ -0,0 +1,460 @@
...
> +static unsigned page_offset;
> +module_param(page_offset, uint, S_IRUGO);
> +MODULE_PARM_DESC(page_offset, "Page number relative to dev start");

Why use a page number? For erase, we'll be affecting many adjacent
pages, so this might be an unclear parameter to the user. Is there a
good reason not to use an entire eraseblock as the unit of test? Also,
is there a reason to use page number vs. eraseblock number vs. offset
as the input parameter?

> +static loff_t   offset;     /* Offset of the page we're using. */
> +static unsigned eraseblock; /* Eraseblock number for our page. */
> +
> +/* We assume that the ECC can correct up to a certain number
> + * of biterrors per subpage. */
> +static unsigned subsize;  /* Size of subpages */
> +static unsigned subcount; /* Number of subpages per page */
> +
> +static struct mtd_info *mtd;   /* MTD device */
> +
> +static uint8_t *wbuffer; /* One page write / compare buffer */
> +static uint8_t *rbuffer; /* One page read buffer */

Why are all of these globals? It seems like the read_page(),
write_page(), and rewrite_page() functions would be more sensible (and
safely extendible) if they had an extra parameter for the address. And
do you really need to represent the same value (offset) in three
different ways (offset, page offset, eraseblock)? In fact,

> +static int erase_block(void)

This isn't a very intuitive function prototype; I would normally
expect an address or block number parameter. Ditto for the following.
But this is just part of the argument of whether everything should be
provided as global variables...

> +/* Writes wbuffer to page */
> +static int write_page(int log)
...
> +/* Re-writes the data area while leaving the OOB alone. */
> +static int rewrite_page(int log)
...
> +/* Reads page into rbuffer. Returns number of corrected bit errors (>=0)
> + * or error (<0) */
> +static int read_page(int log)
...
> +/* Verifies rbuffer against random sequence */
> +static int verify_page(int log)

Brian
