Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcWGQ-0000r3-Br
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 07:36:43 +0000
Message-ID: <51933B79.5000608@freescale.com>
Date: Wed, 15 May 2013 15:38:33 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH V4 1/9] mtd: add more comment for ecc_strength/ecc_size
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>	
 <1366967337-5534-2-git-send-email-b32955@freescale.com>
 <1368602870.13665.7.camel@sauron.fi.intel.com>
In-Reply-To: <1368602870.13665.7.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8815=E6=97=A5 15:27, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Fri, 2013-04-26 at 17:08 +0800, Huang Shijie wrote:
>> Add more commit for ecc_strength and ecc_size fields.
>> We can treat the comment as the initial semantics for the two fields.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
> Huang, let me drop the 3 patches I already merged. Please, re-send them
> in v5. I think this is better because I see you start applying patches
> on top of them, which is a bit confusing.
>
Ok, Please drop the 3 patches.

>>    * @cellinfo:		[INTERN] MLC/multichip data from chip ident
>>    * @ecc_strength:	[INTERN] ECC correctability from the datasheet.
>> + *			The minimum number of bits correctability, if known;
>> + *			if unknown, set to 0.
> I find this confusing still. How about this comment.
>
> ECC correctability from the datasheet. Minumum amount of bit errors per
> @ecc_size guaranteed to be correctable). If unknown, set to zero.
>
>
it's okay to me.
>>    * @ecc_size:		[INTERN] ECC size required by the @ecc_strength,
>> - *                      also from the datasheet.
>> + *                      also from the datasheet. It is the recommende=
d ECC step
>> + *			size, if known; if unknown, set to 0.
> Silly question, why you call this one "ecc_size", and not "ecc_step"?
>
In nand_ecc_ctrl{}, the ecc step is named to @size.

Personally, i perfer to ecc_step.


thanks
Huang Shijie
