Subject: Re: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Hilman <khilman@deeprootsystems.com>
In-Reply-To: <1268772081-6534-1-git-send-email-khilman@deeprootsystems.com>
References: <1268772081-6534-1-git-send-email-khilman@deeprootsystems.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 00:50:29 +0100
Message-ID: <1273794629.9999.412.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Bernd Schmidt <bernd.schmidt@analog.com>,
	David Brownell <david-b@pacbell.net>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Brownell <dbrownell@users.sourceforge.net>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-16 at 13:41 -0700, Kevin Hilman wrote:
> From: Sudhakar Rajashekhara <sudhakar....@ti.com>
> 
> This patch implements memory accessor interface in the MTD
> layer which enables the kernel to access flash data.
> 
> This patch adds two new members to the mtd_partition structure,
> a function handler which will be called during setup of the
> partition and an argument to be passed to this setup function.

Ick.

I don't mind providing the mtd_macc_{read,write} helper functions,
although they should work on generic MTD devices not just on partitions.
But do we really have to do the callout to arbitrary functions from
_within_ the core MTD code... why can't we do that in the board driver?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
