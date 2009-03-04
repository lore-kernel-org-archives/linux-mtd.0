Date: Wed, 4 Mar 2009 15:55:44 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/3] [MTD] Flex-OneNAND support
Message-Id: <20090304155544.3bc3f337.akpm@linux-foundation.org>
In-Reply-To: <9c9fda240903041547x540899f9hd94cbf49baac660b@mail.gmail.com>
References: <20090303063605.GA30258@july>
	<20090303124948.dda294e5.akpm@linux-foundation.org>
	<49AE6907.1080702@nokia.com>
	<20090304085055.c9de6cbb.akpm@linux-foundation.org>
	<9c9fda240903041547x540899f9hd94cbf49baac660b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: h.rohit@samsung.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 5 Mar 2009 08:47:03 +0900
Kyungmin Park <kmpark@infradead.org> wrote:

> I think we know the issues currently and then if the device is opened,
> handle this one if required.
> How do you think?

I think it would be prudent to fix the known problems now, rather
than having to go through and re-debug them later on.

Bear in mind that people frequently copy old code when writing
new code, so these things tend to propagate, creating more work
later on.
