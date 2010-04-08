Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzmqe-0003WR-I9
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 08:12:25 +0000
Subject: Re: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Hilman <khilman@deeprootsystems.com>
In-Reply-To: <1268772081-6534-1-git-send-email-khilman@deeprootsystems.com>
References: <1268772081-6534-1-git-send-email-khilman@deeprootsystems.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 11:10:13 +0300
Message-ID: <1270714213.6754.97.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bernd Schmidt <bernd.schmidt@analog.com>,
	David Howells <dhowells@redhat.com>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	David Brownell <david-b@pacbell.net>,
	David Brownell <dbrownell@users.sourceforge.net>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
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

I've pushed this one to my l2-mtd-2.6.git tree, branch "dunno".

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
