Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPSsO-0006Jl-96
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 06:17:24 +0000
Received: by ghbf11 with SMTP id f11so334896ghb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 23:17:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335380771-27805-7-git-send-email-mikedunn@newsguy.com>
References: <1335380771-27805-1-git-send-email-mikedunn@newsguy.com>
 <1335380771-27805-7-git-send-email-mikedunn@newsguy.com>
Date: Tue, 1 May 2012 23:17:22 -0700
Message-ID: <CAN8TOE88iOFJYQJbHY_-YdGw57zBJCBRnJU7yJweFOt01msd1A@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] mtd: nand: add sanity check of ecc strength to
 nand_scan_tail()
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
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

On Wed, Apr 25, 2012 at 12:06 PM, Mike Dunn <mikedunn@newsguy.com> wrote:
> This patch adds sanity checks that ensure that drivers for controllers wi=
th
> hardware ECC set the 'strength' element in struct nand_ecc_ctrl. =A0Also =
stylistic
> changes to the line that calculates strength for software ECC.
>
> This v2 simplifies the check. =A0Thanks Brian! [1]

Thank you for going through the review process! This series provides a
good general fix for something that's been kind of masked in hardware
like mine (which has its own threshold for suppressing bitflip
messages).

> [1] http://lists.infradead.org/pipermail/linux-mtd/2012-April/040890.html
>
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

If we're looking for Ack's to rebase with:

Acked-by: Brian Norris <computersforpeace@gmail.com>
