Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQwmV-0007uW-N6
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 10:34:33 +0000
Message-ID: <532C15EB.9010600@freescale.com>
Date: Fri, 21 Mar 2014 18:35:23 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: gpmi: add gpmi_devdata{} to simplify the code
References: <1395397179-17449-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB4ECF@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB4ECF@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2014=E5=B9=B403=E6=9C=8821=E6=97=A5 18:29, Gupta, Pekon =E5=86=99=
=E9=81=93:
> Ezequiel has got approval for 2 new generic MTD bindings (refer l2-mtd.=
git)
> 	commit 8dd49165ef5f46b5ad9ba296c559ccff315f9421
> 	mtd: nand: Add a devicetree binding for ECC strength and ECC step size
> So, I think<1>  can be replaced by "nand-ecc-strength".
>
>
"nand-ecc-strength" is add the ECC strength for the NAND, but my patch=20
is add
the maximum ECC strength the BCH controller can support.

they are different things.
>> >
>> >    [2] add the gpmi_devdata_imx{23|28|6q} to replace the gpmi_ids.
>> >
> Can you use "compatible" string in DT for this ?
>
>
sorry, could you please give me an example?

I do not know what's your meaning. :(

thanks
Huang Shijie
