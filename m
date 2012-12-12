Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TisIz-0002Jc-Pe
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 19:49:22 +0000
Message-ID: <50C8DFF3.2000203@am.sony.com>
Date: Wed, 12 Dec 2012 11:50:11 -0800
From: Tim Bird <tim.bird@am.sony.com>
MIME-Version: 1.0
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <CAFLxGvw9fL_U-KT9sysdyZOLry5skNWR6AUt_XNT10op38e+Gg@mail.gmail.com>
 <CALF0-+Uy5Cc5DDT_80ArK8r7BE5fg9YgxKGoJ34Q3LzT_jhL+g@mail.gmail.com>
 <CALF0-+WzXEbzfZfnkM7eX53JENDSPQoO5-qYiwX593pM_jwW1g@mail.gmail.com>
 <50C8BE2D.5090706@free-electrons.com>
In-Reply-To: <50C8BE2D.5090706@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 richard -rw- weinberger <richard.weinberger@gmail.com>,
 gregkh <gregkh@linuxfoundation.org>,
 Ezequiel Garcia <ezequiel@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/2012 09:26 AM, Michael Opdenacker wrote:
> On 12/12/2012 05:35 PM, Ezequiel Garcia wrote:
>> On a second thought and considering this code is originally
>> copyrighted by Free Electrons,
>> I'd guess I need their permission to make a license change (right?).
>>
>> So considering Greg's comments, I'll leave it as it is and let Free
>> Electrons decide.
> 
> OK for GPLv2 only. You have Free Electron's permission.
> 
> Thanks for asking!

I'm not sure if this code is related to the UBI code that
Free Electrons worked on for CELF some time ago or not -- but
CELF's preference (and CE Workgroup's preference also)
for any code contributions to the kernel is GPLv2 only.

Just FYI.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Workgroup of the Linux Foundation
Senior Staff Engineer, Sony Network Entertainment
=============================
