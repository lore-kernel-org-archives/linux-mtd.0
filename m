Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHoAw-0005pb-50
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2015 07:10:46 +0000
Received: by pdbbh15 with SMTP id bh15so88395216pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2015 00:10:25 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: Re: UBIFS errors when file-system is full
To: Richard Weinberger <richard@nod.at>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at> <55ADE0F1.9090809@gmail.com>
 <55ADE35F.6050808@nod.at>
Cc: linux-mtd@lists.infradead.org
Message-ID: <55AF41DD.2060902@gmail.com>
Date: Wed, 22 Jul 2015 12:40:21 +0530
MIME-Version: 1.0
In-Reply-To: <55ADE35F.6050808@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/21/2015 11:44 AM, Richard Weinberger wrote:

> Hi!
>
> Am 21.07.2015 um 08:04 schrieb Bhuvanchandra DV:
>> Ran the power cut tests with fm_debug enabled, no additional logs are observed.
>> After few hundred power cuts U-Boot fails to mount with -22 and kernel fails
>> mounting with stack trace when reading the node.
> Why U-Boot? Has U-Boot fastmap enabled?

Yes, fastmap is enabled in U-Boot.

The same power cut tests are done by skipping the U-Boot to mount the UBIFS. Loaded
the kernel via tftp and mount the rootfs with kernel. The power cut test passed.
I think U-Boot might have some issues, but not very sure.

>
> Anyway, we need to sort out what is going on.
> As fm_debug does not trigger it could also be a non-fastmap issue.
> Did you try your test without fastmap being enabled?
>
> Does your target pass UBI tests too?

I'm not aware of UBI tests so far the driver passed all MTD tests.
Can you please provide some pointers for UBI tests. Will run the UBI tests with
driver.

>
>> Log:
> [...]
>> [    2.847326] UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (255 but expected 3)
>> [    2.866839] UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB 981:70368, LEB mapping status 1
>> [    2.887961] Not a node, first 24 bytes:
>> [    2.891864] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................
> Hmm, LEB1 is unmapped.
> If you disable fastmap, does this target boot as expected?
> Or is this a persistent corruption?

No, the corruption is persistent.
- removed|fm_autoconvert from kernel args - removed the fastmap support from 
kernel Tested with above both cases, the corruption is persistent. |

> Thanks,
> //richard

Best regards,
Bhuvan
