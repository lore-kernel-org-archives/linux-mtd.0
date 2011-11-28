Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RV8xF-0000lp-Uu
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 21:41:38 +0000
Message-ID: <4ED3FFFC.50807@freescale.com>
Date: Mon, 28 Nov 2011 15:41:16 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: LiuShuo <b35362@freescale.com>
Subject: Re: [PATCH v3 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
References: <1321349355-1639-1-git-send-email-b35362@freescale.com>
 <1321349355-1639-2-git-send-email-b35362@freescale.com>
 <1321349355-1639-3-git-send-email-b35362@freescale.com>
 <4ECC368C.3010801@freescale.com> <4ECCE393.2030600@freescale.com>
In-Reply-To: <4ECCE393.2030600@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Liu Shuo <Shuo.Liu@freescale.com>,
 Shengzhou Liu <Shengzhou.Liu@freescale.com>, linux-mtd@lists.infradead.org,
 akpm@linux-foundation.org, leoli@freescale.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/23/2011 06:14 AM, LiuShuo wrote:
> =E4=BA=8E 2011=E5=B9=B411=E6=9C=8823=E6=97=A5 07:55, Scott Wood =E5=86=99=
=E9=81=93:
>> On 11/15/2011 03:29 AM, b35362@freescale.com wrote:
>>> From: Liu Shuo<b35362@freescale.com>
>>>
>>> -        if (elbc_fcm_ctrl->oob || elbc_fcm_ctrl->column !=3D 0 ||
>>> +        if (elbc_fcm_ctrl->column>=3D mtd->writesize) {
>>> +            /* write oob */
>>> +            if (priv->page_size>  1) {
>>> +                /* when pagesize of chip is greater than 2048,
>>> +                 * we have to write full page to write spare
>>> +                 * region, so we fill '0xff' to main region
>>> +                 * and some bytes of spare region which we
>>> +                 * don't want to rewrite.
>>> +                 * (write '1' won't change the original value)
>>> +                 */
>>> +                memset(elbc_fcm_ctrl->buffer, 0xff,
>>> +                        elbc_fcm_ctrl->column);
>> I don't like relying on this -- can we use RNDIN instead to do a
>> discontiguous write?
>>
> I have no better way to implement it now.
> Some chips have 'NOP' limitation, so I don't use the FIR_OP_UA to do a
> oob write.

I don't think each RNDIN counts separately against NOP (someone correct
me if I'm wrong).  You're writing discontiguous regions of the page in
one operation.

-Scott
