Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPvIp-0002P2-9D
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 12:38:36 +0000
Received: by lbbgg6 with SMTP id gg6so1482632lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 05:38:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1336042485.13013.41.camel@sauron.fi.intel.com>
References: <1335939209-15625-1-git-send-email-b32955@freescale.com>
 <20120502144008.GF2194@S2101-09.ap.freescale.net>
 <1336042485.13013.41.camel@sauron.fi.intel.com>
Date: Thu, 3 May 2012 20:38:33 +0800
Message-ID: <CAAQ0ZWSxNxtF6_1+5NDqR_ry++gKbbNLZHRSTXREG18P+kQL3w@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: add device tree support for mx6q and mx28
From: Shawn Guo <shawn.guo@linaro.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3 May 2012 18:54, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2012-05-02 at 22:40 +0800, Shawn Guo wrote:
>> Hi Artem,
>>
>> As the patch heavily depends on mxs device tree branch, I think it will
>> be easier to have it go through arm-soc tree. =A0If you agree, can you
>> please give your ack if the patch looks fine to you?
>
> I do not mind if it goes via the arm-soc tree. I cannot really review
> this patch - it is too big, I think it should be split on smaller
> chunks.
>
Right.  I also think that the patch should at least be split into two,
one converts the driver to device tree and the other adds imx6q
support.  Shijie, can you do that?

Regards,
Shawn
