Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d41ef-0001qV-K1
 for linux-mtd@lists.infradead.org; Fri, 28 Apr 2017 08:53:35 +0000
Received: by mail-io0-x241.google.com with SMTP id x86so9600688ioe.3
 for <linux-mtd@lists.infradead.org>; Fri, 28 Apr 2017 01:53:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <dd90ac49-574b-54b9-902a-ba5948134ba8@nod.at>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-4-o.rempel@pengutronix.de>
 <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
 <20170412054828.GA20561@infradead.org>
 <20170412071551.i36yj3lzilgtntdy@pengutronix.de>
 <803a8cc8-d2d1-dddf-2e07-621b1484218a@nod.at>
 <dd90ac49-574b-54b9-902a-ba5948134ba8@nod.at>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 28 Apr 2017 11:53:12 +0300
Message-ID: <CAOQ4uxhOTkJX2cFrt7VFO4ymsWyZ9JgxNTHss-DTDsP8J39Lpg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
To: Richard Weinberger <richard@nod.at>
Cc: Oleksij Rempel <ore@pengutronix.de>, Christoph Hellwig <hch@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 28, 2017 at 1:03 AM, Richard Weinberger <richard@nod.at> wrote:
> Am 24.04.2017 um 17:47 schrieb Richard Weinberger:
>>> So, if some flag should be implemented, who should do it? :)
>>
>> I'll not do it for you. ;)
>
> Please also see http://marc.info/?l=linux-fsdevel&m=149327990608749&w=2
>

Perhaps you meant this:
https://marc.info/?l=linux-fsdevel&m=149328358909709&w=2

There does not seem to be much objections to adding the flag,
so hopefully, we can merge it for v.12 and filesystems and consumers
will pick it up whenever.

Amir.
