MIME-Version: 1.0
In-Reply-To: <4E5712C1.4010007@freescale.com>
References: <1314169643-23425-1-git-send-email-b32955@freescale.com>
	<1314272249.18988.55.camel@sauron> <4E5712C1.4010007@freescale.com>
Date: Fri, 26 Aug 2011 15:35:01 +0200
Message-ID: <CAHMSPgNTnsVwJegkf-CYp1GCpADBdXSqtZiaRg7Y-=Fz8eT2HA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] add the GPMI-NAND support for imx23/imx28
From: Koen Beel <koen.beel.barco@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested-by: Koen Beel <koen.beel@barco.com>

On Fri, Aug 26, 2011 at 5:28 AM, Huang Shijie <b32955@freescale.com> wrote:
> Hi Sascha:
>>
>> On Wed, 2011-08-24 at 15:07 +0800, Huang Shijie wrote:
>>>
>>> The patch set is based on tag v3.1-rc2 of linus's tree.
>>> and it can be git-am to Artem's tree:
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0http://git.infradead.org/users/dedekind/l2-m=
td-2.6.git
>>>
>>> The general-purpose media interface(GPMI) controller is a flexible
>>> interface
>>> to up to several NAND flashs.
>>>
>>> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC
>>> accelerator.
>>>
>>> With the help of BCH, the GPMI controller can choose to do the hardware
>>> ECC or
>>> not.
>>
>> I thought that this series will go in via an imx sub-tree. If you want
>> it to go via the mtd tree, we'd need blessing from the imx subtree
>> maintainer, I think.
>>
> Could you accept this patch set? or I have to make some further changes
> about it.
>
> Thanks.
>
> Huang Shijie
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
