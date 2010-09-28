Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0Ud5-0002m8-3t
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 07:29:36 +0000
Received: by pzk32 with SMTP id 32so1959204pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2010 00:29:33 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1285655337.2437.13.camel@localhost>
References: <20100927100143.GA17778@july> <1285655337.2437.13.camel@localhost>
Date: Tue, 28 Sep 2010 16:29:33 +0900
Message-ID: <AANLkTinF0JFpjVd8zWRzFYH3xarC8uu7ONEeQN+Z45um@mail.gmail.com>
Subject: Re: [PATCH] MTD: OneNAND: S5PC110: Implement DMA interrupt method
From: Kyungmin Park <kmpark@infradead.org>
To: Artem.Bityutskiy@nokia.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 28, 2010 at 3:28 PM, Artem Bityutskiy
<Artem.Bityutskiy@nokia.com> wrote:
> On Mon, 2010-09-27 at 19:01 +0900, Kyungmin Park wrote:
>> From: Kyungmin Park <kyungmin.park@samsung.com>
>>
>> Implement DMA interrupt method. previous time it polls the DMA status.
>> It can reduce the CPU power but decrease the performance a little.
>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>
> Does not apply to the l2 tree. Also it is not clear at all whether it
> depends on the previous series or it is completely independent. Please,
> re-send with the other patches which I did not take yet.

It's dependent on previous patches, I think these patches including
previous are for 2.6.37.
Okay I'll re-send based on l2 tree.

Thank you,
Kyungmin Park

>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
