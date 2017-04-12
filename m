Date: Tue, 11 Apr 2017 22:48:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
Message-ID: <20170412054828.GA20561@infradead.org>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-4-o.rempel@pengutronix.de>
 <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 11, 2017 at 10:43:26PM +0200, Richard Weinberger wrote:
> Artem, do you remember why UBIFS didn't set s_uuid in first place?

It's an extremely odd field - only a hand full of file systems set it
(e.g. XFS doesn't, although according to Mimi IMA supports XFS), and
it's never even used outside of the IMA/EVM code.

We really need a feature flag that this field is valid that IMA can
check before adding more support for it.
