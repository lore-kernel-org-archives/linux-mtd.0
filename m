Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7zv8-0005FE-HI
 for linux-mtd@lists.infradead.org; Tue, 09 May 2017 07:51:00 +0000
Received: by mail-oi0-x242.google.com with SMTP id m17so13323384oik.2
 for <linux-mtd@lists.infradead.org>; Tue, 09 May 2017 00:50:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6b72fc59-ca01-f4ee-106f-abb9b6490d32@nod.at>
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
 <6b72fc59-ca01-f4ee-106f-abb9b6490d32@nod.at>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 9 May 2017 10:50:36 +0300
Message-ID: <CAOQ4uxjoxYiJoPicoJemRX5YgxWgLGSwanZqKSa++p7TdHh8Rg@mail.gmail.com>
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

On Tue, May 9, 2017 at 10:35 AM, Richard Weinberger <richard@nod.at> wrote:
> Amir,
>
> Am 09.05.2017 um 09:08 schrieb Amir Goldstein:
>>> Then we can queue this patch for 4.13.
>>> Please resend and make sure it addresses everything what was also
>>> suggested for the xfs s_uuid patch.
>>>
>>
>> Just to be clear, the xfs s_uuid patch is just a memcpy,
>> no different from Oleksij's patch.

See upstream commit
8f720d9 xfs: publish UUID in struct super_block


>
> Wasn't there a huge discussion about LE/BE/uniqueness and more details
> on UUID that hurt my brain.
>

LE/BE discussions are more about which variants of uuid helpers should be
created, among other things, for consumers of s_uuid to check that s_uuid
was filled by fs.
Converting s_uuid type to uuid_t or whatever is for the far future.

uniqueness of s_uuid does not exist with current filesystems,
so no reason whatsoever to act differently with ubifs.
Fixing uniqueness of s_uuid (if at all is needed) is a future VFS task.

Bottom line, for Oleksij's original patch:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

If it's not too late for 4.12 that could be nice, because then
ubifs+overlayfs would gain a new feature (constant inode numbers)
