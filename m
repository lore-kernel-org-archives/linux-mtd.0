Date: Thu, 21 Feb 2008 11:48:36 -0500
From: Christoph Hellwig <hch@infradead.org>
To: "David H. Lynch Jr." <dhlii@dlasys.net>
Subject: Re: Block devices
Message-ID: <20080221164836.GA4209@infradead.org>
References: <47BD22D0.9060008@dlasys.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47BD22D0.9060008@dlasys.net>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	linuxppc-embedded <linuxppc-embedded@ozlabs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 21, 2008 at 02:05:52AM -0500, David H. Lynch Jr. wrote:
>     Can I boot an initramfs kernel without a block device ?

Yes.

>     Can I write a filesystem driver for a flash device that does not
> require a block device ?

Yes.

>     Are their any examples of something even close ?

For that particular flash case there's just jffs2 in the kernel tree,
with some more flash filesystems under development.  You can of
course have network and in-memory filesystems aswell.
