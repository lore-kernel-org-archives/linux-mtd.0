Received: from mail-yb0-x22d.google.com ([2607:f8b0:4002:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBjNZ-0001eJ-Up
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 14:59:47 +0000
Received: by mail-yb0-x22d.google.com with SMTP id 130so93008ybl.3
 for <linux-mtd@lists.infradead.org>; Fri, 19 May 2017 07:59:24 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 19 May 2017 10:59:21 -0400
From: Tejun Heo <tj@kernel.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Li Zefan <lizefan@huawei.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org
Subject: Re: [PATCH 06/31] cgroup-v2.txt: standardize document format
Message-ID: <20170519145921.GB7174@wtj.duckdns.org>
References: <cover.1495156488.git.mchehab@s-opensource.com>
 <1f0804f2263073287d2a106c12f88f295a30cec5.1495156488.git.mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f0804f2263073287d2a106c12f88f295a30cec5.1495156488.git.mchehab@s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, Mauro.

On Thu, May 18, 2017 at 10:22:11PM -0300, Mauro Carvalho Chehab wrote:
> Each text file under Documentation follows a different
> format. Some doesn't even have titles!
> 
> Change its representation to follow the adopted standard,
> using ReST markups for it to be parseable by Sphinx:
> 
> - Comment the internal index;
> - Use :Date: and :Author: for authorship;
> - Mark titles;
> - Mark literal blocks;
> - Adjust witespaces;
> - Mark notes;
> - Use table notation for the existing tables.

If this is the direction we're taking for all docs, looks good to me.
Do you want me to take the patch through the cgroup tree?

Thanks.

-- 
tejun
