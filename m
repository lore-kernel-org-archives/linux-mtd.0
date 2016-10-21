Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZhO-0002CA-Rb
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 13:17:27 +0000
Subject: Re: [PATCH 01/26] fscrypto: Add buffer operations
To: Christoph Hellwig <hch@infradead.org>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-2-git-send-email-richard@nod.at>
 <20161021130558.GA2411@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 tytso@mit.edu, jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de,
 sbabic@denx.de, dengler@linutronix.de
From: Richard Weinberger <richard@nod.at>
Message-ID: <9c80d1d0-0237-606f-91ce-a004c3694aa5@nod.at>
Date: Fri, 21 Oct 2016 15:17:03 +0200
MIME-Version: 1.0
In-Reply-To: <20161021130558.GA2411@infradead.org>
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

Christoph,

On 21.10.2016 15:05, Christoph Hellwig wrote:
> On Fri, Oct 21, 2016 at 02:48:16PM +0200, Richard Weinberger wrote:
>> Not all filesystems operate on pages, therefore offer
>> operations to en/decrypt buffers.
>> Of course these buffers have to be allocated in a way such that
>> the kernel crypto framework can work with them.
> 
> Which means they need to be backed by the page allocator eventually.
> I think we'd better off providing the pages from ubifs from the API
> point of view.  What are the issues with doing that?
> 

UBIFS works on kmalloc()'ed buffers where it constructs the NAND/NOR pages
which will be written to the MTD. JFFS2 does the same.

So you suggest obtaining the struct page from the kmalloc()'ed buffer and
feeding it into fscrypto? This should work too.
I found the buffer operations approach more suitable.

Another reason why I did the buffer functions is because fscrypt_encrypt_page()
always allocates a bounce page as temporary memory. For ext4 this is needed,
for UBIFS not.
UBIFS has already a construction buffer, especially since it also does compression.

Thanks,
//richard
