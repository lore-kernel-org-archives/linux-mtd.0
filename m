Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2gAy-0003up-Of
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 15:45:23 +0000
Subject: Re: [PATCH v2 2/3] fs: ubifs: update i_version on inode changes
To: Oleksij Rempel <ore@pengutronix.de>, Christoph Hellwig <hch@infradead.org>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-3-o.rempel@pengutronix.de>
 <20170411160530.GA25234@infradead.org>
 <d1641500-dda5-d317-49f6-6b1be734edf4@nod.at>
 <20170412060534.meohif5djev7johp@pengutronix.de>
 <20170412060847.GA23545@infradead.org>
 <20170412070422.7yxnvchmhzwe6i7d@pengutronix.de>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, kernel@pengutronix.de
From: Richard Weinberger <richard@nod.at>
Message-ID: <9c216902-027d-f70f-d896-6d3bb7d6bda9@nod.at>
Date: Mon, 24 Apr 2017 17:44:50 +0200
MIME-Version: 1.0
In-Reply-To: <20170412070422.7yxnvchmhzwe6i7d@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oleksij,

Am 12.04.2017 um 09:04 schrieb Oleksij Rempel:
> On Tue, Apr 11, 2017 at 11:08:47PM -0700, Christoph Hellwig wrote:
>> On Wed, Apr 12, 2017 at 08:05:34AM +0200, Oleksij Rempel wrote:
>>> The code seems to confirm it. So i assumed that IMA don't care if
>>> i_version is stored to disk or not. And i_version is the only way
>>> to notify IMA about inode changes.
>>> Since IMA documentation explecitley set i_version as reqieremt, so this
>>> option was provided as well.
>>
>> Maybe IMA doesn't care, but if you set MS_I_VERSION the fs does give
>> a guarantee.  Sp NAK on this patch as-is.
> 
> Ok, it was an expekted NACK :)
> Suddenly right now i don't have good ide to solve it. IMA just won't to
> know if some runtime changes was made to FS. Currently i can image
> fallowing variants:
> - rework IMA

I assumed that you checked that option already. I IMA *really* needs i_version,
we can think of an solution. Adding new filesystem features should be done with
care.

> - add MS_I_TEMP_VERSION and keep i_version using for it.

You mean a non-persistent i_version like fat and exofs use internally?

> - add new variable for external use only. For example: ima_rt_i_version,
>   or some thing like this.

hch will hate this for very good reasons. :-)

> Other ideas?

What about making i_version persistent?
We still have some empty fields in UBIFS' inode data structure.
But first we have to be very sure that we need it.

Artem, do you remember why UBIFS does not store i_version?

Thanks,
//richard
