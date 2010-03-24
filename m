Received: from cassiel.sirena.org.uk ([80.68.93.111])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NuUfo-0005Yl-5s
	for linux-mtd@lists.infradead.org; Wed, 24 Mar 2010 17:47:25 +0000
Date: Wed, 24 Mar 2010 17:47:14 +0000
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] Samsung SoCs: OneNAND support
Message-ID: <20100324174713.GC26910@sirena.org.uk>
References: <20100324080454.GA24277@july>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100324080454.GA24277@july>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 24, 2010 at 05:04:54PM +0900, Kyungmin Park wrote:
> Samsung SoCs, s5pc6442, s5pc100, and s5pc110 has own OneNAND controller

> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

It's probably worth pointing out that this depends on the previously
posted addition of cpu_is_() for the Samsung CPUs which Ben hasn't
applied - the merge at least will need to be coordinated with that.
