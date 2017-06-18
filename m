Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dMXix-0005Nj-PO
 for linux-mtd@lists.infradead.org; Sun, 18 Jun 2017 10:46:33 +0000
Received: by mail-qt0-x22a.google.com with SMTP id u12so94788278qth.0
 for <linux-mtd@lists.infradead.org>; Sun, 18 Jun 2017 03:46:10 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 18 Jun 2017 06:46:02 -0400
From: Tejun Heo <tj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Li Zefan <lizefan@huawei.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: Re: [PATCH 06/31] cgroup-v2.txt: standardize document format
Message-ID: <20170618104602.GD28042@htj.duckdns.org>
References: <cover.1495156488.git.mchehab@s-opensource.com>
 <1f0804f2263073287d2a106c12f88f295a30cec5.1495156488.git.mchehab@s-opensource.com>
 <20170519145921.GB7174@wtj.duckdns.org>
 <20170617121831.541ebb18@vento.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170617121831.541ebb18@vento.lan>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, Andrew.

Can you please apply Mauro's doc format update patch for
cgroup-v2.txt?  The mm part causes conflicts, so I think it'd be
easier to route it through -mm.

The patch to apply is in the following message.

 https://marc.info/?l=linux-cgroups&m=149771274105674&q=raw

Thanks.

-- 
tejun
