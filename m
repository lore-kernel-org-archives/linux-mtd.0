Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNHx2-0003ZD-Ko
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 08:22:17 +0000
Received: by mail-vc0-f179.google.com with SMTP id ij19so7881641vcb.10
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 01:21:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1394524000.6302.217.camel@sauron.fi.intel.com>
References: <D2D3E4C4A672E847B422D1E5F695E1A402E61608@sreublc136.eu.labinal.snecma>
 <aadf057c868c47128845c19d69933c46@BLUPR08MB103.namprd08.prod.outlook.com>
 <1394524000.6302.217.camel@sauron.fi.intel.com>
Date: Tue, 11 Mar 2014 01:21:54 -0700
Message-ID: <CAN8TOE-j3upBwjNzUByFjNF4b7JLhymuz1kD30fzTLnOm6TQgw@mail.gmail.com>
Subject: Re: Corrupt empty space
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: =?ISO-8859-1?Q?HOUR_Fr=E9deric?= <frederic.hour@safran-engineering.com>,
 Kent Li <Kent.Li@radisys.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 11, 2014 at 12:46 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2014-03-11 at 05:31 +0000, Kent Li wrote:
>> Frederic,
>>
>> I'm not sure if this is the unstable bit issue, but I just resolved such issue by enhancing my Nand driver in both Uboot code and Linux code.
>>
>> The main idea is:
>> Read a page
>> If ( ECC fail ) ;then
>>       Check the how many 0 bit there is.
>>       If ( 0 bit number > tolerance value) //tolerance value is depends on the ECC correctable bits.
>>               Print "Fail to recover by ECC"
>>       Else
>>               Force change the 0 bits to 1
>>       fi
>> fi
>
> Off the top of my head, this sounds reasonable. Too bad people people do
> not just go and fix this in upstream...

I have something like this locally, and Huang [1] and Pekon [2] are
both trying to implement this in their upstream drivers (incorrectly,
IMO). As we speak, I'm preparing a patch to send out that can
hopefully kill both [1] and [2]. Unfortunately, I'm discovering some
strange behavior (maybe a HW bug?) on my platform while testing...

I'll try to remember to CC all of you when I send my patch.

Regards,
Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051585.html
