Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cOuQE-0000Ag-HA
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 22:52:46 +0000
Subject: Re: [PATCH v2] fscrypt: Factor out bio specific functions
To: Eric Biggers <ebiggers3@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 jaegeuk@kernel.org, hch@infradead.org, arnd@arndb.de, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
 linux-ext4@vger.kernel.org, ebiggers@google.com, rdunlap@infradead.org,
 david@sigma-star.at
References: <20161219103929.GA16197@infradead.org>
 <20161219112532.18863-1-richard@nod.at>
 <20170101214725.g67msbedmpx27waz@thunk.org>
 <dd8b8365-e84a-7f8e-384d-4900523e761e@nod.at>
 <20170103142836.no7rp3hphj3czjto@thunk.org>
 <20170104201043.GA21696@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <6262f05a-6ab4-58dd-c782-b62fd38596dc@nod.at>
Date: Wed, 4 Jan 2017 23:52:12 +0100
MIME-Version: 1.0
In-Reply-To: <20170104201043.GA21696@gmail.com>
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

Am 04.01.2017 um 21:10 schrieb Eric Biggers:
> On Tue, Jan 03, 2017 at 09:28:36AM -0500, Theodore Ts'o wrote:
>> On Tue, Jan 03, 2017 at 10:49:26AM +0100, Richard Weinberger wrote:
>>> Ted,
>>>
>>> Am 01.01.2017 um 22:47 schrieb Theodore Ts'o:
>>>> On Mon, Dec 19, 2016 at 12:25:32PM +0100, Richard Weinberger wrote:
>>>>> That way we can get rid of the direct dependency on CONFIG_BLOCK.
>>>>>
>>>>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>>>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>>>> Suggested-by: Christoph Hellwig <hch@infradead.org>
>>>>> Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
>>>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>>>
>>>> Applied, thanks.
>>>
>>> Just to make sure, this fixes a build error and should
>>> go into Linus' tree ASAP.
>>
>> I didn't consider this a build error since it could be fixed via a
>> config change.  And it is a pretty big patch, even if it is mostly
>> moving (not that git recognized it as such)...
>>
> 
> I thought you're supposed to be able to build the kernel no matter how it's
> configured.  If this patch is really too large for 4.10 then perhaps we should
> make FS_ENCRYPTION select CONFIG_BLOCK instead?

My initial plan was a config fix but hch asked to fix the root cause right now.
https://lkml.org/lkml/2016/12/16/118

Thanks,
//richard
