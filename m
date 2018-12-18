Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZA6N-00067W-QE
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2018 07:47:41 +0000
From: Richard Weinberger <richard@nod.at>
To: Hou Tao <houtao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [bug report] Got "read_pnode: error -22 reading pnode" during
 ubifs mount
Date: Tue, 18 Dec 2018 08:47:27 +0100
Message-ID: <2459675.gUmZENHmIG@blindfold>
In-Reply-To: <762a7385-0caf-9a5a-ff62-603452fb1bd1@huawei.com>
References: <402695c6-7ba9-abe9-4ccd-ea598ea2511e@huawei.com>
 <1744858.UbCnKIVnxf@blindfold>
 <762a7385-0caf-9a5a-ff62-603452fb1bd1@huawei.com>
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

Am Dienstag, 18. Dezember 2018, 02:18:22 CET schrieb Hou Tao:
> > In doubt, try to reproduce with 7e5471ce6dba5f28a3c7afdfe168655d236f677b applied
> > and disable UBIFS xattr support completely.
> > 
> Thanks for your suggestion. We will try once we have shorten the period of reproduction.

BTW: Enable lpt checking:
echo 1 > /sys/kernel/debug/ubifs/chk_lprops

Thanks,
//richard
