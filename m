Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cphiq-00057M-4t
 for linux-mtd@lists.infradead.org; Sun, 19 Mar 2017 20:46:42 +0000
Subject: Re: [PATCH 2/4] ubifs: Fix unlink code wrt. double hash lookups
To: Hyunchul Lee <hyc.lee@gmail.com>
References: <20170209212837.14197-1-richard@nod.at>
 <20170209212837.14197-2-richard@nod.at> <20170309070439.GA31469@sebu>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com, kernel-team@lge.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <cd4c5713-d091-3445-071e-d880c40710d9@nod.at>
Date: Sun, 19 Mar 2017 21:46:16 +0100
MIME-Version: 1.0
In-Reply-To: <20170309070439.GA31469@sebu>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hyunchul,

Am 09.03.2017 um 08:04 schrieb Hyunchul Lee:
>> -	int n, err, type = key_type(c, key);
>> -	struct ubifs_znode *znode;
>> +	int err;
> 
> i guess that err should be initialized with -ENOENT to avoid the first call of  
> tnc_next(c, &znode, n). 

Yes. err is used unitialized. Happened most likely while moving the code block around.

[...]

>>  /**
>> + * ubifs_tnc_remove_dh - remove an index entry for a "double hashed" node.
>> + * @c: UBIFS file-system description object
>> + * @key: key of node
>> + * @cookie: node cookie for collision resolution
>> + *
>> + * Returns %0 on success or negative error code on failure.
>> + */
>> +int ubifs_tnc_remove_dh(struct ubifs_info *c, const union ubifs_key *key,
>> +			uint32_t cookie)
>> +{
>> +	int n, err;
>> +	struct ubifs_znode *znode;
>> +	struct ubifs_dent_node *dent;
>> +	struct ubifs_zbranch *zbr;
>> +
>> +	if (!c->double_hash)
>> +		return -EOPNOTSUPP;
>> +
>> +	mutex_lock(&c->tnc_mutex);
>> +	err = lookup_level0_dirty(c, key, &znode, &n);
>> +	if (err <= 0)
>> +		goto out_unlock;
>> +
>> +	zbr = &znode->zbranch[n];
>> +	dent = kmalloc(UBIFS_MAX_DENT_NODE_SZ, GFP_NOFS);
>> +	if (!dent) {
>> +		err = -ENOMEM;
>> +		goto out_unlock;
>> +	}
>> +
>> +	err = tnc_read_hashed_node(c, zbr, dent);
>> +	if (err)
>> +		goto out_free;
>> +
>> +	/* If the cookie does not match, we're facing a hash collision. */
>> +	if (le32_to_cpu(dent->cookie) != cookie) {
>> +		union ubifs_key start_key;
>> +
>> +		lowest_dent_key(c, &start_key, key_inum(c, key));
>> +
>> +		err = ubifs_lookup_level0(c, &start_key, &znode, &n);
>> +		if (unlikely(err < 0))
>> +			goto out_unlock;
> 
> i guess that out_unlock should be replaced with out_free to free dent.
>

Ohhh, correct.

>> +
>> +		err = search_dh_cookie(c, key, dent, cookie, &znode, &n);
>> +		if (err)
>> +			goto out_free;
>> +	}
>> +
>> +	if (znode->cnext || !ubifs_zn_dirty(znode)) {
>> +		znode = dirty_cow_bottom_up(c, znode);
>> +		if (IS_ERR(znode)) {
>> +			err = PTR_ERR(znode);
>> +			goto out_unlock;
> 
> this out_unlock should also be.

Yep. Both are copy&paste errors. :-(

Thanks a lot for pointing this out, your help is much appreciated!

Thanks,
//richard
