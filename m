Received: from hermes2.tesbv.com ([188.165.42.69])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N3MfG-00046E-3X
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 04:31:14 +0000
Received: from ganga.tes (unknown [10.20.0.1])
	by hermes2.tesbv.com (Postfix) with ESMTP id DB8495C1A8
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Oct 2009 05:22:42 +0100 (CET)
Message-ID: <20091029100016.q2rdiwtp2c04g8g8@bangalore.tesbv.com>
Date: Thu, 29 Oct 2009 10:00:16 +0530
From: rithesh@tesbv.com
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS second time booting issue
References: <20091026145935.uvck3scgs8wgcc8o@bangalore.tesbv.com>
	<e8775dd00910260305v1c6ebe76t56eca8e09071e562@mail.gmail.com>
In-Reply-To: <e8775dd00910260305v1c6ebe76t56eca8e09071e562@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: thomas@tesbv.com, jobi@tesbv.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

I am able to flash the ubifs filesystem using "ubiformat" and now it =20
is booting consistently.
Please suggest me a way to flash the ubifs in a factory setup, i am =20
presently unable do this using SAM-ICE program for at91sam9260ek.

Regards,
Rithesh.M

Quoting Jason Liu <liu.h.jason@gmail.com>:

> 2009/10/26  <rithesh@tesbv.com>:
>> Hello,
>>
>> I have built a ubifs filesystem of size 8MiB. The following steps were
>> followed:
>>
>>
>> ./mkfs.ubifs -r /home/rithesh/TITAN/ubifilesystem/ -m 512 -e 15360 -c 511=
 -o
>> /tmp/ubifs.img
>>
>> ./ubinize -o /tmp/ubi.img -m 512 -s 512 -p 16384 ubinize.cfg
>>
>> My nand flash is 256MiB with the block size of 16KiB and 512 bytes of pag=
e
>> size.
>>
>> The ubinize.cfg contains the following:
>>
>> [ubifs]
>> mode=3Dubi
>> image=3D/tmp/ubifs.img
>> vol_id=3D0
>> vol_size=3D8MiB
>> vol_type=3Ddynamic
>> vol_name=3Drootfs
>> vol_flags=3Dautoresize
>>
>>
>> ISSUE:
>>
>> The ubi.img which gets generate out of the following steps is flashed and
>> the kernel comes up for the first time but fails to boot up the second ti=
me.
>>
>> Hence i have enabled the Debug message to traces the bug which points
>> towards "switching of ubifs filesystem to readonly mode" but i am not sur=
e
>> why this should happen.
>> Before switching the readonly mode the ubifs write to the flash fails
>> continues, please see the logfile =A0attached to this mail.
>>
>> Please guide me through this problem.
>>
>> Thanks and Regards,
>> Rithesh.M
>> TES Electronic Solutions(I) Pvt LTD.
>>
> What utility did you used to write the UBIFS image to NAND flash?
> Please make sure not to program the page which data is all 0xFF. Your
> issue is called by writting the page which data is all 0xFF.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
