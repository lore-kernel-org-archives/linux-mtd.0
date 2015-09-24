Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zf0C1-00039c-CL
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 06:39:46 +0000
Message-ID: <5603990C.5050006@cn.fujitsu.com>
Date: Thu, 24 Sep 2015 14:32:44 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>,
 <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 24/27] ubifs: ubifs_dump: dump index area
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439973572-12489-25-git-send-email-yangds.fnst@cn.fujitsu.com>
 <56039767.2060202@nod.at>
In-Reply-To: <56039767.2060202@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/24/2015 02:25 PM, Richard Weinberger wrote:
> Yang,
>
> while porting my tool to your patches I've spotted this:
>
> Am 19.08.2015 um 10:39 schrieb Dongsheng Yang:
>> +static int dump_zbr(struct ubifs_info *c, struct ubifs_zbranch *zbr)
>
> [...]
>
>> +
>> +	if (le32_to_cpu(((struct ubifs_ch *)buf)->node_type) != UBIFS_IDX_NODE)
>
> ->node_type is u8 not le32.
>
>> +		goto out;
>> +
>> +	idx = ((struct ubifs_idx_node *)buf);
>> +	for (i = 0; i < le32_to_cpu(idx->child_cnt); i++) {
>
> ->child_cnt is le16 not le32.
>
>> +		struct ubifs_branch *br;
>> +		struct ubifs_zbranch child;
>
> Please double check also other places where access on-disk data
> to use the correct width.

Oh, yes. Will update it soon.

Yang
>
> Thanks,
> //richard
> .
>
