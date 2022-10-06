Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A8AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 04:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aibIhNhw+STnmwq7R7wFBInLVApGJJN1oyXMc15OdQY=; b=4WzNxpKJqDuZv7
	dmqLXQMDZ90J9x5/f2nWISKwpLBY6Go6y8fT5Sc7ZgCs1yBMq9v4gPCqOJR8MaFlhY1BfXBuhOtLN
	sLqgOwCkOPEXsIFySXqDS1+B3YSp1hElixZBCVBEay+MymdLE32BdiSCc5iLEN739nEFDXupxq7Kj
	5Rfc2maHKz2JNEJGroc3b8oXUAUPBRh18XBSElcTBkzwKrjXxvgwP2LgtPxsX/9dcTnA99pRWxjwx
	B5kBTPqynR3CuQ2OHbsJu5n8sijIVSxYKVSUNToYzDAg9c28nC0Bmxnpf+vKQDhrlNKAhL7JdOuW0
	6hdN1ivN96mTtbfUZjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIvH-00HUPn-Cr; Thu, 06 Oct 2022 04:55:51 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIvD-00HUNY-Dw
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 04:55:49 +0000
Received: by mail-pg1-x532.google.com with SMTP id 78so829523pgb.13
        for <linux-mtd@lists.infradead.org>; Wed, 05 Oct 2022 21:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=51dSYIsgEywaJmdEPyI7vbp82hVQfJ6jQKHayIqsWH8=;
        b=e0wWc8f7UVTw3oXSVMh5SbOC8/ybqXORh0RfOsp37foz3bEHC+sZdUS2Cb48q2Rals
         cLwchuP5t4lVTMm+j0edXnLdA6eiOkpTvFVeI+b/+yanhEnnWG77EYRopMXRVrLoop3K
         nYwrVibqoZRWrTFw38o2fgxxWy4pLnB/kciNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=51dSYIsgEywaJmdEPyI7vbp82hVQfJ6jQKHayIqsWH8=;
        b=vI7W7LQ1v0QFPfOgUTxdiE9Mh8gvVyXe8kq7h67EDijE1keTp0mxWJkJYLobHBPPxr
         kGExa53pUtFJI927ShdKfiNyImqyceLhDJqvtjPiN8vBLdNdbNm+IrWo7lvDKU26KTKN
         dJ8XWHJv+dSDnG9bVOzUvXTwxvTEcMEabocm/w0wruhcyeDe3jjXPDFFeeHeZCrmNgri
         K6yNB8+MHu+THMirDJCewv5VMxVgVFCkBbyD9NEUZwkth2cQG97ZjDpAkjiPYQytFp+G
         nPVwEAN0nFBb4CLtfrvluUm93V28Eo6lHOeYD2042UNG9y/pfm/080KBWkiMmTYnRlyE
         cD5g==
X-Gm-Message-State: ACrzQf17GnnkLcYnuXKLFpujvMI7RucOwZ9c1NmBK5zmO2kVdOS3N/TS
	ks3lcGS34fT2Kmp7GbrdsjUlLQ==
X-Google-Smtp-Source: AMsMyM48HYcC17YfWxdcqN47yJn5oQWwbAuWOEmTE9E3JPhKRJg4eKNbmI4Bm6DfbK3tY9AIwV8yDw==
X-Received: by 2002:a63:d613:0:b0:45a:654:cf16 with SMTP id q19-20020a63d613000000b0045a0654cf16mr2835844pgg.611.1665032145428;
        Wed, 05 Oct 2022 21:55:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s14-20020a17090302ce00b0017a09ebd1e2sm11252393plk.237.2022.10.05.21.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 21:55:44 -0700 (PDT)
Date: Wed, 5 Oct 2022 21:55:43 -0700
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, Ajay Singh <ajay.kathat@microchip.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amitkumar Karwar <amitkarwar@gmail.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andy Gospodarek <andy@greyhouse.net>,
	Andy Lutomirski <luto@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Anna Schumaker <anna@kernel.org>,
	Arend van Spriel <aspriel@gmail.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Borislav Petkov <bp@alien8.de>, Chao Yu <chao@kernel.org>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Christoph Hellwig <hch@lst.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Chuck Lever <chuck.lever@oracle.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
	Franky Lin <franky.lin@broadcom.com>,
	Ganapathi Bhat <ganapathi017@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Hannes Reinecke <hare@suse.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Hao Luo <haoluo@google.com>, Haoyue Xu <xuhaoyue1@hisilicon.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Hugh Dickins <hughd@google.com>,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Ilya Dryomov <idryomov@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Jack Wang <jinpu.wang@ionos.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	James Smart <james.smart@broadcom.com>, Jan Kara <jack@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jay Vosburgh <j.vosburgh@gmail.com>,
	Jean-Paul Roubelat <jpr@f6fbb.org>,
	Jeff Layton <jlayton@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Jiri Olsa <jolsa@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Fastabend <john.fastabend@gmail.com>,
	John Stultz <jstultz@google.com>, Jon Maloy <jmaloy@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Julian Anastasov <ja@ssi.bg>, KP Singh <kpsingh@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Leon Romanovsky <leon@kernel.org>,
	Manish Rangankar <mrangankar@marvell.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Marco Elver <elver@google.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michael Jamet <michael.jamet@intel.com>,
	Michal Januszewski <spock@gentoo.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Neil Horman <nhorman@tuxdriver.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nilesh Javali <njavali@marvell.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>,
	Pravin B Shelar <pshelar@ovn.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Richard Weinberger <richard@nod.at>,
	Rohit Maheshwari <rohitm@chelsio.com>,
	Russell King <linux@armlinux.org.uk>,
	Sagi Grimberg <sagi@grimberg.me>,
	Santosh Shilimkar <santosh.shilimkar@oracle.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sharvari Harisangam <sharvari.harisangam@nxp.com>,
	Simon Horman <horms@verge.net.au>, Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>, Thomas Gleixner <tglx@linutronix.de>,
	Thomas Graf <tgraf@suug.ch>,
	Thomas Sailer <t.sailer@alumni.ethz.ch>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Varun Prakash <varun@chelsio.com>,
	Veaceslav Falico <vfalico@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
	Vinod Koul <vkoul@kernel.org>, Vlad Yasevich <vyasevich@gmail.com>,
	Wenpeng Liang <liangwenpeng@huawei.com>,
	Xinming Hu <huxinming820@gmail.com>, Xiubo Li <xiubli@redhat.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Ying Xue <ying.xue@windriver.com>,
	Yishai Hadas <yishaih@nvidia.com>, Yonghong Song <yhs@fb.com>,
	Yury Norov <yury.norov@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com, cake@lists.bufferbloat.net,
	ceph-devel@vger.kernel.org, coreteam@netfilter.org,
	dccp@vger.kernel.org, dev@openvswitch.org,
	dmaengine@vger.kernel.org, drbd-dev@lists.linbit.com,
	dri-devel@lists.freedesktop.org, kasan-dev@googlegroups.com,
	linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-fbdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-hams@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mm@kvack.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-xfs@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, lvs-devel@vger.kernel.org,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
	rds-devel@oss.oracle.com, SHA-cyfmac-dev-list@infineon.com,
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net
Subject: Re: [PATCH v1 0/5] treewide cleanup of random integer usage
Message-ID: <202210052148.B11CBC60@keescook>
References: <20221005214844.2699-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005214844.2699-1-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_215547_503077_B956F7F4 
X-CRM114-Status: GOOD (  36.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMTE6NDg6MzlQTSArMDIwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IEhpIGZvbGtzLAo+IAo+IFRoaXMgaXMgYSBmaXZlIHBhcnQgdHJlZXdpZGUg
Y2xlYW51cCBvZiByYW5kb20gaW50ZWdlciBoYW5kbGluZy4gVGhlCj4gcnVsZXMgZm9yIHJhbmRv
bSBpbnRlZ2VycyBhcmU6Cj4gCj4gLSBJZiB5b3Ugd2FudCBhIHNlY3VyZSBvciBhbiBpbnNlY3Vy
ZSByYW5kb20gdTY0LCB1c2UgZ2V0X3JhbmRvbV91NjQoKS4KPiAtIElmIHlvdSB3YW50IGEgc2Vj
dXJlIG9yIGFuIGluc2VjdXJlIHJhbmRvbSB1MzIsIHVzZSBnZXRfcmFuZG9tX3UzMigpLgo+ICAg
KiBUaGUgb2xkIGZ1bmN0aW9uIHByYW5kb21fdTMyKCkgaGFzIGJlZW4gZGVwcmVjYXRlZCBmb3Ig
YSB3aGlsZSBub3cKPiAgICAgYW5kIGlzIGp1c3QgYSB3cmFwcGVyIGFyb3VuZCBnZXRfcmFuZG9t
X3UzMigpLgo+IC0gSWYgeW91IHdhbnQgYSBzZWN1cmUgb3IgYW4gaW5zZWN1cmUgcmFuZG9tIHUx
NiwgdXNlIGdldF9yYW5kb21fdTE2KCkuCj4gLSBJZiB5b3Ugd2FudCBhIHNlY3VyZSBvciBhbiBp
bnNlY3VyZSByYW5kb20gdTgsIHVzZSBnZXRfcmFuZG9tX3U4KCkuCj4gLSBJZiB5b3Ugd2FudCBz
ZWN1cmUgb3IgaW5zZWN1cmUgcmFuZG9tIGJ5dGVzLCB1c2UgZ2V0X3JhbmRvbV9ieXRlcygpLgo+
ICAgKiBUaGUgb2xkIGZ1bmN0aW9uIHByYW5kb21fYnl0ZXMoKSBoYXMgYmVlbiBkZXByZWNhdGVk
IGZvciBhIHdoaWxlIG5vdwo+ICAgICBhbmQgaGFzIGxvbmcgYmVlbiBhIHdyYXBwZXIgYXJvdW5k
IGdldF9yYW5kb21fYnl0ZXMoKS4KPiAtIElmIHlvdSB3YW50IGEgbm9uLXVuaWZvcm0gcmFuZG9t
IHUzMiwgdTE2LCBvciB1OCBib3VuZGVkIGJ5IGEgY2VydGFpbgo+ICAgb3BlbiBpbnRlcnZhbCBt
YXhpbXVtLCB1c2UgcHJhbmRvbV91MzJfbWF4KCkuCj4gICAqIEkgc2F5ICJub24tdW5pZm9ybSIs
IGJlY2F1c2UgaXQgZG9lc24ndCBkbyBhbnkgcmVqZWN0aW9uIHNhbXBsaW5nIG9yCj4gICAgIGRp
dmlzaW9ucy4gSGVuY2UsIGl0IHN0YXlzIHdpdGhpbiB0aGUgcHJhbmRvbV8qIG5hbWVzcGFjZS4K
PiAKPiBUaGVzZSBydWxlcyBvdWdodCB0byBiZSBhcHBsaWVkIHVuaWZvcm1seSwgc28gdGhhdCB3
ZSBjYW4gY2xlYW4gdXAgdGhlCj4gZGVwcmVjYXRlZCBmdW5jdGlvbnMsIGFuZCBlYXJuIHRoZSBi
ZW5lZml0cyBvZiB1c2luZyB0aGUgbW9kZXJuCj4gZnVuY3Rpb25zLiBJbiBwYXJ0aWN1bGFyLCBp
biBhZGRpdGlvbiB0byB0aGUgYm9yaW5nIHN1YnN0aXR1dGlvbnMsIHRoaXMKPiBwYXRjaHNldCBh
Y2NvbXBsaXNoZXMgYSBmZXcgbmljZSBlZmZlY3RzOgo+IAo+IC0gQnkgdXNpbmcgcHJhbmRvbV91
MzJfbWF4KCkgd2l0aCBhbiB1cHBlci1ib3VuZCB0aGF0IHRoZSBjb21waWxlciBjYW4KPiAgIHBy
b3ZlIGF0IGNvbXBpbGUtdGltZSBpcyDiiaQ2NTUzNiBvciDiiaQyNTYsIGludGVybmFsbHkgZ2V0
X3JhbmRvbV91MTYoKQo+ICAgb3IgZ2V0X3JhbmRvbV91OCgpIGlzIHVzZWQsIHdoaWNoIHdhc3Rl
cyBmZXdlciBiYXRjaGVkIHJhbmRvbSBieXRlcywKPiAgIGFuZCBoZW5jZSBoYXMgaGlnaGVyIHRo
cm91Z2hwdXQuCj4gCj4gLSBCeSB1c2luZyBwcmFuZG9tX3UzMl9tYXgoKSBpbnN0ZWFkIG9mICUs
IHdoZW4gdGhlIHVwcGVyLWJvdW5kIGlzIG5vdCBhCj4gICBjb25zdGFudCwgZGl2aXNpb24gaXMg
c3RpbGwgYXZvaWRlZCwgYmVjYXVzZSBwcmFuZG9tX3UzMl9tYXgoKSB1c2VzCj4gICBhIGZhc3Rl
ciBtdWx0aXBsaWNhdGlvbi1iYXNlZCB0cmljayBpbnN0ZWFkLgo+IAo+IC0gQnkgdXNpbmcgZ2V0
X3JhbmRvbV91MTYoKSBvciBnZXRfcmFuZG9tX3U4KCkgaW4gY2FzZXMgd2hlcmUgdGhlIHJldHVy
bgo+ICAgdmFsdWUgaXMgaW50ZW5kZWQgdG8gaW5kZWVkIGJlIGEgdTE2IG9yIGEgdTgsIHdlIHdh
c3RlIGZld2VyIGJhdGNoZWQKPiAgIHJhbmRvbSBieXRlcywgYW5kIGhlbmNlIGhhdmUgaGlnaGVy
IHRocm91Z2hwdXQuCj4gCj4gU28sIGJhc2VkIG9uIHRob3NlIHJ1bGVzIGFuZCBiZW5lZml0cyBm
cm9tIGZvbGxvd2luZyB0aGVtLCB0aGlzIHBhdGNoc2V0Cj4gYnJlYWtzIGRvd24gaW50byB0aGUg
Zm9sbG93aW5nIGZpdmUgc3RlcHM6Cj4gCj4gMSkgUmVwbGFjZSBgcHJhbmRvbV91MzIoKSAlIG1h
eGAgYW5kIHZhcmlhbnRzIHRoZXJlb2Ygd2l0aAo+ICAgIHByYW5kb21fdTMyX21heChtYXgpLgo+
IAo+IDIpIFJlcGxhY2UgYCh0eXBlKWdldF9yYW5kb21fdTMyKClgIGFuZCB2YXJpYW50cyB0aGVy
ZW9mIHdpdGgKPiAgICBnZXRfcmFuZG9tX3UxNigpIG9yIGdldF9yYW5kb21fdTgoKS4gSSB0b29r
IHRoZSBwYWlucyB0byBhY3R1YWxseQo+ICAgIGxvb2sgYW5kIHNlZSB3aGF0IGV2ZXJ5IGx2YWx1
ZSB0eXBlIHdhcyBhY3Jvc3MgdGhlIGVudGlyZSB0cmVlLgo+IAo+IDMpIFJlcGxhY2UgcmVtYWlu
aW5nIGRlcHJlY2F0ZWQgdXNlcyBvZiBwcmFuZG9tX3UzMigpIHdpdGgKPiAgICBnZXRfcmFuZG9t
X3UzMigpLiAKPiAKPiA0KSBSZXBsYWNlIHJlbWFpbmluZyBkZXByZWNhdGVkIHVzZXMgb2YgcHJh
bmRvbV9ieXRlcygpIHdpdGgKPiAgICBnZXRfcmFuZG9tX2J5dGVzKCkuCj4gCj4gNSkgUmVtb3Zl
IHRoZSBkZXByZWNhdGVkIGFuZCBub3ctdW51c2VkIHByYW5kb21fdTMyKCkgYW5kCj4gICAgcHJh
bmRvbV9ieXRlcygpIGlubGluZSB3cmFwcGVyIGZ1bmN0aW9ucy4KPiAKPiBJIHdhcyB0aGlua2lu
ZyBvZiB0YWtpbmcgdGhpcyB0aHJvdWdoIG15IHJhbmRvbS5naXQgdHJlZSAob24gd2hpY2ggdGhp
cwo+IHNlcmllcyBpcyBjdXJyZW50bHkgYmFzZWQpIGFuZCBzdWJtaXR0aW5nIGl0IG5lYXIgdGhl
IGVuZCBvZiB0aGUgbWVyZ2UKPiB3aW5kb3csIG9yIHdhaXRpbmcgZm9yIHRoZSB2ZXJ5IGVuZCBv
ZiB0aGUgNi4xIGN5Y2xlIHdoZW4gdGhlcmUgd2lsbCBiZQo+IHRoZSBmZXdlc3QgbmV3IHBhdGNo
ZXMgYnJld2luZy4gSWYgc29tZWJvZHkgd2l0aCBzb21lIHRyZWV3aWRlLWNsZWFudXAKPiBleHBl
cmllbmNlIG1pZ2h0IHNoYXJlIHNvbWUgd2lzZG9tIGFib3V0IHdoYXQgdGhlIGJlc3QgdGltaW5n
IHVzdWFsbHkKPiB3aW5kcyB1cCBiZWluZywgSSdtIGFsbCBlYXJzLgoKSXQnZCBiZSBuaWNlIHRv
IGNhcHR1cmUgc29tZSAoYWxsPykgb2YgdGhlIGFib3ZlIHNvbWV3aGVyZS4gUGVyaGFwcyBqdXN0
CmEgbWFzc2l2ZSBjb21tZW50IGluIHRoZSBoZWFkZXI/Cgo+IEkndmUgQ0MnZCBnZXRfbWFpbnRh
aW5lcnMucGwsIHdoaWNoIGlzIGEgcHJldHR5IGJpZyBsaXN0LiBQcm9iYWJseSBzb21lCj4gcG9y
dGlvbiBvZiB0aG9zZSBhcmUgZ29pbmcgdG8gYm91bmNlLCB0b28sIGFuZCBldmVyeXRpbWUgeW91
IHJlcGx5IHRvCj4gdGhpcyB0aHJlYWQsIHlvdSdsbCBoYXZlIHRvIGRlYWwgd2l0aCBhIGJ1bmNo
IG9mIGJvdW5jZXMgY29taW5nCj4gaW1tZWRpYXRlbHkgYWZ0ZXIuIEFuZCBhIHJlY2lwaWVudCBs
aXN0IHRoaXMgYmlnIHdpbGwgcHJvYmFibHkgZG9jayBteQo+IGVtYWlsIGRvbWFpbidzIHNwYW0g
cmVwdXRhdGlvbiwgYXQgbGVhc3QgdGVtcG9yYXJpbHkuIFNpZ2guIEkgdGhpbmsKPiB0aGF0J3Mg
anVzdCBob3cgaXQgZ29lcyB3aXRoIHRyZWV3aWRlIGNsZWFudXBzIHRob3VnaC4gQWdhaW4sIGxl
dCBtZQo+IGtub3cgaWYgSSdtIGRvaW5nIGl0IHdyb25nLgoKSSB1c3VhbGx5IHN0aWNrIHRvIGp1
c3QgbWFpbGluZyBsaXN0cyBhbmQgc3Vic3lzdGVtIG1haW50YWluZXJzLgoKSWYgYW55IG9mIHRo
ZSBzdWJzeXN0ZW1zIGFzayB5b3UgdG8gYnJlYWsgdGhpcyB1cCAoSSBob3BlIG5vdCksIEkndmUg
Z290CnRoaXNbMV0sIHdoaWNoIGRvZXMgYSByZWFzb25hYmxlIGpvYiBvZiBzcGxpdHRpbmcgYSBj
b21taXQgdXAgaW50bwpzZXBhcmF0ZSBjb21taXRzIGZvciBlYWNoIG1hdGNoaW5nIHN1YnN5c3Rl
bS4KClNob3dpbmcgdGhhdCBhIHRyZWV3aWRlIGNoYW5nZSBjYW4gYmUgcmVwcm9kdWNlZCBtZWNo
YW5pY2FsbHkgaGVscHMgd2l0aAprZWVwaW5nIGl0IHRvZ2V0aGVyIGFzIG9uZSBiaXQgdHJlZXdp
ZGUgcGF0Y2gsIHRvbywgSSd2ZSBmb3VuZC4gOikKClRoYW5rIHlvdSBmb3IgdGhlIGNsZWFudXAh
IFRoZSAidTggcm5kID0gZ2V0X3JhbmRvbV91MzIoKSIgaW4gdGhlIHRyZWUKaGFzIGJvdGhlcmVk
IG1lIGZvciBhIGxvb29vbmcgdGltZS4KCi1LZWVzCgotLSAKS2VlcyBDb29rCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
