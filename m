Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTjeJ-0008Lm-9b
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 23:56:00 +0000
Received: by vxd2 with SMTP id 2so4242383vxd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 16:55:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1307354791.3112.24.camel@localhost>
References: <20110602064832.GA7319@july> <1307115701.3069.20.camel@localhost>
	<E942AFD653C85241BF3CCD5F471BEDA203FC6E79@008-AM1MPN1-041.mgdnok.nokia.com>
	<1307354557.3112.21.camel@localhost>
	<1307354791.3112.24.camel@localhost>
Date: Tue, 7 Jun 2011 08:55:54 +0900
Message-ID: <BANLkTinPBum1WB=-tx833hj032mfs1TdVg@mail.gmail.com>
Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
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

On Mon, Jun 6, 2011 at 7:06 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Mon, 2011-06-06 at 13:02 +0300, Artem Bityutskiy wrote:
>> On Mon, 2011-06-06 at 09:42 +0000, roman.tereshonkov@nokia.com wrote:
>> > What do mean by "no case to use the subpage"?
>> >
>> > According to the spec KFM4G16Q4M-xEBx the Number of Partial Program Cy=
cles in the page (NOP)
>> > is equal to 4 -> subpage_sft=3D2.

It's really strange. Two OneNAND spec which has 4KiB pagesize say it has 1 =
NOP.

Number of Partial Program Cycles in the page (Including main and spare
area) NOP - - 1 cycles
(KFM4G16Q5M-xEBx)

that's reason I first set subpage_sft =3D 0 at original code.

The different thing between you and me is the page architecture
number. yes 4 is the correct number but 5 also has the 4KiB pagesize.
I think it's mean the manufacturing difference. can you check the
which XXnm manufacturing for your devices?
In our case. it's 3Xnm. and previous is 4Xnm.

>>
>> I thought this means "not supported by HW". But if this is supported,
>> then I'm very surprised why would we remove it. I'm dropping this patch
>> from my tree.
>
> OK, I actually did not put it to the l2 tree. And AFAICS this patch
> basically reverts commit 99b17c08bca2810f5910b3027f1b9d82edf7a576, but
> still leaves the data structures like onenand_oob_128.
>
> So NACK for this patch - poor commit message, weird changes. I'm
> surprised to see this from kmpark.

since we got some different OneNAND Spec. even though it has same 4KiB page=
size.

Thank you,
Kyungmin Park
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
