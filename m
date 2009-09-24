Subject: RE: [PATCH] [MTD] m25p80: memory accessor interface for SPI MTD driver
From: David Woodhouse <dwmw2@infradead.org>
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
In-Reply-To: <010b01ca3cf6$98e55c30$cab01490$@raj@ti.com>
References: <1249333325-16750-1-git-send-email-sudhakar.raj@ti.com>
	<200908031824.01795.david-b@pacbell.net>
	<1253385381.6317.29.camel@macbook.infradead.org>
	<010b01ca3cf6$98e55c30$cab01490$@raj@ti.com>
Content-Type: text/plain
Date: Thu, 24 Sep 2009 07:33:48 -0700
Message-Id: <1253802828.30010.29.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'David Brownell' <david-b@pacbell.net>,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-24 at 14:38 +0530, Sudhakar Rajashekhara wrote:
> Can you elaborate a bit more on what you would like to see in this
> patch?
> From your explanation above I did not understand completely what
> should be done.

Mostly, what I'm trying to say is that I'd like to see it done as a
simple _user_ of the existing MTD devices, rather than poking its
fingers inside the MTD code.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
