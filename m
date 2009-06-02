Received: from yw-out-1718.google.com ([74.125.46.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MBL82-0001Pc-ON
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 03:57:41 +0000
Received: by yw-out-1718.google.com with SMTP id 9so4648443ywk.72
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Jun 2009 20:57:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243435592.11172.37.camel@localhost.localdomain>
References: <1243333454-673-1-git-send-email-vapier@gentoo.org>
	<1243435592.11172.37.camel@localhost.localdomain>
Date: Mon, 1 Jun 2009 23:57:32 -0400
Message-ID: <8bd0f97a0906012057q66472e48ode918ea4ca92224b@mail.gmail.com>
Subject: Re: [PATCH 1/2] Blackfin NFC Driver: remove pointless return value in
	bf5xx_nand_dma_rw
From: Mike Frysinger <vapier.adi@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>,
	Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 27, 2009 at 10:46, Artem Bityutskiy wrote:
> On Tue, 2009-05-26 at 06:24 -0400, Mike Frysinger wrote:
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> Signed-off-by: Bryan Wu <cooloney@kernel.org>
>> ---
>> =C2=A0drivers/mtd/nand/bf5xx_nand.c | =C2=A0 =C2=A04 +---
>> =C2=A01 files changed, 1 insertions(+), 3 deletions(-)
>
> I've taken these 2 patches to my l2-mtd-2.6.git.

looks like a typo was made when you rewrote the subject line ?
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=3Dcommit;h=3Df6f37=
99ed7d93bbfef8fc96013a22121580ee233
"NFCr" rather than "NFC" ...
-mike
