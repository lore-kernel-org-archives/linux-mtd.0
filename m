Received: from qw-out-1920.google.com ([74.125.92.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MNjkl-0007Pu-AD
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 08:40:53 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1952830qwf.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jul 2009 01:40:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A51AD93.40903@embedded-sol.com>
References: <4A51AD93.40903@embedded-sol.com>
Date: Mon, 6 Jul 2009 14:10:45 +0530
Message-ID: <ce9ab5790907060140t33f19410ye165f567cce54be1@mail.gmail.com>
Subject: Re: Missing breaks in nand_scan_tail ?
From: vimal singh <vimal.newwork@gmail.com>
To: Felix Radensky <felix@embedded-sol.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 6, 2009 at 1:23 PM, Felix Radensky<felix@embedded-sol.com> wrote:
> Hi,
>
> In function nand_scan_tail() in switch statement
>
> switch (chip->ecc.mode) {
>
> ...
>
> }
>
> the final break is missing for NAND_ECC_HW and NAND_ECC_HW_SYNDROME cases.
>
> Is this a bug or break is omitted intentionally ?

The final break for these modes is present at line: 2715. See below:

        case NAND_ECC_HW_SYNDROME:
-
-
                if (mtd->writesize >= chip->ecc.size)
                        break;

-Vimal

>
> Thanks.
>
> Felix.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
