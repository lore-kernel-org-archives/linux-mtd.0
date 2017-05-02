Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5S6L-0003Qg-MQ
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 07:20:07 +0000
Received: by mail-io0-x244.google.com with SMTP id h41so27233613ioi.1
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 00:19:40 -0700 (PDT)
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
Date: Tue, 2 May 2017 10:19:39 +0300
Message-ID: <CAOQ4uxjqsm2h6N9qdOO2BxwOnnkY1KQCmDa6Ba8xPC0JGCVUiw@mail.gmail.com>
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

Richard,

Considering the facts that:
1. I proposed the said flag and Al didn't think it was needed [1]
2. ext4 already sets s_uuid without any flag for a long time now
3. A similar patch was queued for v4.12 to set s_uuid for xfs without any flag

I think it would be right to take Oleksij's patch as is.

FYI, my current work on 'constant inode numbers for overlayfs' requires that
underlying filesystem had set a non-zero s_uuid. Not sure if that matters for
ubifs+overlayfs users.

Amir.

[1] https://marc.info/?l=linux-unionfs&m=149352864527985&w=2
