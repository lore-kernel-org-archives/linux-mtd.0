Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OAK87-0006vQ-OC
	for linux-mtd@lists.infradead.org; Fri, 07 May 2010 09:46:00 +0000
Received: by wwf26 with SMTP id 26so647476wwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 May 2010 02:45:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910FDF51E19@SJEXCHCCR01.corp.ad.broadcom.com>
References: <i2z804f0d21005060530qb2a65906j62e68c9f6f5e90bc@mail.gmail.com>
	<B125D8217ABC4B43826503DE00A2D44910FDF51E19@SJEXCHCCR01.corp.ad.broadcom.com>
Date: Fri, 7 May 2010 11:45:57 +0200
Message-ID: <r2m804f0d21005070245p46f7ab7aoa182a1c5316f7b3f@mail.gmail.com>
Subject: Re: <4>mtd->read(x bytes from y) returned ECC error / Node header CRC
	failed / READ error
From: Arno Steffen <arno.steffen@googlemail.com>
To: Darwin Rambo <drambo@broadcom.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for this tip!

For the first I have mounted the jffs2 (rootfs) as read only
(confirmed by a "VFS: Mounted root (jffs2 filesystem) readonly
message").
The behaviour is still the same. So does it makes a difference to set
WriteProtection?
The other question - if this is some selfhealing issue (as messages
dissapear in next boot), why it will not try to heal itself right on
time? Is it possible to force this?
I cound't found a fitting option in kernel config (at least not one I
would understood).

Regards
Arno


2010/5/6 Darwin Rambo <drambo@broadcom.com>:
> Some flashes have write-protect (WP) pins that can be strapped to prevent writing as the power is being lost. This dramatically reduces flash corruption on power cycles.
>
> Darwin
>
>> -----Original Message-----
>> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
>> bounces@lists.infradead.org] On Behalf Of Arno Steffen
>> Sent: Thursday, May 06, 2010 5:31 AM
>> To: linux-mtd@lists.infradead.org
>> Subject: <4>mtd->read(x bytes from y) returned ECC error / Node header
>> CRC failed / READ error
>>
>> After some powercycles I get sometimes messages like this:
>>
>> uncorrectable error : <3>uncorrectable error : <4>mtd->read(0x3f8
>> bytes from 0x25d8408) returned ECC error
>> JFFS2 notice: (220) jffs2_get_inode_nodes: Node header CRC failed at
>> 0x25d8408. {ffe0,ffe0,ffe0ffe0,ffe0ffe0}
>>
>> I do check a 30MB file wether it contains the original information,
>> but reading/compare give holes of 2048bytes which gives "0" instead of
>> its content.
>>
>> I don't access the jffs-fs with writes, just boot and read some files.
>>
>> In the next reboot everything is fine again. So what can I do, to
>> prevent this?
>>
>> Or who can I ask? I am lost.
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>
