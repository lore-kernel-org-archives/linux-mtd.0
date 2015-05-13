Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsUNO-0002mt-Va
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 10:58:59 +0000
Received: by widdi4 with SMTP id di4so193007716wid.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 May 2015 03:58:37 -0700 (PDT)
Message-ID: <55532E5C.9070509@gmail.com>
Date: Wed, 13 May 2015 13:58:36 +0300
From: Michael Niarchos <michael.niarchos@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: Cannot mount ubifs partition
References: <5552EE30.8060203@gmail.com>	<5552EE77.8050202@gmail.com>
 <CAFLxGvx+dqdKPJjQx5aHkuM561WLvWR1-AYP5VGBND6JctXpFA@mail.gmail.com>
 <55530FC7.400@gmail.com> <55531046.80304@nod.at> <555311C7.8060601@gmail.com>
 <55531263.5060908@nod.at> <55531421.1030700@gmail.com>
 <5553174C.6000000@nod.at> <55531CB7.7070108@gmail.com>
 <55532493.5010407@nod.at> <5553286E.2090303@gmail.com>
 <55532AA2.5020808@nod.at>
In-Reply-To: <55532AA2.5020808@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/13/2015 01:42 PM, Richard Weinberger wrote:
> Am 13.05.2015 um 12:33 schrieb Michael Niarchos:
>> On 05/13/2015 01:16 PM, Richard Weinberger wrote:
>>> Am 13.05.2015 um 11:43 schrieb Michael Niarchos:
>>>
>>>>> BTW: Have you created the nodes by hand? Do major/minor numbers match?
>>>>>
>>>> No, I have not created the nodes by hand
>>>
>>> Please answer all my questions. Also from the other mails.
>>>
>>> Thanks,
>>> //richard

> Do the minor/major numbers match?

Yes they do match.

$ ls -l /dev/ubi0_0
crw-------    1 root     root      246,   1 May 11 16:19 /dev/ubi0_0

> Does ubiupdatevol succeed?

I run the following command:

$ ubiupdatevol /dev/ubi0_0 /tmp/zx3-image.ubifs

and nothing is printed, so I suppose that it succeeds :)

> If all ubitools work but mounting ubifs not, it is maybe an ubifs issue.
> Is the ubifs module loaded? :)

There is a problem with loading ubifs module (other modules as well)

$ modprobe ubifs
modprobe: module ubifs not found in modules.dep

I think that this is a problem of my minimal built kernel.

Michael
