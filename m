Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NdJyw-0001fZ-A8
	for linux-mtd@lists.infradead.org; Fri, 05 Feb 2010 08:56:11 +0000
Received: by fxm28 with SMTP id 28so3909923fxm.20
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Feb 2010 00:56:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1265326257-4446-11-git-send-email-maximlevitsky@gmail.com>
References: <1265326257-4446-1-git-send-email-maximlevitsky@gmail.com>
	<1265326257-4446-11-git-send-email-maximlevitsky@gmail.com>
Date: Fri, 5 Feb 2010 09:56:02 +0100
Message-ID: <acd2a5931002050056l119844f5s30c30ccfc1a15596@mail.gmail.com>
Subject: Re: [PATCH 10/17] MTD: nand: make reads using MTD_OOB_RAW affect only
	ECC validation
From: Vitaly Wool <vitalywool@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Alex Dubov <oakad@yahoo.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	joern <joern@logfs.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 5, 2010 at 12:30 AM, Maxim Levitsky <maximlevitsky@gmail.com> w=
rote:
> This changes the behavier of MTD_OOB_RAW. It used to read both OOB and da=
ta
> to the data buffer, however you would still need to specify the dummy oob=
 buffer.
>
> This is only used in one place, but makes it hard to read data+oob withou=
t ECC
> test, thus I removed that behavier, and fixed the user.
>
> Now MTD_OOB_RAW behaves like MTD_OOB_PLACE, but doesn't do ECC validation
>
> Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
> ---
> =A0drivers/mtd/nand/nand_base.c | =A0 =A05 -----
> =A0drivers/mtd/nand/nand_bbt.c =A0| =A0 26 ++++++++++++++++++++++----
> =A0include/linux/mtd/mtd.h =A0 =A0 =A0| =A0 =A04 +---
> =A03 files changed, 23 insertions(+), 12 deletions(-)

Could you please provide a clearer description of why you think this
is necessary?

Thanks,
   Vitaly
