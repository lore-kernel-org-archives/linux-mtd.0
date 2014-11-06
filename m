Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmDnM-0006hM-DX
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 03:31:40 +0000
Received: by mail-la0-f42.google.com with SMTP id gq15so1909617lab.1
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 19:31:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7712E50B@NTXXIAMBX02.xacn.micron.com>
References: <CAHrpEqSum1__d5Y1tysEzpa_MGuQSWfOW=m4idSxzCTdGbNKTQ@mail.gmail.com>
 <20141105205706.GP23619@ld-irv-0074>
 <CAHrpEqTQQ+YBnBY-fj9uW1bAMn-t_dmdVR9KuJR+2E+uA4vZ2Q@mail.gmail.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7712E50B@NTXXIAMBX02.xacn.micron.com>
Date: Wed, 5 Nov 2014 21:31:10 -0600
Message-ID: <CAHrpEqT=Es1xQUpPkrDdyo+vg=t9+3CGHHm8FAUHZk-UnBRgjQ@mail.gmail.com>
Subject: Re: mtd: nand: lock unlock function
From: Zhi Li <lznuaa@gmail.com>
To: bpqw <bpqw@micron.com>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 5, 2014 at 8:32 PM, bpqw <bpqw@micron.com> wrote:
>> Yes, we recently met a problem with micron flash. Need send unlock
>> command.
>> The datasheet I get from micron
>> MT29F8G08ABACA, MT29F8G16ABACA, MT29F8G08ABBCA, MT29F8G16ABBCA,
>> MT29F16G08ADACA, MT29F16G16ADACA, MT29F16G08ADBCA , MT29F16G16ADBCA
>
> Hi Zhi,
> There is a LOCK# pin for Micron NAND flash device, lock feature is disabled
> if you leave this LOCK# pin low or unconnected. Only when you pull high this
> LOCK# pin, all NAND flash blocks are locked after power on, users need to send
> Unlock command to unlock blocks.
> Can you help descript what problem you met?

Yes, that's exact problem. Our board design connect LOCK# to VCC wrongly.

>
> Thanks
