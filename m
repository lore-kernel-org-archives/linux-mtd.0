Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P9Agp-0004jT-2q
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 06:01:21 +0000
Subject: Re: [PATCH v4 5/5] mtd: m25p80: add support to parse the partitions
	by OF node
MIME-Version: 1.0 (Apple Message framework v1081)
Content-Type: text/plain; charset="us-ascii"
From: Kumar Gala <kumar.gala@freescale.com>
In-Reply-To: <1287301490.1951.0.camel@localhost>
Date: Fri, 22 Oct 2010 01:01:12 -0500
Content-Transfer-Encoding: quoted-printable
Message-ID: <3AE1F37D-F328-40EF-8B35-F94CC074D384@freescale.com>
References: <1286878714-13090-1-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-2-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-3-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-4-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-5-git-send-email-Mingkai.hu@freescale.com>
	<1286878714-13090-6-git-send-email-Mingkai.hu@freescale.com>
	<1287256647.1781.34.camel@brekeke>
	<AANLkTimr03KAKnz5sfwm19=KzB-ik95WM_qQO0YP9qVs@mail.gmail.com>
	<1287301490.1951.0.camel@localhost>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: dedekind1@gmail.com, David Brownell <david-b@pacbell.net>,
	Linuxppc-dev list <linuxppc-dev@ozlabs.org>, linux-mtd@lists.infradead.org,
	spi-devel-general@lists.sourceforge.net,
	Mingkai Hu <Mingkai.hu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Oct 17, 2010, at 2:44 AM, Artem Bityutskiy wrote:

> On Sat, 2010-10-16 at 19:05 -0600, Grant Likely wrote:
>> On Sat, Oct 16, 2010 at 1:17 PM, Artem Bityutskiy =
<dedekind1@gmail.com> wrote:
>>> On Tue, 2010-10-12 at 18:18 +0800, Mingkai Hu wrote:
>>>> Signed-off-by: Mingkai Hu <Mingkai.hu@freescale.com>
>>>> Acked-by: Grant Likely <grant.likely@secretlab.ca>
>>>> ---
>>>> v4:
>>>> - Updated to latest kernel base(Linux 2.6.36-rc7).
>>>> - Made changes according to Grant's comments.
>>>=20
>>> Looks good to me, pushed to l2-mtd-2.6.git, thanks.
>>=20
>> Wait!  It will break whenever CONFIG_OF is not set.  I broke
>> linux-next with this patch.  It can be solved by wrapping the block
>> with #ifdef CONFIG_OF, but I'd like to find a better solution.
>=20
> OK, removed.

Grant, poke.  Would like to see this either resolved or have this patch =
go in for .37 w/CONFIG_OF and fix properly for .38.

- k=
