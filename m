Date: Fri, 21 Oct 2016 06:24:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de
Subject: Re: [PATCH 01/26] fscrypto: Add buffer operations
Message-ID: <20161021132400.GA28880@infradead.org>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-2-git-send-email-richard@nod.at>
 <20161021130558.GA2411@infradead.org>
 <9c80d1d0-0237-606f-91ce-a004c3694aa5@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c80d1d0-0237-606f-91ce-a004c3694aa5@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 03:17:03PM +0200, Richard Weinberger wrote:
> UBIFS works on kmalloc()'ed buffers where it constructs the NAND/NOR pages
> which will be written to the MTD. JFFS2 does the same.

Yes, you can trivially do a virt_to_page on a kmalloc buffer.

> Another reason why I did the buffer functions is because fscrypt_encrypt_page()
> always allocates a bounce page as temporary memory. For ext4 this is needed,
> for UBIFS not.
> UBIFS has already a construction buffer, especially since it also does compression.

We should defintively find a way to avoid that, but it's a separate
issue from adding another API just to pass buffers.
