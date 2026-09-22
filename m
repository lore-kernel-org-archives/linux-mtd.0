Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC60C982F1
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2026 04:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZY/r0hCLUSChtWyb2NuRDnbHegeY8X8qp+m/WpCgLk=; b=v320xZPhZyS+NC
	qYQY4Ko1PAwxmUi3At23kp6AwX7Z1iaJewTtVYB0fyXZ1l4gyT5q7wvu3rURkbATIrEC+7ZUpYwfa
	+iIu4kfEkwF0b+PLriFLzpeeufZVvOoEAIZCcEhW0xw9utlt4wUtrZHzS2Z0PDbz5npPLSPSm7Bu9
	FBXPGCuiAOxlT3uR2psjpd5MGLODA6vYN4dRNU1f/YJv3dCRPG3GA5B++6NfoLoDAyV7PKHQNMsz0
	bLydaIDf2NW07fMh9/usJFevK2Rf44VgskJanEeaI7UDNZMBRTFGZR/nDPBjyUu7UzwwwZoo0ons8
	KoIZJ2riJ688rrchHDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rvh-00000004A7y-0HH7;
	Tue, 22 Sep 2026 04:16:29 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rve-00000004A76-1Qox
	for linux-mtd@lists.infradead.org;
	Tue, 22 Sep 2026 04:16:27 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39e59dca659so2252830a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2026 21:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790050583; x=1790655383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDLbvCKUB+a+IDR0laoJE09QGbcCCmet6VJT4AONztI=;
        b=sJPlDv9fHwSKep7igITPEU8fifiOQOIegRI0fAgAfIhwMX9XWzfsKTKaW1KfCxXHsW
         S7UCDVN18ch7FzHek41f0+lchosdMQZRhsgoLVsWU3wVaH7l/BmWMC/U7Q+OBTci3j3c
         /TNFIxXHsnoL6y6nzVipHVpMT3nCjKm/n7pfujN7P1ey5XMAV7vWA4cjblnRgluLqh8a
         lBn1lNUWMjuACKIWscEhXa9KAaYSny8U/qpZ5x7lhy9eq3NXHWLnAapSLkYahCn/fmLp
         RA4Jp/uvj13gEB8z4jBFmOkk1XHygwqRfeQzcV9r3mrkU+dpwkA2skYD9B550RApDy/1
         YCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790050583; x=1790655383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDLbvCKUB+a+IDR0laoJE09QGbcCCmet6VJT4AONztI=;
        b=zpJwSN+/2074SfOWRCrmASiO+l6Z8Sj8oJASvN5ZJH+Fs6b9GuKXcql3+XFaFKnwqq
         gqorcK+Fj8nFqIOdb3LZyOLDZoj+1CPxGXu4tMDDHi9p6G84FwDmWHKs/K6AqOhPQnyS
         t7a9JkodQeiwooEX3N6/jnj/WWbeKiz4+IK12JI3Fd8uRuP2/ItGqtlq9avggdMDyuXT
         w0A0/W12j+bB9E9wV+UtqSgS7UV87UWwDlCdi27kzHKXngnWDuyKJjLy0KUV0NCdk1ME
         zAyTwOsa0NLV6Pjg3S5/nfXYlCVHmqn3iLcPzU0e5gJntuVcHyCnR+oUK6w1WP11J0XD
         EmiQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4j7sBI8H/7IEfzcgyepUyBO4fcyCjgWA1dYa2segIGSOlm2eKHvkKCvz/TJEFJgpyvYpdzi3H1ic=@lists.infradead.org
X-Gm-Message-State: AFuF++n3xXELuRU+zKf7Iei8G4CSLDc2WRq/JsYQxyI9kEHBeCfCW84G
	e4jCA8hKHY6iy5oQWF21x8DUxk/AddJDT+dDpYRHLd32qA4vJ4g4Ftfv
X-Gm-Gg: AYBFou2jEG5SuWfR9VdyOgosnqUAyJfVZhd3/XGcFCxXvM5ef38u3NRKXlw51rS9gzD
	aUEJSYKIy49L3i72955J5Kb/0HZ/v8jrIXvjuwjhhnD9ChT+UO8dRZj2S/9/HTgTDinbnHxGXsc
	2e8MK9vhVWvpPPtC7yZCTVdXhmlAMui/3DLdzM9565ch35QwsnqLjDuGxI/0RFM/12Om4b0WbU/
	zkERbjzT6Xp2Fy94Tea3NhVYB8dvOYxggn9NhlqBnPk/vPrznWf8VrxfXn8AcFlAY9olXDZsrbp
	Snq2/KIcWn73PFOs9PmA6cofezxqRW8qb77fvLVIdUXasLW+WXc93FsoZxPDn3/qHL+aldxFgIg
	BRElSJBnHdMuH9c2DHRSOh3oPxDpQ202j8Oilj2dpqd0N82udjVgGsMa8QUBsTUeTOId2GrGjwP
	xRnMuWF8a2egRhSVpmG9xHrE216aFL4Ih4uIG1wZxDE/g91amIeucJEuFeohdr9xOzBJcdm4gem
	7x/L1FCm3O8i30DQD7Sg0UuK1i4ZazIZfSg
X-Received: by 2002:a17:90b:56c5:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-39e55008a3amr25857593a91.14.1790050583196;
        Mon, 21 Sep 2026 21:16:23 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674d65d4sm2204031a91.15.2026.09.21.21.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:16:22 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
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
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Rogers <irogers@google.com>,
	Jan Kara <jack@suse.cz>,
	linux-doc@vger.kernel.org,
	Alex Markuze <amarkuze@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	kexec@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Young <ruirui.yang@linux.dev>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-mm@kvack.org,
	Hongbo Li <hongbohbli@tencent.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chunhai Guo <guochunhai@vivo.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tal Zussman <tz2294@columbia.edu>,
	Baoquan He <baoquan.he@linux.dev>,
	Matthew Brost <matthew.brost@intel.com>,
	Anna Schumaker <anna@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yue Hu <zbestahu@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	x86@kernel.org,
	ceph-devel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Wei Xu <weixugc@google.com>,
	xen-devel@lists.xenproject.org,
	Gao Xiang <xiang@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	linux-fscrypt@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-mtd@lists.infradead.org,
	Axel Rasmussen <axelrasmussen@google.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Yuanchu Xie <yuanchu@google.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Juergen Gross <jgross@suse.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-nfs@vger.kernel.org,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-perf-users@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	Trond Myklebust <trondmy@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>
Subject: Re: [PATCH v5 00/17] Remove PG_private by using page/folio->private checks instead
Date: Tue, 22 Sep 2026 12:16:00 +0800
Message-ID: <20260922041600.1240429-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_211626_394119_E05A6ED9 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Zi Yan,

Thanks for the series. The cleanup is a nice help for the f2fs
large-folio work -- it removes the page-based private-flag plumbing that
my series would otherwise have to carry itself.

My large-folio series v2 [1] can be rebased on top of this series. The
only overlap is the PAGE_PRIVATE_* flag helpers, which I can re-express
on top of the F2FS_FOLIO_PRIVATE_* names while keeping the
f2fs_folio_state indirection.

Jaegeuk, do you have a preference on the ordering here? My personal
suggestion would be to review and merge this series first, and I'll
rebase on top of it.

[1] https://lore.kernel.org/linux-f2fs-devel/20260915041909.2903887-1-zhaonanzhe@xiaomi.com/

Thanks,
Nanzhe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
