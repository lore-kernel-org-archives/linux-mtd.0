Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V94Wu-0003PS-Lo
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 02:40:17 +0000
Message-ID: <52099B72.8080102@freescale.com>
Date: Tue, 13 Aug 2013 10:35:30 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 02/10] mtd: add a helper to check the SLC/MLC nand chip
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-3-git-send-email-b32955@freescale.com>
 <20130813005234.GE7267@brian-ubuntu>
In-Reply-To: <20130813005234.GE7267@brian-ubuntu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8813=E6=97=A5 08:52, Brian Norris =E5=86=99=
=E9=81=93:
>> -	if (denali->nand.cellinfo&  NAND_CI_CELLTYPE_MSK&&
>> >  +	if (!nand_is_slc(&denali->nand)&&
> According to my recommendations in patch 1, this would only need to be:
>
>    if (denali->nand.bits_per_cell>  1&&  ...)
>
> IMO, that is plenty readable, then we don't need the helper.
>

The drivers may also check the SLC/MLC.

IMO, using a helper is more readable :)

Huang Shijie
