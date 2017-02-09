Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbq9Z-0006L3-6G
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 14:56:59 +0000
Subject: Re: [PATCH 22/24] ubifs: Convert to separately allocated bdi
To: Jan Kara <jack@suse.cz>
References: <20170202173422.3240-1-jack@suse.cz>
 <20170202173422.3240-23-jack@suse.cz>
 <d0d1d396-a340-866b-c931-974fa8ea53a1@nod.at>
 <20170209121728.GE16825@quack2.suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-block@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <e9eb0d3c-60ab-f77e-0184-d4be4ad74449@nod.at>
Date: Thu, 9 Feb 2017 15:56:29 +0100
MIME-Version: 1.0
In-Reply-To: <20170209121728.GE16825@quack2.suse.cz>
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

Am 09.02.2017 um 13:17 schrieb Jan Kara:
>> So ->capabilities is now zero by default since you use __GFP_ZERO in
>> bdi_alloc().
>> At least for UBIFS I'll add a comment on this, otherwise it is not so
>> clear that UBIFS wants a BDI with no capabilities and how it achieves that.
> 
> OK, I've modified the comment to:
> 
>          * Read-ahead will be disabled because @sb->s_bdi->ra_pages is 0. Also
>          * @sb->s_bdi->capabilities are initialized to 0 so there won't be any
>          * writeback happening.
>          */

Nice!

Thanks,
//richard
