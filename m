Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7zgM-0005Tw-Mw
 for linux-mtd@lists.infradead.org; Tue, 09 May 2017 07:35:45 +0000
Subject: Re: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
To: Amir Goldstein <amir73il@gmail.com>, Richard Weinberger <richard@nod.at>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-4-o.rempel@pengutronix.de>
 <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
 <20170412054828.GA20561@infradead.org>
 <20170412071551.i36yj3lzilgtntdy@pengutronix.de>
 <803a8cc8-d2d1-dddf-2e07-621b1484218a@nod.at>
 <dd90ac49-574b-54b9-902a-ba5948134ba8@nod.at>
 <CAOQ4uxjqsm2h6N9qdOO2BxwOnnkY1KQCmDa6Ba8xPC0JGCVUiw@mail.gmail.com>
 <b7d49751-8345-b5c4-1b6d-761e91ddd89e@nod.at>
 <3fa90f95-c522-ad9f-3f4c-8c45a6cd93c1@pengutronix.de>
 <CAOQ4uxiEGJLSGS5rK8V8GRNvf9aWqbVG5odu2=nv73xTOmvfNQ@mail.gmail.com>
 <e258d0f2-6117-8ca3-0ed7-a8f6498ad9d4@pengutronix.de>
 <f4b9118e-dcff-32d0-2861-d520f75ea250@nod.at>
 <CAOQ4uxgn59hxAOgRD87VdVPv2srtcLjoFCVVrkAnezEN0_ZFxg@mail.gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
From: Oleksij Rempel <ore@pengutronix.de>
Message-ID: <19f9dd7a-71a6-cf06-9272-bf4b8c74d2bd@pengutronix.de>
Date: Tue, 9 May 2017 09:35:11 +0200
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxgn59hxAOgRD87VdVPv2srtcLjoFCVVrkAnezEN0_ZFxg@mail.gmail.com>
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



On 05/09/2017 09:08 AM, Amir Goldstein wrote:
> On Tue, May 9, 2017 at 10:01 AM, Richard Weinberger <richard@nod.at> wrote:
>>
>> Oleksij,
>>
>> Am 09.05.2017 um 07:52 schrieb Oleksij Rempel:
>>>>
>>>>         If VFS maintainers are fine with that, I'll take it.
>>>>         From UBIFS' POV it does not matter much. :-)
>>>>
>>>>
>>>>     Ping to VFS maintainers?
>>>>
>>>>
>>>> What ping? Al made it clear that a flag is not needed.
>>>> BTW, xfs s_uuid patch was merged to master.
>>>
>>>
>>> I'm talking about ubifs patch.
>
> Me too.

:) ok

>>
>> Then we can queue this patch for 4.13.
>> Please resend and make sure it addresses everything what was also
>> suggested for the xfs s_uuid patch.
>>
>
> Just to be clear, the xfs s_uuid patch is just a memcpy,
> no different from Oleksij's patch.

So, should i change something?

here is the patch:
https://patchwork.kernel.org/patch/9674817/
