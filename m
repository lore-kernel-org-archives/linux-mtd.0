Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zk86u-0001Hw-31
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2015 10:07:41 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH 19/27] ubifs: ubifs_dump: dump master node
From: David Gstir <david@sigma-star.at>
In-Reply-To: <1439973572-12489-20-git-send-email-yangds.fnst@cn.fujitsu.com>
Date: Thu, 8 Oct 2015 12:07:14 +0200
Cc: dedekind1@gmail.com, richard@nod.at, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E6921D4-C626-42DD-8E4E-6CB6AEFCD517@sigma-star.at>
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439973572-12489-20-git-send-email-yangds.fnst@cn.fujitsu.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Yang,

I just spotted this issue while reading through your patches:

> On 19.08.2015, at 10:39, Dongsheng Yang <yangds.fnst@cn.fujitsu.com> =
wrote:

[...]

> +static int scan_for_master(struct ubifs_info *c, struct =
ubifs_mst_node *mst_node)
> {
> +	struct ubifs_scan_leb *sleb;
> +	struct ubifs_scan_node *snod;
> +	int lnum, offs =3D 0, nodes_cnt;
> +	static void *leb_buf;
> 	int err =3D 0;
> +=09
> +	lnum =3D UBIFS_MST_LNUM;
>=20
> -	err =3D init();
> -	if (err)
> +	leb_buf =3D malloc(c->leb_size);
> +	if (!leb_buf)
> +		return -ENOMEM;
> +
> +	sleb =3D ubifs_scan(c, lnum, 0, leb_buf, 1);
> +	if (IS_ERR(sleb)) {
> +		err =3D PTR_ERR(sleb);
> 		goto out;

This goto will run ubifs_scan_destroy(sleb), which does not work since =
sleb ist just an ERR_PTR here.

> +	}
> +	nodes_cnt =3D sleb->nodes_cnt;
> +	if (nodes_cnt > 0) {
> +		snod =3D list_entry(sleb->nodes.prev, struct =
ubifs_scan_node,
> +				  list);
> +		if (snod->type !=3D UBIFS_MST_NODE) {
> +			err =3D -EINVAL;
> +			goto out;
> +		}
> +		memcpy(mst_node, snod->node, snod->len);
> +		offs =3D snod->offs;
> +	}
> +	ubifs_scan_destroy(sleb);
> +
> +	lnum +=3D 1;
> +
> +	sleb =3D ubifs_scan(c, lnum, 0, leb_buf, 1);
> +	if (IS_ERR(sleb)) {
> +		err =3D PTR_ERR(sleb);
> +		goto out;

Same here.

> +	}
> +	err =3D -EUCLEAN;
> +	if (sleb->nodes_cnt !=3D nodes_cnt)
> +		goto out;
> +	if (!sleb->nodes_cnt)
> +		goto out;
> +	snod =3D list_entry(sleb->nodes.prev, struct ubifs_scan_node, =
list);
> +	if (snod->type !=3D UBIFS_MST_NODE) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
> +	if (snod->offs !=3D offs)
> +		goto out;
> +	if (memcmp((void *)mst_node + UBIFS_CH_SZ,
> +		   (void *)snod->node + UBIFS_CH_SZ,
> +		   UBIFS_MST_NODE_SZ - UBIFS_CH_SZ))
> +		goto out;
> +	err =3D 0;
> +
> +out:
> +	free(leb_buf);
> +	ubifs_scan_destroy(sleb);
> +	return err;
> +}

Cheers,
David
