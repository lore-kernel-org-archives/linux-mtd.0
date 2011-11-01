Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RL3xc-0002Y4-8t
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2011 02:20:21 +0000
Message-ID: <4EAF5817.4070104@freescale.com>
Date: Tue, 1 Nov 2011 10:23:19 +0800
From: LiuShuo <b35362@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] Integrated Flash Controller support
References: <1319780403-8680-1-git-send-email-b35362@freescale.com>
	<1319979883.2126.48.camel@koala>
In-Reply-To: <1319979883.2126.48.camel@koala>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Li Yang <leoli@freescale.com>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2011=E5=B9=B410=E6=9C=8830=E6=97=A5 21:04, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> Probably some PPC mailing list should be CCed? Could you please CC at
> least LKML?
Have re-sent.
> On Fri, 2011-10-28 at 13:40 +0800, b35362@freescale.com wrote:
>> +config FSL_IFC
>> +        bool "Freescale Integrated Flash Controller support"
>> +        depends on FSL_SOC
>> +        help
>> +          Enables reporting of errors from the Freescale integrated
>> +          flash controller.  Also contains some common code used by
>> +          drivers for specific ifc controller peripherals.
> Why this cannot be a module?
Have changed it to be selected by other drivers only (NAND_FSL_IFC).
>
>> +/*
>> + * IFC Controller NAND Machine registers
>> + */
>> +struct fsl_ifc_nand {
>> +	__be32 ncfgr;
>> +	u32 res1[0x4];
>> +	__be32 nand_fcr0;
>> +	__be32 nand_fcr1;
>> +	u32 res2[0x8];
>> +	__be32 row0;
>> +	u32 res3;
>> +	__be32 col0;
>> +	u32 res4;
>> +	__be32 row1;
>> +	u32 res5;
>> +	__be32 col1;
>> +	u32 res6;
>> +	__be32 row2;
>> +	u32 res7;
>> +	__be32 col2;
>> +	u32 res8;
>> +	__be32 row3;
>> +	u32 res9;
>> +	__be32 col3;
>> +	u32 res10[0x24];
> I do not know the HW, but I wonder why some fields are __be32 and some
> are u32? What is the logic behind that?
>
These u32s are reserved space, I think it should be ok.

-LiuShuo
