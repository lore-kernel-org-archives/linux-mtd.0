Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dkngm-0001Dj-U5
 for linux-mtd@lists.infradead.org; Thu, 24 Aug 2017 08:40:34 +0000
Subject: Re: [PATCH] mtd-utils: tests: avoid using only one block in
 nandpagetest
To: Miquel Raynal <miquel.raynal@free-electrons.com>,
 linux-mtd@lists.infradead.org
References: <20170823135732.12899-1-miquel.raynal@free-electrons.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <e5fc2f53-738f-037b-6bd6-c1aa18d363f7@sigma-star.at>
Date: Thu, 24 Aug 2017 10:40:09 +0200
MIME-Version: 1.0
In-Reply-To: <20170823135732.12899-1-miquel.raynal@free-electrons.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 08/23/2017 03:57 PM, Miquel Raynal wrote:
> Forbid the use of -c1 in nandpagetest which limits the number of blocks
> to use at one. In that case, get_first_and_last_block() will return the
> same id for both the first and the last blocks. In erasecrosstest(),
> the logic is:
> - erase/write/read/verify first block
> - erase/write again first block
> - erase *last* block
> - read/verify first block
> The case 'first == last' leads to erasing the block before reading it.
> Hence the test will fail with no actual reason.
> 
So if some existing automated test setup were to use this, it would
(as of right now) *always* fail and terminate with EXIT_FAILURE.

> The patch does not forbid the use of -c1 as it could do it in
> process_options() with a errmsg_die(). Instead, it warns the user and
> uses a second block in order to avoid risking to break existing scripts.
> 
But wouldn't exactly that change the behavior of such a setup by suddenly
having all tests succeed?

If this combination of options always fails anyway, wouldn't it be more
appropriate to terminate with an error message in process_options instead?


Thanks,

David
