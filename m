Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F57C98307
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2026 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0BFaHo5M4S3tH9YlAT3U+lT4OGQ9wr4XAlKi27dM5M=; b=19VY0wq9Hyw+fb
	mCySDMS9SXVXFUj6zRIkoPADIRYiqL587yuZg+ohNb0EvlcIgPD3y/5mYnpKVHwUr+uTfBt6vU6Kr
	MfxAHfGAKfLN6ZA/N3Lzy6bR/3sjimQYZOZBQJkxU7zi0ARyr/vGMMdMF4vwQWtB7HD7rYI6HXBTE
	+/+CVQrK8qj7Mr2Up/PzOLgio+wabtB8Vt54EWHZ10nZv+ic/3Q6V2VDE71TbifGvK92PwbYiJz2R
	VWhcBNElJ2lQ2Yqwi842k6kbpClrLfIyjm7GQsmFUL8fNzlAGFq0KVX/ja5/3M8ContadMh9xCaMt
	R8664a0WR8W4B3S27KCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Sz-00000005qM9-34Nh;
	Tue, 22 Sep 2026 15:31:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Sx-00000005qLc-0OHo;
	Tue, 22 Sep 2026 15:31:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81B3D40DC1;
	Tue, 22 Sep 2026 15:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971F71F00893;
	Tue, 22 Sep 2026 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091090;
	bh=VFYj6sjedfWGEBuGl++9heS9zoD83sYWZIxoZFH52Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oxgbajWAx+ewgz3EYGgJPYtZfNNrVy2jiDvlrL0XB6QieOmgNe9oJ8tWYTAmWkd4E
	 40O1bShYyuGwabzOZg2yryGvTCOWVoLErNmP15TezU6CcK1+IP50a2puK4iDmaw6R3
	 PCwUfPw/jYwdSq8HtaOBJAU/3KQvk7VOfDVSLU+W6MZTQuGVG14os2s8QuaTXuRpZy
	 c1E7BQMp5Oh5V6N9yXEOXRU2Ns8Xz5BjaAREZfd68p1jzII0svn4YeEB6D4D+XgUXP
	 mn6RKCk0xuOhAtFCkmd48wAcJ6k5w8jrTIJhK2olCjTjtXsHqi1z/Ac++TcJ8CKg7E
	 LVSLUkJaZCs2w==
Date: Tue, 22 Sep 2026 15:31:25 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>,
	Matthew Brost <matthew.brost@intel.com>,
	Alistair Popple <apopple@nvidia.com>, ceph-devel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, xen-devel@lists.xenproject.org,
	Gregory Price <gourry@gourry.net>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	linux-fscrypt@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, Nico Pache <nico.pache@linux.dev>,
	linux-perf-users@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Byungchul Park <byungchul@sk.com>,
	linux-trace-kernel@vger.kernel.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Muchun Song <muchun.song@linux.dev>,
	linux-f2fs-devel@lists.sourceforge.net,
	Minchan Kim <minchan@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Thomas Gleixner <tglx@kernel.org>, Anna Schumaker <anna@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alex Markuze <amarkuze@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mtd@lists.infradead.org, Chunhai Guo <guochunhai@vivo.com>,
	Jonathan Corbet <corbet@lwn.net>, Dev Jain <dev.jain@arm.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Gao Xiang <xiang@kernel.org>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	James Clark <james.clark@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Borislav Petkov <bp@alien8.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Tal Zussman <tz2294@columbia.edu>,
	Ilya Dryomov <idryomov@gmail.com>,
	Oscar Salvador <osalvador@suse.de>, linux-nfs@vger.kernel.org,
	linux-mm@kvack.org, linux-erofs@lists.ozlabs.org,
	Mike Rapoport <rppt@kernel.org>, Ian Rogers <irogers@google.com>,
	Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Yuanchu Xie <yuanchu@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Yue Hu <zbestahu@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>, Richard Weinberger <richard@nod.at>,
	x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Usama Arif <usama.arif@linux.dev>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namhyung Kim <namhyung@kernel.org>, Juergen Gross <jgross@suse.com>,
	kexec@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [f2fs-dev] [PATCH v5 00/17] Remove PG_private by using
 page/folio->private checks instead
Message-ID: <arKfTXizFeTeKYDx@google.com>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260922041600.1240429-1-zhaonanzhe@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922041600.1240429-1-zhaonanzhe@xiaomi.com>
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

On 09/22, Nanzhe Zhao wrote:
> Hi Zi Yan,
> 
> Thanks for the series. The cleanup is a nice help for the f2fs
> large-folio work -- it removes the page-based private-flag plumbing that
> my series would otherwise have to carry itself.
> 
> My large-folio series v2 [1] can be rebased on top of this series. The
> only overlap is the PAGE_PRIVATE_* flag helpers, which I can re-express
> on top of the F2FS_FOLIO_PRIVATE_* names while keeping the
> f2fs_folio_state indirection.
> 
> Jaegeuk, do you have a preference on the ordering here? My personal
> suggestion would be to review and merge this series first, and I'll
> rebase on top of it.

Let's keep working on the f2fs tree, since we should not merge this in my tree.
Later, we'd need to prepare how to address the merge conflict.

> 
> [1] https://lore.kernel.org/linux-f2fs-devel/20260915041909.2903887-1-zhaonanzhe@xiaomi.com/
> 
> Thanks,
> Nanzhe
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
