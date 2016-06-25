Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGu8L-0003Rm-T2
 for linux-mtd@lists.infradead.org; Sat, 25 Jun 2016 20:24:55 +0000
Subject: Re: [PATCH 2/2] ubi: open volumes define in device tree
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <1466277476-14853-2-git-send-email-hauke@hauke-m.de>
 <CAAEAJfATWJL0fGEcBup+cWzhHUe_4CF4XHWuvp4NYOesmaTyZw@mail.gmail.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <ea18e1b8-c823-edf1-73b3-0568f504fec9@hauke-m.de>
Date: Sat, 25 Jun 2016 22:24:31 +0200
MIME-Version: 1.0
In-Reply-To: <CAAEAJfATWJL0fGEcBup+cWzhHUe_4CF4XHWuvp4NYOesmaTyZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/24/2016 08:45 PM, Ezequiel Garcia wrote:
> On 18 June 2016 at 16:17, Hauke Mehrtens <hauke@hauke-m.de> wrote:
>> This makes it possible to define a volume to open in device tree. This
>> is helpful when a root file system is on a ubi layer. Without this
>> patch it is only possible to device with with kernel command line
>> parameters.
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>>  Documentation/devicetree/bindings/mtd/ubi.txt | 22 +++++++++++++++++
>>  drivers/mtd/ubi/build.c                       | 34 +++++++++++++++++++++++++++
>>  2 files changed, 56 insertions(+)
>>
....
>> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>> index 16baeb5..1c22533 100644
>> --- a/drivers/mtd/ubi/build.c
>> +++ b/drivers/mtd/ubi/build.c
>> @@ -1,6 +1,7 @@
>>  /*
>>   * Copyright (c) International Business Machines Corp., 2006
>>   * Copyright (c) Nokia Corporation, 2007
>> + * Copyright (c) 2016 Hauke Mehrtens <hauke@hauke-m.de>
>>   *
> 
> A tangential comment for this and other patches.
> 
> There's no need to add your copyright when you are submitting
> small contributions.
> 
The GPL v2 [0] says in section 1 a):
> You must cause the modified files to carry prominent notices stating
> that you changed the files and the date of any change.

My assumption is that my changes are copyrightable and then I have to
add a notice accordingly to the GPL. I do not really care about this and
can remove this.

Hauke

[0]: https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
