Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0146-0003kf-Ps
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2013 02:36:51 +0000
Message-ID: <510735B3.1040509@freescale.com>
Date: Tue, 29 Jan 2013 10:36:35 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com>
In-Reply-To: <51073373.4080006@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8829=E6=97=A5 10:26, Vikram Narayanan =E5=
=86=99=E9=81=93:
> On 1/29/2013 7:36 AM, Huang Shijie wrote:
>> =E4=BA=8E 2013=E5=B9=B401=E6=9C=8829=E6=97=A5 01:04, Vikram Narayanan =
=E5=86=99=E9=81=93:
>>> On 1/28/2013 8:50 AM, Huang Shijie wrote:
>>>> =E4=BA=8E 2013=E5=B9=B401=E6=9C=8828=E6=97=A5 10:39, Vikram Narayana=
n =E5=86=99=E9=81=93:
>>>>> Hello Huang,
>>>>>
>>>>> On 1/21/2013 7:42 AM, Huang Shijie wrote:
>>>>>> =E4=BA=8E 2013=E5=B9=B401=E6=9C=8819=E6=97=A5 00:52, Vikram Naraya=
nan =E5=86=99=E9=81=93:
>>>>>>> Hi,
>>>>>>>
>>>>>>> When I try to run the mtd_oobtest on an i.Mx6Q board, it results=20
>>>>>>> in a
>> Which mx6q' board are you using? the mx6q-arm2 or mx6q-ard?
>
> I'm using a custom board.
ok.
>
>> The kernel only supports the mx6q-arm2 now.
>
> May I know in what way the driver is restricted for using with other=20
> boards?
The devicetree. Please check the dts file in arch/arm/boot/dts/.
If there is no dts file for your board, the gpmi will not works very=20
well for your board.
for example, there is arch/arm/boot/dts/imx6q-arm2.dts for the MX6Q-ARM2=20
board.

>
>>>
>>> Toshiba, 4 Gbit, (4096 +224) bytes =C3=9764 pages =C3=972048blocks
>>
>> The Toshiba's nand is not well supported by the kernel.
>> Are you sure the kernel parse out the correct geometry for the toshiba=
's
>> nand?
>> Please recheck the page size and oob size with "mtdinfo /dev/mtd0".
>>
>
> You're right and we knew it earlier as the Kernel detects the OOB size=20
> as 128 bytes. So, some remaining bytes become unused at the end of=20
> each page. i.e., (224-128). Instead of supporting ecc strength as ECC9=20
> we end up using ECC8. Should this be a cause for the -74 error?
no. this is not the cause. even you get the wrong geometry of the nand=20
chip. the gpmi still can works.

I think the root cause is the devicetree issue as above.

thanks
Huang Shijie
>
> Regards,
> Vikram
>
