Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUAFQ-00078o-Rx
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 06:29:09 +0000
Message-ID: <5174D916.5010901@freescale.com>
Date: Mon, 22 Apr 2013 14:30:46 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 05/11] mtd: add a helper to get the supported features
 for ONFI nand
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>	<1363605534-24776-6-git-send-email-b32955@freescale.com>
 <CAN8TOE8RWRUtuAf05dOu+1KZg86HFrLOMPWt0VAeUAKtsXFTQA@mail.gmail.com>
In-Reply-To: <CAN8TOE8RWRUtuAf05dOu+1KZg86HFrLOMPWt0VAeUAKtsXFTQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, matthieu.castet@parrot.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8822=E6=97=A5 12:29, Brian Norris =E5=86=99=
=E9=81=93:
>> +/* return the supported features. */
>> >  +static inline int onfi_get_feature(struct nand_chip *chip)
> This function naming seems too close to the chip->onfi_get_features
> function pointer. They serve totally different purposes (I think) and
> should clearly be shown to be different in some way--preferably by
> naming.
>
ok.

what's about onfi_feature()?

Remove the "get" from the function name.

thanks
Huang Shijie
