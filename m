Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7wX8-0003Yr-Lf
 for linux-mtd@lists.infradead.org; Tue, 09 May 2017 04:14:00 +0000
Subject: Re: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
To: Richard Weinberger <richard@nod.at>, Amir Goldstein <amir73il@gmail.com>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-4-o.rempel@pengutronix.de>
 <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
 <20170412054828.GA20561@infradead.org>
 <20170412071551.i36yj3lzilgtntdy@pengutronix.de>
 <803a8cc8-d2d1-dddf-2e07-621b1484218a@nod.at>
 <dd90ac49-574b-54b9-902a-ba5948134ba8@nod.at>
 <CAOQ4uxjqsm2h6N9qdOO2BxwOnnkY1KQCmDa6Ba8xPC0JGCVUiw@mail.gmail.com>
 <b7d49751-8345-b5c4-1b6d-761e91ddd89e@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
From: Oleksij Rempel <ore@pengutronix.de>
Message-ID: <3fa90f95-c522-ad9f-3f4c-8c45a6cd93c1@pengutronix.de>
Date: Tue, 9 May 2017 06:13:26 +0200
MIME-Version: 1.0
In-Reply-To: <b7d49751-8345-b5c4-1b6d-761e91ddd89e@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 05/02/2017 09:37 AM, Richard Weinberger wrote:
> Amir,
>
> Am 02.05.2017 um 09:19 schrieb Amir Goldstein:
>> On Fri, Apr 28, 2017 at 1:03 AM, Richard Weinberger <richard@nod.at> wrote:
>>> Am 24.04.2017 um 17:47 schrieb Richard Weinberger:
>>>>> So, if some flag should be implemented, who should do it? :)
>>>>
>>>> I'll not do it for you. ;)
>>>
>>> Please also see http://marc.info/?l=linux-fsdevel&m=149327990608749&w=2
>>>
>>
>> Richard,
>>
>> Considering the facts that:
>> 1. I proposed the said flag and Al didn't think it was needed [1]
>> 2. ext4 already sets s_uuid without any flag for a long time now
>> 3. A similar patch was queued for v4.12 to set s_uuid for xfs without any flag
>>
>> I think it would be right to take Oleksij's patch as is.
>>
>> FYI, my current work on 'constant inode numbers for overlayfs' requires that
>> underlying filesystem had set a non-zero s_uuid. Not sure if that matters for
>> ubifs+overlayfs users.
>
> If VFS maintainers are fine with that, I'll take it.
> From UBIFS' POV it does not matter much. :-)

Ping to VFS maintainers?
