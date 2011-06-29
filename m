Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbxnT-0002WW-Fy
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 16:39:28 +0000
Received: by wyf23 with SMTP id 23so1218211wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2011 09:37:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1309105616-3609-6-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309105616-3609-6-git-send-email-matthieu.castet@parrot.com>
Date: Wed, 29 Jun 2011 09:37:39 -0700
Message-ID: <BANLkTinwT=63yoqfJnab6RUSB4wL-92iEg@mail.gmail.com>
Subject: Re: [PATCH 6/6] add NAND_BUSWIDTH_AUTO
From: Brian Norris <computersforpeace@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a few comments below.

On Sun, Jun 26, 2011 at 9:26 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3096,11 +3096,16 @@ ident_done:
...
> + =A0 =A0 =A0 if (chip->options & NAND_BUSWIDTH_AUTO) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(chip->options & NAND_BUSWIDTH_16);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->options |=3D busw;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand_set_defaults(chip, busw);
> + =A0 =A0 =A0 }

Doesn't this get called after nand_set_defaults() is already called?
(see nand_scan_ident) If so, then changing the buswidth here won't
actually affect any of the function assignments. That's probably not
your expected behavior, is it?

> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -240,6 +240,11 @@ typedef enum {
...
> +/* autodetect nand buswidth with readid. This suppose the driver will
> + * configure the hardware has 8 bit in nand_scan_ident, and update
> + * configuration before calling nand_scan_tail
> + */

This is not the correct multi-line comment format.

> +#define NAND_BUSWIDTH_AUTO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x020=
00000

I recently did some revamping of a lot of these flags, so the
numbering has all changed in Artem's staging tree, l2-mtd-2.6.git.
Assuming both our patches are taken into mainline, it'd probably be
good if you rebased on the l2 tree and choose a new bit value for this
flag. AFAICT it'd be good like:

+#define NAND_BUSWIDTH_AUTO                     0x00080000

Brian
