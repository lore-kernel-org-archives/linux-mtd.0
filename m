Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOLjA-0003nq-3F
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 09:49:57 +0000
Subject: Re: [PATCH v2] fscrypt: Factor out bio specific functions
To: Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, jaegeuk@kernel.org, hch@infradead.org,
 arnd@arndb.de, dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-ext4@vger.kernel.org, ebiggers@google.com,
 rdunlap@infradead.org, david@sigma-star.at
References: <20161219103929.GA16197@infradead.org>
 <20161219112532.18863-1-richard@nod.at>
 <20170101214725.g67msbedmpx27waz@thunk.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <dd8b8365-e84a-7f8e-384d-4900523e761e@nod.at>
Date: Tue, 3 Jan 2017 10:49:26 +0100
MIME-Version: 1.0
In-Reply-To: <20170101214725.g67msbedmpx27waz@thunk.org>
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

Ted,

Am 01.01.2017 um 22:47 schrieb Theodore Ts'o:
> On Mon, Dec 19, 2016 at 12:25:32PM +0100, Richard Weinberger wrote:
>> That way we can get rid of the direct dependency on CONFIG_BLOCK.
>>
>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Suggested-by: Christoph Hellwig <hch@infradead.org>
>> Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
>> Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> Applied, thanks.

Just to make sure, this fixes a build error and should
go into Linus' tree ASAP.

Thanks,
//richard
