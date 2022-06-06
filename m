Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7706BC43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 04:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QIMvQqt2gdnAzXoY6eUDeiA3QVR30uerWC0zlIoD6Dc=; b=GTVNPBS3MZF3dR
	XqIuo49YeYGn4JwxW9IroI3pqvWgon+fl7mKP8WWdchFvAvJYfFAtJlTZuNSP/hXQDuo97mS8r9V4
	ebvu3kPtXoGhNMcc/2ZV2f4EVYk407PXhttKhJuXbRET2TOlj//ITNUxv6CW10KwsfQfEnHJThU4Q
	hlR2VtpQlmyb0kI3m3VXWH0RmC0hdS28ZOwEQBf/hyWSzWpZRzXccNVGp405EKlfojlLTXX20acVd
	DjS8J5/eDzBr1cZ7yhyBkuvY8sPzc1tpEi4jbnpxkCQJZnf3gHYG/9Uzs4LmaWMo2Ib62/aSOGbVV
	71zoEtJRUFcqQp+sV18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny3uG-00Ge6c-2K; Mon, 06 Jun 2022 03:59:56 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny3u9-00Ge5m-VC
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 03:59:54 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 3-20020a17090a174300b001e426a02ac5so13647848pjm.2
        for <linux-mtd@lists.infradead.org>; Sun, 05 Jun 2022 20:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=F3dlgaXmkDpDEty0Y4DNCWJHlmIObEDWkeyV88bJ1Pg=;
        b=BJBW1yOCWpOULW0xyTrerbG4y7zPYfn1I61YNgD7Y70F8Q1r8/DhnX8ELeAIikMmoJ
         1H06V89YylT/lmz+v7kGZMokx4yYvi7KuCd1pDt5Y40Noi2+c7TUw3BkWmdFzXUQG51A
         QN4+Vd8DTPCp8UYaqAUVXnQHlgojK8SufP8tdKga6bUuZKJGQg1ylbJIdt+LAvTSx3GR
         ByuG3q2sjMJLEkYCtghZO2ndpj8NR7n/fR64SQA+FUbygh4oHy4nFvHjeeYYEa68cYJj
         t5Dxl0vt7EJ01dSGs75qVqBGbcyiz6DOX+DKxCX5fiyQTQ6v9OphrCyKgwD/kiSFJCRU
         ytJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=F3dlgaXmkDpDEty0Y4DNCWJHlmIObEDWkeyV88bJ1Pg=;
        b=QJIV99d53ZeYpYrSrZWR5vnt358mL5WlFG0nBrSfMotgErpnBnBU/jJyz9OjAh3fTD
         R6rjwMnYu7IxU8E1C1DItjr5rvg+75BRm+3yAAJJwgXAny1EvGo8GwBLPdyaqysY3I6h
         T5Q4ZBUA8E1Um8Cjepe70hlqjhLET/uv6c0MfhaH3rx4mSjO8LW27soQIpdDKEavyETI
         Vxp1xAwb2PsrigmIoOD6SJbBgzjaxxgBkm6orcOnYHc8KzhMDicViRJMJXy9qNIH5h5A
         uZ3fY38GPrDIYkGboDTQ5mmWNoBytdEHy6W608/l1dLqlJAxmMvNxGLqVYuDRkx/rNAs
         9YWw==
X-Gm-Message-State: AOAM530Q7+tlg4qim4tmc1WgBLd3nNiaL+FnTD1R+ieXHBM86VMLEmoD
	j2DpD1oNWvgCEZmy/gliePcAO332z6w=
X-Google-Smtp-Source: ABdhPJz018j7KIAM1lyTIrFxMTwuSnzEkr87RwbyQbdQnw5vzBA49wIGQTCLtHW+Xps8wJVjcivrFQ==
X-Received: by 2002:a17:90a:9914:b0:1db:d10f:1fcf with SMTP id b20-20020a17090a991400b001dbd10f1fcfmr59116261pjp.241.1654487984072;
        Sun, 05 Jun 2022 20:59:44 -0700 (PDT)
Received: from localhost (subs03-180-214-233-92.three.co.id. [180.214.233.92])
        by smtp.gmail.com with ESMTPSA id bi16-20020a056a00311000b0050dc762815asm2798215pfb.52.2022.06.05.20.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 20:59:43 -0700 (PDT)
Date: Mon, 6 Jun 2022 10:59:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	David Howells <dhowells@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Baokun Li <libaokun1@huawei.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Kyeong Yoo <kyeong.yoo@alliedtelesis.co.nz>,
	hongnanli <hongnan.li@linux.alibaba.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: partly outside array bounds warning on fs/jffs2/summary.c, GCC 12.1.0
Message-ID: <Yp17rHxRb6d5JrHd@debian.me>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_205950_065665_DE904E64 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

Hi everyone,

When I build arm64 kernel with GCC 12.1.0 (bcm2711_defconfig), I get
partly outside array bounds warning on fs/jffs2/summary.c:

  CC [M]  fs/jffs2/summary.o
In file included from fs/jffs2/summary.c:23:
In function 'jffs2_sum_add_mem',
    inlined from 'jffs2_sum_add_inode_mem' at fs/jffs2/summary.c:130:9:
fs/jffs2/nodelist.h:43:28: warning: array subscript 'union jffs2_sum_mem[0]' is partly outside array bounds of 'unsigned char[26]' [-Warray-bounds]
   43 | #define je16_to_cpu(x) ((x).v16)
      |                        ~~~~^~~~~
fs/jffs2/summary.c:71:17: note: in expansion of macro 'je16_to_cpu'
   71 |         switch (je16_to_cpu(item->u.nodetype)) {
      |                 ^~~~~~~~~~~
In file included from fs/jffs2/summary.c:17:
In function 'kmalloc',
    inlined from 'jffs2_sum_add_inode_mem' at fs/jffs2/summary.c:118:37:
./include/linux/slab.h:600:24: note: object of size 26 allocated by 'kmem_cache_alloc_trace'
  600 |                 return kmem_cache_alloc_trace(
      |                        ^~~~~~~~~~~~~~~~~~~~~~~
  601 |                                 kmalloc_caches[kmalloc_type(flags)][index],
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  602 |                                 flags, size);
      |                                 ~~~~~~~~~~~~
In file included from fs/jffs2/nodelist.h:22:
In function 'jffs2_sum_add_mem',
    inlined from 'jffs2_sum_add_inode_mem' at fs/jffs2/summary.c:130:9:
fs/jffs2/summary.c:79:73: warning: array subscript 'union jffs2_sum_mem[0]' is partly outside array bounds of 'unsigned char[26]' [-Warray-bounds]
   79 |                         s->sum_size += JFFS2_SUMMARY_DIRENT_SIZE(item->d.nsize);
fs/jffs2/summary.h:34:80: note: in definition of macro 'JFFS2_SUMMARY_DIRENT_SIZE'
   34 | #define JFFS2_SUMMARY_DIRENT_SIZE(x) (sizeof(struct jffs2_sum_dirent_flash) + (x))
      |                                                                                ^
In function 'kmalloc',
    inlined from 'jffs2_sum_add_inode_mem' at fs/jffs2/summary.c:118:37:
./include/linux/slab.h:600:24: note: object of size 26 allocated by 'kmem_cache_alloc_trace'
  600 |                 return kmem_cache_alloc_trace(
      |                        ^~~~~~~~~~~~~~~~~~~~~~~
  601 |                                 kmalloc_caches[kmalloc_type(flags)][index],
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  602 |                                 flags, size);
      |                                 ~~~~~~~~~~~~

I first found these warnings when reviewing linux-5.18.y stable rc [1],
for which Greg recommends me to contact JFFS subsystem developers.

Thanks.

[1]: https://lore.kernel.org/stable/YpxU%2FbVogip64iQF@debian.me/ 

-- 
An old man doll... just what I always wanted! - Clara

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
