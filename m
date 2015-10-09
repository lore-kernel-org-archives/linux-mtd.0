Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkOq9-0007Eq-TS
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2015 03:59:30 +0000
Message-ID: <561739F8.2030705@cn.fujitsu.com>
Date: Fri, 9 Oct 2015 11:52:24 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: David Gstir <david@sigma-star.at>
CC: <dedekind1@gmail.com>, <richard@nod.at>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 19/27] ubifs: ubifs_dump: dump master node
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439973572-12489-20-git-send-email-yangds.fnst@cn.fujitsu.com>
 <2E6921D4-C626-42DD-8E4E-6CB6AEFCD517@sigma-star.at>
In-Reply-To: <2E6921D4-C626-42DD-8E4E-6CB6AEFCD517@sigma-star.at>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/08/2015 06:07 PM, David Gstir wrote:
> Hi Yang,
>
> I just spotted this issue while reading through your patches:
>
>> On 19.08.2015, at 10:39, Dongsheng Yang <yangds.fnst@cn.fujitsu.com> wrote:
>
> [...]
>
>> +static int scan_for_master(struct ubifs_info *c, struct ubifs_mst_node *mst_node)
>> {
>> +	struct ubifs_scan_leb *sleb;
>> +	struct ubifs_scan_node *snod;
>> +	int lnum, offs = 0, nodes_cnt;
>> +	static void *leb_buf;
>> 	int err = 0;
>> +	
>> +	lnum = UBIFS_MST_LNUM;
>>
>> -	err = init();
>> -	if (err)
>> +	leb_buf = malloc(c->leb_size);
>> +	if (!leb_buf)
>> +		return -ENOMEM;
>> +
>> +	sleb = ubifs_scan(c, lnum, 0, leb_buf, 1);
>> +	if (IS_ERR(sleb)) {
>> +		err = PTR_ERR(sleb);
>> 		goto out;
>
> This goto will run ubifs_scan_destroy(sleb), which does not work since sleb ist just an ERR_PTR here.

Yes, my mistake, will update it soon.

Thanx
Yang
>
>> +	}
>> +	nodes_cnt = sleb->nodes_cnt;
>> +	if (nodes_cnt > 0) {
>> +		snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node,
>> +				  list);
>> +		if (snod->type != UBIFS_MST_NODE) {
>> +			err = -EINVAL;
>> +			goto out;
>> +		}
>> +		memcpy(mst_node, snod->node, snod->len);
>> +		offs = snod->offs;
>> +	}
>> +	ubifs_scan_destroy(sleb);
>> +
>> +	lnum += 1;
>> +
>> +	sleb = ubifs_scan(c, lnum, 0, leb_buf, 1);
>> +	if (IS_ERR(sleb)) {
>> +		err = PTR_ERR(sleb);
>> +		goto out;
>
> Same here.
>
>> +	}
>> +	err = -EUCLEAN;
>> +	if (sleb->nodes_cnt != nodes_cnt)
>> +		goto out;
>> +	if (!sleb->nodes_cnt)
>> +		goto out;
>> +	snod = list_entry(sleb->nodes.prev, struct ubifs_scan_node, list);
>> +	if (snod->type != UBIFS_MST_NODE) {
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>> +	if (snod->offs != offs)
>> +		goto out;
>> +	if (memcmp((void *)mst_node + UBIFS_CH_SZ,
>> +		   (void *)snod->node + UBIFS_CH_SZ,
>> +		   UBIFS_MST_NODE_SZ - UBIFS_CH_SZ))
>> +		goto out;
>> +	err = 0;
>> +
>> +out:
>> +	free(leb_buf);
>> +	ubifs_scan_destroy(sleb);
>> +	return err;
>> +}
>
> Cheers,
> David
>
>
> .
>
