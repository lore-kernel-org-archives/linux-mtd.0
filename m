Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUImQ-0004Fs-Dm
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 13:26:43 +0000
Received: by vxd2 with SMTP id 2so425822vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 06:26:40 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1307530397.31223.40.camel@localhost>
References: <20110602064832.GA7319@july> <1307115701.3069.20.camel@localhost>
	<E942AFD653C85241BF3CCD5F471BEDA203FC6E79@008-AM1MPN1-041.mgdnok.nokia.com>
	<1307354557.3112.21.camel@localhost>
	<1307354791.3112.24.camel@localhost>
	<BANLkTinPBum1WB=-tx833hj032mfs1TdVg@mail.gmail.com>
	<E942AFD653C85241BF3CCD5F471BEDA203FD21D7@008-AM1MPN1-041.mgdnok.nokia.com>
	<BANLkTi=aukCraGS1iOuemwuCvWrOaY0oxA@mail.gmail.com>
	<BANLkTin3zBCy3MFHS0Q=L4uoRyG3YERE-g@mail.gmail.com>
	<1307530397.31223.40.camel@localhost>
Date: Wed, 8 Jun 2011 22:26:40 +0900
Message-ID: <BANLkTinqVRGEnvnoM9NApO_0aXZz6H6dPg@mail.gmail.com>
Subject: Re: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
From: Kyungmin Park <kmpark@infradead.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	roman.tereshonkov@nokia.com, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 7:53 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> Hi,
>
> On Wed, 2011-06-08 at 09:59 +0900, Kyungmin Park wrote:
>> then how to detect the NOP for similar chip? Using VersionID? or
>> simply the minimum value?
>
> You are from Samsung, could you use your channels and ask your HW guys
> how to detect NOP? What is the proper way?

I really surprised when talk with H/W guy. He don't understand why the
same codes are used for Samsung mobile and Nokia.
He said it can be distinguished from printed chip number at cover. not S/W.

That's reason. don't make a different version ID or others.

P.S., I'm working for Samsung Mobile.

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
