Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LTwUm-0005Zc-Eb
	for linux-mtd@lists.infradead.org; Mon, 02 Feb 2009 10:57:43 +0000
Subject: Re: Regarding UBI scalability
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <4986D3F6.5030208@nokia.com>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 02 Feb 2009 12:57:39 +0200
Message-Id: <1233572259.7085.64.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"brij.singh@samsung.com" <brij.singh@samsung.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-02-02 at 13:07 +0200, Adrian Hunter wrote:
> I would suggest an intermediate step.  Create UBI2 which is
> similar to UBI but stores eraseblock information in one place,
> instead of at the beginning of each eraseblock.  Such an approach
> might be OK up to as much as 64GiB, and would probably perform
> better than a fully scalable version.
> 
> Then look at creating UBI3, which is fully scalable.

Yes, I assume UBI2 should store mapping/erasure information in separate
tables, not in each eraseblock. So we should get rid of eraseblock
headers.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
