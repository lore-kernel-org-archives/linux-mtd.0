Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1RFE-0004dp-Hz
 for linux-mtd@lists.infradead.org; Mon, 30 Jun 2014 02:23:01 +0000
Message-ID: <53B0C9CB.8080208@huawei.com>
Date: Mon, 30 Jun 2014 10:22:03 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2 2/2] UBIFS: fix fatal race condition
References: <1404051371-29756-1-git-send-email-dedekind1@gmail.com>
 <1404051371-29756-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1404051371-29756-2-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

It's better than mine. I've tested some cases to reproduce this race
and found "> c->max_bud_bytes" is mostly hit in add_bud_to_log() but
'< c->min_log_bytes' is hardly hit. I think this race condition merely
occur and power cut frequently must be one of reasons.

Our fixes harm the performance a bit. Other process should wait for
write_mst_node() done before writing a new bud even if this commit is
not triggered by log lebs full. I don't know how to avoid this but
I think current version is enough. Flash is very fast.

I would like to test these patches now and report to you soon.

Thanks a lot!

Hu
