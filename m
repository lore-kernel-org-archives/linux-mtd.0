Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu5Zc-0001Ua-Lq
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 21:26:29 +0000
Received: by wmll128 with SMTP id l128so2698231wml.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 13:26:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87ziyta2jn.fsf@belgarion.home>
References: <1446653626-14802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1446653626-14802-7-git-send-email-ezequiel@vanguardiasur.com.ar>
 <87ziyta2jn.fsf@belgarion.home>
Date: Wed, 4 Nov 2015 18:26:05 -0300
Message-ID: <CAAEAJfB2aW8OqVVJ1aXU-+4YLberrfmkyrcC0FC3dK4F_y-=_A@mail.gmail.com>
Subject: Re: [PATCH 6/6] mtd: pxa3xx_nand: Gate/ungate the NAND clock in
 suspend/resume paths
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 November 2015 at 18:16, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>> The NAND clock can be disabled on suspend and enabled on resume.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Won't registers set by firmware (IPL/SPL) be lost if you cut the clock ? =
For
> example, NDREDEL ? And if so, shouldn't they be saved upon suspend and re=
stored
> upon resume ?
>

I'd say no, because we are gating the bus clock, not the interface clock.
And in that case, my tests would have failed, and they didn't.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
