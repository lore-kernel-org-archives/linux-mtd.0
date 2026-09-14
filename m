Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6709C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 04:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r74rngc3f+X5+qjizBlIh9/TX/xATnroKRCVwXCehZQ=; b=ypOPDsJujWFgFF
	8zGo3TXCViefkP/Szq8HMDh+SUYbRdGuhdfLLzCakxDoBsRUWZKlCEc0alyCkQuZjvyxj2VCrOpC7
	ZdYoVwXURJIceaq9ox9+uaq8bRA5D3bPNafdcjT1Z97ng7YBVW5IWk6NY4zNmIR/xXPAFU88xE0xp
	s9LNdgdi4yZ7nyZpjPVYKwIl9C4dfSvpV2TDh2X6ZTH6USc4ZASKNmDk09Uc/oSo1FKTV9VzcbL3J
	3TU4maoMUiIpEtQos5ubPDAcEOPOLq6QKMSqH52XhK+34TNIjCBIpMt/Z2VNIIOKuj6+qxNM8860I
	zgOfB7rThJ3rkomQZyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yCC-00000002Jkl-2joa;
	Mon, 14 Sep 2026 04:21:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yCB-00000002JkV-22pa;
	Mon, 14 Sep 2026 04:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XIa/QTT2Vtv8NiYChAuw57Ae+l0UAwkEY31SNMwQavs=; b=VHq/c8Pp7UCdPy63XwI1Y7/evy
	Zs6wNzMUH3y9lsWgsWNb5RSGYeSQu3+dwRZdgXhGjQadm2skLDAn/gsZQSr0RPAMMeECDGpa+etFJ
	GZ9W0qUhgJ+QpqD56J7NZ5uRTrraPD2HDAatD107Dp3uDh0n+iOUAQepIYxNbT07CT1OivKUu4rqR
	9T7pMp18HVSaFbknP5sOsW0VTb6JH/cNVnoDNqHZ/wAn8VlL9cIRO8bUeAaRAYVhxkupw1SgasBjf
	4D0IoMEvGnWlzdIMpEsme0E/QLtp6CUPuirl9Z1VPsWGxuq6MgoCtKLvy6o4mAhIx6zXHL2D24MjY
	lZwDMIbg==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5yBr-00000008huW-1WeH;
	Mon, 14 Sep 2026 04:21:11 +0000
Date: Mon, 14 Sep 2026 05:21:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	"H. Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>, Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Tal Zussman <tz2294@columbia.edu>, Gao Xiang <xiang@kernel.org>,
	Jan Kara <jack@suse.cz>, Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	linux-trace-kernel@vger.kernel.org,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>, linux-nfs@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>,
	Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org, Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Dave Young <ruirui.yang@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 00/16] Remove PG_private by using page/folio->private
 checks instead
Message-ID: <aqd2N1J3ui1llWWG@casper.infradead.org>
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Sep 13, 2026 at 10:23:58PM -0400, Zi Yan wrote:
>       md/md-bitmap: replace PagePrivate() with page_private()
>       buffer: replace page_buffer() with page_private() and delete it

Sorry, looks like I screwed up git send-email usage.  I'm proposing
replacing these two patches wth the three I sent.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
