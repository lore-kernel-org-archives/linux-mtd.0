Received: from mail-bw0-f159.google.com ([209.85.218.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LoH2A-0000Oc-Ti
	for linux-mtd@lists.infradead.org; Mon, 30 Mar 2009 12:56:18 +0000
Received: by bwz3 with SMTP id 3so2077399bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Mar 2009 05:56:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49CB7AEA.2000009@gmail.com>
References: <62cbdcd90903260402q61725160v7f1538762fbd76bc@mail.gmail.com>
	<49CB7AEA.2000009@gmail.com>
Date: Mon, 30 Mar 2009 14:56:06 +0200
Message-ID: <62cbdcd90903300556hb66dca5u94e1d52b67c85240@mail.gmail.com>
Subject: Re: [PATCH] Fixup for Numonyx M29W128 chips
From: massimo cirillo <maxcir@gmail.com>
To: Darius Augulis <augulis.darius@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,
We performed a complete validation test session on this device,
using jffs2 in the 2.6.26.1 release kernel, without any failures.
Could you specify the test case and the related failure?
What kernel version did you use? Did you apply any patch?
Thanks,
Massimo

2009/3/26 Darius Augulis <augulis.darius@gmail.com>:
> Hi,
>
> I'm getting jffs2 errors after write to flash. I don't have the output log
> now, but the idea is that after write to flash, jffs2 does not find magic
> numbers anymore. File system is broken.
> It's completely resolved when write buffers are not used. I could make patch
> which disables write buffer only for M29W128 chips. Anyway it's not working,
> one who needs more performace, is welcome to fix this in better way...
>
> Darius.
>
> massimo cirillo wrote:
>>
>> Hi Darius,
>> what kind of failure did you experiment with M29W?
>>
>> In my opinion, complete removal of the buffer program feature is not a
>> good solution,
>> because you are taking away an important feature of the device, that
>> results in
>> a very high performance decrease.
>>
>> Moreover, if you make the fix applicable to all devices with 0x227E device
>> ID,
>> you are removing the same feature from other devices too, such as M29EW
>> that has a much bigger buffer thus resulting in a dramatic performance
>> decrease
>> for this device.
>>
>>
>
>
