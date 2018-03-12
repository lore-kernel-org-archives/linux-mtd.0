Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1evJSL-0002Ck-32
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2018 09:09:22 +0000
Received: by mail-wm0-x243.google.com with SMTP id 139so14587662wmn.2
 for <linux-mtd@lists.infradead.org>; Mon, 12 Mar 2018 02:09:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1520784361.4790.86.camel@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
 <1520784361.4790.86.camel@infinera.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 12 Mar 2018 10:09:05 +0100
Message-ID: <CAAQYJAs93d87kWej7D6qMEcwv-3Xqb-WiZwM9M1s430vs+mzEg@mail.gmail.com>
Subject: Re: [PATCH 0/3] mtd: fix AMD/Intel flash bugs
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 11, 2018 at 5:06 PM, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> On Thu, 2018-03-01 at 14:39 +0100, Joakim Tjernlund wrote:
>> This fixes a bug which allows read/write to a erase block currently
>> erasing.
>> Also works around a chip bug in Micron 28F00AP30 chips.
>>
>> Joakim Tjernlund (3):
>>   cfi_cmdset_0001: Do not allow read/write to suspend erase block.
>>   cfi_cmdset_0001: Workaround Micron Erase suspend bug.
>>   cfi_cmdset_0002: Do not allow read/write to suspend erase block.
>>
>>  drivers/mtd/chips/cfi_cmdset_0001.c | 33 ++++++++++++++++++++++++++++-----
>>  drivers/mtd/chips/cfi_cmdset_0002.c |  9 ++++++---
>>  include/linux/mtd/flashchip.h       |  1 +
>>  3 files changed, 35 insertions(+), 8 deletions(-)
>>
>
> Ping?
> This is a fairly serious bug as it confuses the flash state machine,
> making further flash access fail.
>

Hello,

I don't undertsand exactly from the titles what is happening.
Do you want to disable erase and wite suspend like in this other 2016
patch found around?

https://patchwork.kernel.org/patch/9380029/

See, I am user of the Sharp LH28F640BF NOR, very similar to the Intel
Startaflash, 4-Plane Page Mode Dual Work.
On these chips erase suspend works just fine.
What has been disabled is dual work: simultaneous read-while-erase and
read-while-program because there has never been real support for
n-planes in kernel.

What is exactly the issue?
Regards
Andrea

>  Jocke
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
