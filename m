Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=AM1EHSOBE004.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvRKE-0002MI-NI
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 10:01:47 +0000
Content-Type: text/plain; charset="utf-8"; format=flowed; delsp=yes
To: Scott Wood <scottwood@freescale.com>, Chunhe Lan <Chunhe.Lan@freescale.com>
Subject: Re: [PATCH] mtd/nand: Don't add disabled nand flash devices
References: <1313486855-15233-1-git-send-email-Chunhe.Lan@freescale.com>
	<4E4AE535.4070400@freescale.com>
Date: Mon, 22 Aug 2011 18:04:35 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
From: Lan Chunhe <b25806@freescale.com>
Message-ID: <op.v0l0xxanz91x4h@localhost.localdomain>
In-Reply-To: <4E4AE535.4070400@freescale.com>
Cc: dwmw2@infradead.org, kumar.gala@freescale.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 Aug 2011 05:46:29 +0800, Scott Wood <scottwood@freescale.com>=
  =

wrote:

> On 08/16/2011 04:27 AM, Chunhe Lan wrote:
>> Nand flash nodes with the property status=3D"disabled" are not
>> usable and so avoid adding "disabled" nand flash devices with
>> the system.
>>
>> Signed-off-by: Chunhe Lan <Chunhe.Lan@freescale.com>
>> ---
>>  drivers/mtd/nand/fsl_elbc_nand.c |    5 ++++-
>>  1 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c  =

>> b/drivers/mtd/nand/fsl_elbc_nand.c
>> index 33d8aad..8212c12 100644
>> --- a/drivers/mtd/nand/fsl_elbc_nand.c
>> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
>> @@ -1,6 +1,6 @@
>>  /* Freescale Enhanced Local Bus Controller NAND driver
>>   *
>> - * Copyright =C2=A9 2006-2007, 2010 Freescale Semiconductor
>> + * Copyright =C2=A9 2006-2007, 2010-2011 Freescale Semiconductor
>>   *
>>   * Authors: Nick Spence <nick.spence@freescale.com>,
>>   *          Scott Wood <scottwood@freescale.com>
>> @@ -849,6 +849,9 @@ static int __devinit fsl_elbc_nand_probe(struct  =

>> platform_device *pdev)
>>  	struct device *dev;
>>  	struct device_node *node =3D pdev->dev.of_node;
>>
>> +	if (!of_device_is_available(node))
>> +		return -ENODEV;
>> +
>>  	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
>>  		return -ENODEV;
>>  	lbc =3D fsl_lbc_ctrl_dev->regs;
>
> Same comment as the other patch -- unavailable devices should already
> not be getting probed.  Also, this subject line makes it sound like th=
is
> is a NAND subsystem change rather than a change in one specific driver=
.

    You are right.
    The upper layers have prevented unavailable devices.
    So, this patch is no need.

    Thanks.

    -Jack Lan

> -Scott
