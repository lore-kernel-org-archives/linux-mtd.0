Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zezyu-000098-OI
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 06:26:13 +0000
Subject: Re: [PATCH 24/27] ubifs: ubifs_dump: dump index area
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com,
 computersforpeace@gmail.com
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439973572-12489-25-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56039767.2060202@nod.at>
Date: Thu, 24 Sep 2015 08:25:43 +0200
MIME-Version: 1.0
In-Reply-To: <1439973572-12489-25-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yang,

while porting my tool to your patches I've spotted this:

Am 19.08.2015 um 10:39 schrieb Dongsheng Yang:
> +static int dump_zbr(struct ubifs_info *c, struct ubifs_zbranch *zbr)

[...]

> +
> +	if (le32_to_cpu(((struct ubifs_ch *)buf)->node_type) != UBIFS_IDX_NODE)

->node_type is u8 not le32.

> +		goto out;
> +
> +	idx = ((struct ubifs_idx_node *)buf);
> +	for (i = 0; i < le32_to_cpu(idx->child_cnt); i++) {

->child_cnt is le16 not le32.

> +		struct ubifs_branch *br;
> +		struct ubifs_zbranch child;

Please double check also other places where access on-disk data
to use the correct width.

Thanks,
//richard
