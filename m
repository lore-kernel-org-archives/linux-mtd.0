Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwonw-0005VJ-ED
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 10:08:34 +0000
Received: by oige206 with SMTP id e206so30216214oig.2
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 02:08:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwK+S-Qk537Qd22YZx7WwY_M7=Rx+J+Ex0=-W=9rbEaSg@mail.gmail.com>
References: <2204501.a0qztNJuDl@devpool02>
 <CAFLxGvwK+S-Qk537Qd22YZx7WwY_M7=Rx+J+Ex0=-W=9rbEaSg@mail.gmail.com>
Date: Thu, 12 Nov 2015 11:08:10 +0100
Message-ID: <CAFLxGvwkW=uvXO-e+41WrTZQpFCrJZ1cLFkhh_rE=sjcRsq_5g@mail.gmail.com>
Subject: Re: [PATCH] fix build when WITHOUT_LZO is set
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Rolf Eike Beer <eb@emlix.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 8, 2015 at 11:32 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Tue, Mar 10, 2015 at 3:52 PM, Rolf Eike Beer <eb@emlix.com> wrote:
>> From 3019806268ef1a9a483ca2bc35dcf1365415829f Mon Sep 17 00:00:00 2001
>> From: Rolf Eike Beer <eb@emlix.com>
>> Date: Tue, 10 Mar 2015 15:20:52 +0100
>> Subject: [PATCH] fix build when WITHOUT_LZO is set
>>
>> Make mkfs.ubifs honor the WITHOUT_LZO flag, too.
>>
>> Fixes this build error:
>>   mkfs.ubifs/compr.c:27:23: lzo/lzo1x.h: No such file or directory
>>   mkfs.ubifs/compr.c: In function `lzo_compress':
>>   mkfs.ubifs/compr.c:92: error: `lzo_uint' undeclared (first use in this function)
>>   mkfs.ubifs/compr.c:92: error: (Each undeclared identifier is reported only once
>>   mkfs.ubifs/compr.c:92: error: for each function it appears in.)
>>   mkfs.ubifs/compr.c:92: error: syntax error before "len"
>>   mkfs.ubifs/compr.c:95: error: `len' undeclared (first use in this function)
>>   mkfs.ubifs/compr.c:96: warning: implicit declaration of function `lzo1x_999_compress'
>>   mkfs.ubifs/compr.c:99: error: `LZO_E_OK' undeclared (first use in this function)
>>   mkfs.ubifs/compr.c: In function `init_compression':
>>   mkfs.ubifs/compr.c:201: error: `LZO1X_999_MEM_COMPRESS' undeclared (first use in this function)
> Patches makes sense to me.
>
> Maybe it would make sense to move LZO related stuff out of compr.c
> to reduce the amount of ifdefs.
>
> Artem, Brian, what do you think?

Sorry, this patch got lost. ;-\
I've applied and pushed it now as it fixes a real problem.

-- 
Thanks,
//richard
