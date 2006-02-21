Received: from wproxy.gmail.com ([64.233.184.193])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBXuf-0003We-9a
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 08:50:47 -0500
Received: by wproxy.gmail.com with SMTP id i34so245749wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Feb 2006 05:50:34 -0800 (PST)
Message-ID: <625fc13d0602210550l69546064r5562b59d05af2a3c@mail.gmail.com>
Date: Tue, 21 Feb 2006 07:50:32 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <43FB0424.1020309@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <43EB96DC.3030900@eptar.com>
	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
	<200602211140.30069.manningc2@actrix.gen.nz>
	<43FB0424.1020309@yandex.ru>
Cc: Vitaly Wool <vwool@ru.mvista.com>, William Watson <wjw1961@gmail.com>,
	yaffs@stoneboat.aleph1.co.uk, Charles Manning <manningc2@actrix.gen.nz>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/21/06, Artem B. Bityutskiy <dedekind@yandex.ru> wrote:
> Charles Manning wrote:
> > Sorry Thomas I don't buy that argument. If a system has a NAND device t=
hat
> > does have spare OOB available then it does have spare OOB and I can rel=
y on
> > that. If a NAND chip is soldered to a board, and the system exposes the=
 OOB
> > it is there. YAFFS (or whatever) can then be used on this device.
>
> I understand Thomas's point as as he is fighting for generalization.
> Indeed, this OOB stuff introduces a lot of mess.
>
> Charles' point is - if OOB is there, why not to let users use it? Also
> sounds reasonable.

But Charles also wants clean interfaces.  I agree that clean
interfaces are definitely a good thing, but trying to come up with a
clean interface for OOB access that won't get bastardized seems to be
unattainable.

> What I think would be nice to do is to get rid of OOB in MTD stuff, but
> add a possibility to access OOB via some NAND-specific interfaces from
> nand_base. Indeed, if one wants to work with a generalized flash device
> - please use MTD interface. If one still wants to access OOB, use
> lower-layer NAND interfaces. That's all about to have more then one
> layer of Generalization. And I believe this is the right way to go.

I think at some time in the not so distant future this whole
conversation will become a moot point.  SLC NAND quality seems to be
degradding as the die sizes go down, and MLC NAND is already of a
degraded quality comparitively.  Better ECC algorithms will be needed
to provide the reliability that people want and I can see that
consuming all of the available OOB area anyway.

josh
