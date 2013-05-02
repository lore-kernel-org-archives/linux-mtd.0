Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXjR9-0008Tw-FT
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 02:39:59 +0000
Message-ID: <5181D25C.2080001@freescale.com>
Date: Thu, 2 May 2013 10:41:32 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: nand_base: fix for ONFI chips that do not support GET/SET FEATURES
References: <CACwUX0NbKtBCFrjKBFd307D6=EbBZQbE4w25GSAzop0FsBM2LQ@mail.gmail.com>	<5181CF32.1090502@freescale.com>
 <CACwUX0M_CGStWih0qcR_8na-yMmvHrAaHxpYe4Y_Q5mx+jno+g@mail.gmail.com>
In-Reply-To: <CACwUX0M_CGStWih0qcR_8na-yMmvHrAaHxpYe4Y_Q5mx+jno+g@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA05=D4=C202=C8=D5 10:34, David Mosberger-Tang =D0=B4=B5=C0=
:
> +	    !(le16_to_cpu(chip->onfi_params.opt_cmd) & 4))
it's better to add a macro to replace the hardcore '4', such as

#define ONFI_OPT_CMD_SET_GET_FEAT (1 << 2)

Just a suggestion. :)

thanks
Huang Shijie
