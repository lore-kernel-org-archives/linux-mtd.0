Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qa5NJ-0004PE-Vd
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 12:20:42 +0000
Received: by gxk2 with SMTP id 2so1278244gxk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 05:20:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1308917793.7715.8.camel@koala>
References: <20110622051649.GA19948@july>
	<1308917793.7715.8.camel@koala>
Date: Fri, 24 Jun 2011 21:20:38 +0900
Message-ID: <BANLkTinbS1fk=eM6=ANssed7jKih3w=vzw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: OneNAND: Detect the correct NOP when 4KiB pagesize
From: Kyungmin Park <kmpark@infradead.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	roman.tereshonkov@nokia.com, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 24, 2011 at 9:16 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2011-06-22 at 14:16 +0900, Kyungmin Park wrote:
>> From: Kyungmin Park <kyungmin.park@samsung.com>
>>
>> There are two different 4KiB pagesize chips
>> KFM4G16Q4M series have NOP 4 with version ID 0x0131
>> But KFM4G16Q5M has NOP 1 with versoin ID 0x013e
>>
>> Note that Q5M means that it has NOP 1.
>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>
> Pushed to l2-mtd-2.6.git, thanks.

Hi Artem,

It's required for s5pc110 series and supported at previous kernel, I
mean it's bug fixed.
So please merge it 3.0-rc periods

Thank you,
Kyungmin Park
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>
>
