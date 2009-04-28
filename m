Received: from djurbala-pt.tunnel.tserv2.fmt.ipv6.he.net
	([2001:470:1f01:ffff::eb] helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lyooa-0001fc-I6
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 15:01:48 +0000
Message-Id: <982CAD05-5F4A-4A33-B991-16162CFFE1D8@kernel.crashing.org>
From: Kumar Gala <galak@kernel.crashing.org>
To: =?ISO-8859-1?Q?Rog=E9rio_Brito?= <rbrito@ime.usp.br>
In-Reply-To: <20090428144814.GA14926@ime.usp.br>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v930.3)
Subject: Re: [PATCH] powerpc: minimizing the configuration of
	linkstation_defconfig
Date: Tue, 28 Apr 2009 09:54:27 -0500
References: <20090424065816.GA15525@ime.usp.br>
	<Pine.LNX.4.64.0904242158210.8309@axis700.grange>
	<20090424223355.GB7858@ime.usp.br>
	<2CE2BC61-1C6B-4D01-870B-BC460730AD79@kernel.crashing.org>
	<20090428022711.GA30538@ime.usp.br>
	<F78629F9-59D2-4974-8461-06B7FAC2625D@kernel.crashing.org>
	<20090428144814.GA14926@ime.usp.br>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Apr 28, 2009, at 9:48 AM, Rog=E9rio Brito wrote:

> On Apr 28 2009, Kumar Gala wrote:
>> I'm pretty sure we need this for old initrd style ramdisks so I'd =20
>> prefer
>> we leave it enabled.
>
> Oh, for oldstyle it is needed. You're right. It is better to keep it =20=

> in
> the defconfig. Just drop the hunk from the patch that I sent you.

just send a new patch w/this fixed.

- k=
