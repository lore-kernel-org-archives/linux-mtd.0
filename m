Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0X1F-0006q4-29
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 10:02:44 +0000
Received: by wyb38 with SMTP id 38so6490146wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2010 03:02:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1285655139.2437.7.camel@localhost>
References: <20100927072431.GA32076@july> <1285655139.2437.7.camel@localhost>
Date: Tue, 28 Sep 2010 19:02:39 +0900
Message-ID: <AANLkTi=d3YZEMBMKU9-RVjXQEfF3eWGxesVJ5japEwjX@mail.gmail.com>
Subject: Re: [PATCH 0/4] MTD: OneNAND: Fix samsung SoCs various bugs
From: Kyungmin Park <kmpark@infradead.org>
To: Artem.Bityutskiy@nokia.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 28, 2010 at 3:25 PM, Artem Bityutskiy
<Artem.Bityutskiy@nokia.com> wrote:
> On Mon, 2010-09-27 at 16:24 +0900, Kyungmin Park wrote:
>> The following changes since commit 32163f4b2cef28a5aab8b226ffecfc6379a53=
786:
>> =C2=A0 Al Viro (1):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 alpha: fix usp value in multithreaded coredu=
mps
>>
>> Kyungmin Park (4):
>> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Remove unused cmd_map at s5pc110
>> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: S5PC100: Only S5PC110 use the command=
 map method
>> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: S5PC110: Fix wrong DMA hanlding when =
HIGHMEM
>> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: S5PC110: Add timeout to prevent the e=
ndless loop
>>
>> =C2=A0drivers/mtd/onenand/samsung.c | =C2=A0 45 ++++++++++++++++++++++++=
+++-------------
>> =C2=A01 files changed, 30 insertions(+), 15 deletions(-)
>
> Some patches are already in my l2-mtd-2.6.git tree, could you please
> send the series against the l2 tree so that I could apply it?

I tried to clone you tree. but it's too slow since internal network issue.
I will send it tomorrow.

Thank you,
Kyungmin Park
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
