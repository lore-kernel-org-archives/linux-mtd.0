Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbxmB-0001Gb-T7
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 16:38:08 +0000
Received: by wyf23 with SMTP id 23so1218566wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2011 09:38:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1309105616-3609-5-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309105616-3609-5-git-send-email-matthieu.castet@parrot.com>
Date: Wed, 29 Jun 2011 09:38:05 -0700
Message-ID: <BANLkTi=FGiGVgv0+_Kt3eGamEefdRtdnEQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] nand_flash_detect_onfi propagate busw info
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

On Sun, Jun 26, 2011 at 9:26 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> there is a bug in nand_flash_detect_onfi, busw need to be passed
> by pointer to return it.
>
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> ---
> =A0drivers/mtd/nand/nand_base.c | =A0 =A08 ++++----
> =A01 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Brian Norris <computersforpeace@gmail.com>
