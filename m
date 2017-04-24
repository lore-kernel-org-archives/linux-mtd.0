Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2gD9-000682-JD
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 15:47:37 +0000
Subject: Re: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
To: Oleksij Rempel <ore@pengutronix.de>, Christoph Hellwig <hch@infradead.org>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-4-o.rempel@pengutronix.de>
 <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
 <20170412054828.GA20561@infradead.org>
 <20170412071551.i36yj3lzilgtntdy@pengutronix.de>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
From: Richard Weinberger <richard@nod.at>
Message-ID: <803a8cc8-d2d1-dddf-2e07-621b1484218a@nod.at>
Date: Mon, 24 Apr 2017 17:47:05 +0200
MIME-Version: 1.0
In-Reply-To: <20170412071551.i36yj3lzilgtntdy@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oleksij,

Am 12.04.2017 um 09:15 schrieb Oleksij Rempel:
> On Tue, Apr 11, 2017 at 10:48:28PM -0700, Christoph Hellwig wrote:
>> On Tue, Apr 11, 2017 at 10:43:26PM +0200, Richard Weinberger wrote:
>>> Artem, do you remember why UBIFS didn't set s_uuid in first place?
>>
>> It's an extremely odd field - only a hand full of file systems set it
>> (e.g. XFS doesn't, although according to Mimi IMA supports XFS), and
>> it's never even used outside of the IMA/EVM code.
>>
>> We really need a feature flag that this field is valid that IMA can
>> check before adding more support for it.
> 
> It seems to be used by mm/cleancache.c
> void __cleancache_init_shared_fs()
> 
> but this affects only ocfs2.
> 
> So, if some flag should be implemented, who should do it? :)

I'll not do it for you. ;)

> If me, what flag should be created?

A super block flag that denotes that s_uuid is valid.

Thanks,
//richard
