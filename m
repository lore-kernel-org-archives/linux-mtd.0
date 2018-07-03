Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faNBg-0000NY-8n
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 15:25:54 +0000
From: Richard Weinberger <richard@nod.at>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: xiaolei li <xiaolei.li@mediatek.com>, leqiao.peng@valeo.com,
 linux-mtd@lists.infradead.org
Subject: Re: UBIFS assert when create new sub-dir under a transmute enabled
 dir with Smack enabled
Date: Tue, 03 Jul 2018 17:25:29 +0200
Message-ID: <1779495.8Qfuh5Rb3p@blindfold>
In-Reply-To: <a8dc6814-2fd4-b3de-21fb-f57af7792d7d@schaufler-ca.com>
References: <1529571876.14673.77.camel@mhfsdcap03>
 <3818822.lxJep7IjOv@blindfold>
 <a8dc6814-2fd4-b3de-21fb-f57af7792d7d@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 3. Juli 2018, 17:22:30 CEST schrieb Casey Schaufler:
> >> The root cause is that the inode isn't locked during inode instantiation
> >> (from Mr.Schaufler), but we check whether inode is locked in
> >> xattr_set.
> 
> There is no need to do this check as all that
> gets done with the decision is to print the warning.
> The problem is the assumption that the inode is locked,
> which is doesn't have to be during instantiation.

I agree. Historically ubifs has a lot of (very good) asserts.
Some of them turn out to be too paranoid, like this one.

Thanks,
//richard
