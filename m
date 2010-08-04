Subject: RE: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
From: David Woodhouse <dwmw2@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <54038.80733.qm@web180305.mail.gq1.yahoo.com>
References: <54038.80733.qm@web180305.mail.gq1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Aug 2010 11:12:05 +0100
Message-ID: <1280916725.19499.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'Bernd Schmidt' <bernd.schmidt@analog.com>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	'Nicolas Pitre' <nico@fluxnic.net>,
	'Kevin Hilman' <khilman@deeprootsystems.com>, linux-kernel@vger.kernel.org,
	'David Howells' <dhowells@redhat.com>,
	'David Brownell' <dbrownell@users.sourceforge.net>,
	linux-mtd@lists.infradead.org, 'Andrew Morton' <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-07 at 04:08 -0700, David Brownell wrote:
> 
> I think the short answer is that the callout is
> what provides the board drivers enough information
> to make the correct calls. 

I don't see how.

The only information it passes to the callout is the information it was
already *given* in the partition structure.

I'm more inclined to believe Sudhakar's claim that you'll get an
'initialization sequence problem', although I'm not sure I believe it
can't be solved in a better way than this.

I'm also unhappy that it only works on partitioned devices -- that seems
wrong.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
