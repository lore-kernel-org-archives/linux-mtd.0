Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BC4C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 17:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fc1ftk0V08by/sPHZLuX3xQazA9BaBzx7D9wFDrlcuE=; b=sp1ddtFYAchQUx
	UXdaAFZ/Y8nVZmwWZQDMlY9MpSkc2FXDMffCkmORFnicze8FXBDdtKh3pYlPBrP3HV4EwFT9yVNrz
	2qmd/fVh4EMvsc0TC8Kw0XPfXy7xrZH60j9cywv8T10pfygEjM0eXOwopth5DawnnQHNdBD4BzhBT
	lAdBxTSZNVS61upov11XVr8zDewDABBpEU75wAmID3iPz0AJLxKy2N5XOp2j7XphjoJwFLzHfp2Sc
	4MYvLq1RALpdUKqP2qTvCuOWp0VgV4DvzTzj+W+IS0vveRKXPAk0utuhaqEVvRRAMAGOseHSUq18Y
	ZIHeLJLJKFDNMtOY3TrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6FQZ-007Txr-E0; Tue, 28 Jun 2022 17:55:07 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6FQV-007Ttt-QW
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 17:55:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id c4so11735275plc.8
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 10:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ifakbg1KSXljeCc2KlqlOz+XfzIBohlTVCEx+b5hm2Y=;
        b=Lpc3rw2lUDFTgNuiFkNi7vJ3FOoQQ8sPNV+A/xT7kPgFFi5TelrrdXlIUbrL4j9GT+
         3+ei8DuymmFwmq4TMtVSFXVwj/BEoFuIu2AqPN9i6R5zOS+ndUs4OIvpg1Fj2tZP3rAs
         mZTqNdFC15vlNUFmjWu7inrraPu1BA3Mkzqts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ifakbg1KSXljeCc2KlqlOz+XfzIBohlTVCEx+b5hm2Y=;
        b=H4Br37hzk/phnF9laMIIXq0koWYbG6wzJssWT/LuLLUwEn/6Z8kJFgaeNR6g6ngMW2
         MYYLMHZ0HYx+QavYiLXK+zXOqIYtURIh4xlb6EZXRhYdHqE8AJrDt6Xf7jifDuRpNqXI
         tNDhwadhv0tCAa5xNnv0jjweidt+gRBuTP4y5MvS9dYXMePLKlwe1SxiwW4XhTEWmSrg
         agNbtWCoWwmx0qp2q/sqQYh+rndvlf39fYWe/3HC0q6VJopyEohACLjrLFMfcT2Qw4Un
         GrIQG49mUUSTSJRqlNyKRhGZz74Y/Ab15XiJGdUhh/+R64fCO/esoDoENPZx0mszx2Dn
         LaJQ==
X-Gm-Message-State: AJIora8jji0T0YywDVZvlf9oBA+nra1etQo0RgOuVsRbQB2gwbjGHX/1
	RRJaC27zFTdsejtapEdXtaqeIA==
X-Google-Smtp-Source: AGRyM1vNNODoy68cNcew+BOwykVJS5AyiEbndqdKVVh3DpwTH+wUBJ1HcGxnO6zSsyx2Hva19xbd8w==
X-Received: by 2002:a17:90b:3b52:b0:1ec:db2a:b946 with SMTP id ot18-20020a17090b3b5200b001ecdb2ab946mr838564pjb.229.1656438899502;
        Tue, 28 Jun 2022 10:54:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f15-20020a170902ff0f00b0016a84d232a6sm5432810plj.46.2022.06.28.10.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 10:54:59 -0700 (PDT)
Date: Tue, 28 Jun 2022 10:54:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, x86@kernel.org, dm-devel@redhat.com,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-can@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, io-uring@vger.kernel.org,
	lvs-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	kasan-dev@googlegroups.com, linux-mmc@vger.kernel.org,
	nvdimm@lists.linux.dev, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, linux-perf-users@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	v9fs-developer@lists.sourceforge.net, linux-rdma@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <202206281009.4332AA33@keescook>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
 <20220628004052.GM23621@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628004052.GM23621@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_105503_892154_E84FD58C 
X-CRM114-Status: GOOD (  16.71  )
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

On Mon, Jun 27, 2022 at 09:40:52PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 27, 2022 at 08:27:37PM +0200, Daniel Borkmann wrote:
> > [...]
> > Fyi, this breaks BPF CI:
> > 
> > https://github.com/kernel-patches/bpf/runs/7078719372?check_suite_focus=true
> > 
> >   [...]
> >   progs/map_ptr_kern.c:314:26: error: field 'trie_key' with variable sized type 'struct bpf_lpm_trie_key' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> >           struct bpf_lpm_trie_key trie_key;
> >                                   ^

The issue here seems to be a collision between "unknown array size"
and known sizes:

struct bpf_lpm_trie_key {
        __u32   prefixlen;      /* up to 32 for AF_INET, 128 for AF_INET6 */
        __u8    data[0];        /* Arbitrary size */
};

struct lpm_key {
	struct bpf_lpm_trie_key trie_key;
	__u32 data;
};

This is treating trie_key as a header, which it's not: it's a complete
structure. :)

Perhaps:

struct lpm_key {
        __u32 prefixlen;
        __u32 data;
};

I don't see anything else trying to include bpf_lpm_trie_key.

> 
> This will break the rdma-core userspace as well, with a similar
> error:
> 
> /usr/bin/clang-13 -DVERBS_DEBUG -Dibverbs_EXPORTS -Iinclude -I/usr/include/libnl3 -I/usr/include/drm -g -O2 -fdebug-prefix-map=/__w/1/s=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -Wmissing-prototypes -Wmissing-declarations -Wwrite-strings -Wformat=2 -Wcast-function-type -Wformat-nonliteral -Wdate-time -Wnested-externs -Wshadow -Wstrict-prototypes -Wold-style-definition -Werror -Wredundant-decls -g -fPIC   -std=gnu11 -MD -MT libibverbs/CMakeFiles/ibverbs.dir/cmd_flow.c.o -MF libibverbs/CMakeFiles/ibverbs.dir/cmd_flow.c.o.d -o libibverbs/CMakeFiles/ibverbs.dir/cmd_flow.c.o   -c ../libibverbs/cmd_flow.c
> In file included from ../libibverbs/cmd_flow.c:33:
> In file included from include/infiniband/cmd_write.h:36:
> In file included from include/infiniband/cmd_ioctl.h:41:
> In file included from include/infiniband/verbs.h:48:
> In file included from include/infiniband/verbs_api.h:66:
> In file included from include/infiniband/ib_user_ioctl_verbs.h:38:
> include/rdma/ib_user_verbs.h:436:34: error: field 'base' with variable sized type 'struct ib_uverbs_create_cq_resp' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>         struct ib_uverbs_create_cq_resp base;
>                                         ^
> include/rdma/ib_user_verbs.h:644:34: error: field 'base' with variable sized type 'struct ib_uverbs_create_qp_resp' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>         struct ib_uverbs_create_qp_resp base;

This looks very similar, a struct of unknown size is being treated as a
header struct:

struct ib_uverbs_create_cq_resp {
        __u32 cq_handle;
        __u32 cqe;
        __aligned_u64 driver_data[0];
};

struct ib_uverbs_ex_create_cq_resp {
        struct ib_uverbs_create_cq_resp base;
        __u32 comp_mask;
        __u32 response_length;
};

And it only gets used here:

                DECLARE_UVERBS_WRITE(IB_USER_VERBS_CMD_CREATE_CQ,
                                     ib_uverbs_create_cq,
                                     UAPI_DEF_WRITE_UDATA_IO(
                                             struct ib_uverbs_create_cq,
                                             struct ib_uverbs_create_cq_resp),
                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                     UAPI_DEF_METHOD_NEEDS_FN(create_cq)),

which must also be assuming it's a header. So probably better to just
drop the driver_data field? I don't see anything using it (that I can
find) besides as a sanity-check that the field exists and is at the end
of the struct.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
