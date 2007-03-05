From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Richard Purdie'" <rpurdie@openedhand.com>,
	"'Nick Piggin'" <nickpiggin@yahoo.com.au>,
	"'Hugh Dickins'" <hugh@veritas.com>,
	"'kernel list'" <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>
References: <1172850902.11149.130.camel@localhost.localdomain>
Subject: RE: [PATCH 8/9] mtd: Allow mtd block device drivers to have a
	custom	ioctl function
Date: Mon, 5 Mar 2007 11:23:05 +0900
Message-ID: <009601c75ecd$37b4c950$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <1172850902.11149.130.camel@localhost.localdomain>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To make a modules, we have to export "get_mtd_blktrans_gendisk".

"get_mtd_blktrans_gendisk" is used at mtdswap.

>  
> +struct gendisk *get_mtd_blktrans_gendisk(struct 
> mtd_blktrans_dev *dev)
> +{
> +	return dev->blkcore_priv;
> +}
> +

@@ -469,6 +480,7 @@ EXPORT_SYMBOL_GPL(register_mtd_blktrans);
 EXPORT_SYMBOL_GPL(deregister_mtd_blktrans);
 EXPORT_SYMBOL_GPL(add_mtd_blktrans_dev);
 EXPORT_SYMBOL_GPL(del_mtd_blktrans_dev);
+EXPORT_SYMBOL_GPL(get_mtd_blktrans_gendisk);

 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_LICENSE("GPL");

Thank you,
Kyungmin Park
