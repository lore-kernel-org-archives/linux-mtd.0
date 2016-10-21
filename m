Date: Fri, 21 Oct 2016 06:05:58 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de
Subject: Re: [PATCH 01/26] fscrypto: Add buffer operations
Message-ID: <20161021130558.GA2411@infradead.org>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-2-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477054121-10198-2-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 02:48:16PM +0200, Richard Weinberger wrote:
> Not all filesystems operate on pages, therefore offer
> operations to en/decrypt buffers.
> Of course these buffers have to be allocated in a way such that
> the kernel crypto framework can work with them.

Which means they need to be backed by the page allocator eventually.
I think we'd better off providing the pages from ubifs from the API
point of view.  What are the issues with doing that?
