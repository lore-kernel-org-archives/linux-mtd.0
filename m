Received: from smtp-out.hamburg.pop.de ([195.222.210.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17h0OH-0005JA-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 05:13:13 +0100
Message-ID: <3D61C1DE.7010202@goepel.com>
Date: Tue, 20 Aug 2002 06:13:18 +0200
From: Michael Palme <m.palme@goepel.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
CC: linux-mtd@lists.infradead.org
Subject: Re: newbie: dynamic partition creation possible
References: <3D60CEBE.7090806@goepel.com> <20020819114137.GA9858@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

thanks for the answer...

i am not sure about the terms, but i can explain what i need in more=20
clear way: i would like to have support for writing binary images into=20
the flash devices (no filesystem etc.). i need different "partitions" on=20
the flash and i dont want to hardcode that --
i have seen in cmdline.c that this is possible via kernel parameters.
i'm not absolutely sure what kernel options are needed and what are=20
unnecessary.

cheers ... Michael



J=F6rn Engel schrieb:

>On Mon, 19 August 2002 12:55:58 +0200, Michael Palme wrote:
> =20
>
>>i would like to know if it is possible to create flash dynamic=20
>>partitions (i mean other way than directly in the sources). in the howt=
o=20
>>ive read it is impossible, but in some sources i found=20
>>part_type=3D"static" -- and so i've concluded "dynamic" is also an opti=
on?=20
>>if this is possible can somebody explain the way to do it please.
>>   =20
>>
>
>What exactly do you mean by "dynamic"?
>
>There are two methods to create partitions:
>- Use a partition table parser and create a partition table.
>- Provide a mapping driver and hard-code the partition layout in the
>  driver.
>
>Do you mean partition table?
>
>J=F6rn
>
> =20
>
