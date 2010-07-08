Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWfJi-0008Ji-SH
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 00:50:20 +0000
Received: by pwj7 with SMTP id 7so122269pwj.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jul 2010 17:50:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1276352819.19028.123.camel@localhost>
References: <20100528020311.GA1608@july> <1276352819.19028.123.camel@localhost>
Date: Thu, 8 Jul 2010 09:50:17 +0900
Message-ID: <AANLkTilrYbbvRcIm0qwbZXQgB0wcmNxgPo0l_aZl8lu5@mail.gmail.com>
Subject: Re: [PATCH] OneNAND: Introduce chip_probe function
From: Kyungmin Park <kmpark@infradead.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Can merge it next merge window. It's clean method for samsung socs and
no functional changes for others.

Thank you,
Kyungmin Park

On Sat, Jun 12, 2010 at 11:26 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Fri, 2010-05-28 at 11:03 +0900, Kyungmin Park wrote:
>> Samsung SoCs use the own OneNAND controler and detect OneNAND chip at po=
wer on.
>> To use this feature, introduce the chip_probe function.
>>
>> Also remove workaround for Samsung SoCs.
>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>
> Pushed both to my l2-mtd-2.6.git / dunno.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
