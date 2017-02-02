Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZO5u-0003pM-20
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2017 20:35:05 +0000
Subject: Re: [PATCH 22/24] ubifs: Convert to separately allocated bdi
To: Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
References: <20170202173422.3240-1-jack@suse.cz>
 <20170202173422.3240-23-jack@suse.cz>
Cc: Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <26c70615-f98c-23a6-abb7-de675fb658b6@nod.at>
Date: Thu, 2 Feb 2017 21:34:32 +0100
MIME-Version: 1.0
In-Reply-To: <20170202173422.3240-23-jack@suse.cz>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jan,

Am 02.02.2017 um 18:34 schrieb Jan Kara:
> Allocate struct backing_dev_info separately instead of embedding it
> inside the superblock. This unifies handling of bdi among users.
> 
> CC: Richard Weinberger <richard@nod.at>
> CC: Artem Bityutskiy <dedekind1@gmail.com>
> CC: Adrian Hunter <adrian.hunter@intel.com>
> CC: linux-mtd@lists.infradead.org
> Signed-off-by: Jan Kara <jack@suse.cz>

Is this series available at some git tree, please?

Thanks,
//richard
