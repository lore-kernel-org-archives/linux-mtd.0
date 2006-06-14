Received: from lon-del-03.spheriq.net ([195.46.50.99])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FqTBc-0000lM-2k
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 07:05:33 -0400
Received: from lon-out-02.spheriq.net ([195.46.50.130])
	by lon-del-03.spheriq.net with ESMTP id k5EB1Yb9003441
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 11:05:16 GMT
Received: from lon-cus-02.spheriq.net (lon-cus-02.spheriq.net [195.46.50.38])
	by lon-out-02.spheriq.net with ESMTP id k5EAvw2b005177
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 10:57:58 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by lon-cus-02.spheriq.net with ESMTP id k5EAvuUS028119
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2006 10:57:57 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76779DA46
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jun 2006 10:57:51 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3925A473EA
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jun 2006 10:57:51 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: D-Cache on a NOR flash device
Date: Wed, 14 Jun 2006 12:57:49 +0200
Message-ID: <000601c68fa1$60960970$253682a4@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


How can I enable the D-CACHE on a NOR flash device? I have add in the =
flash probe function (omapflash_probe() in the file =
drivers/mtd/maps/omap_nor.c) the following instructions:

struct omapflash_info {
	struct mtd_partition	*parts;
	struct mtd_info		*mtd;
	struct map_info		map;
};

...

struct omapflash_info *info;

...

static int __devinit omapflash_probe(struct platform_device *pdev)
{
...
	info->map.cached =3D ioremap_cached(res->starts, size);
	if(!info->map.cached ){
		printk(KERN_WARNING "Failed to ioremap cached %s\n", info->map.name);
	}
...
}

Is it enough?

Thanks in advance,
Davide
