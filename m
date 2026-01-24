Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D171D715F8
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jan 2026 22:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StZBo2UBBD1DuuqCn46FpRSIlhIV7vqBqINm9febKcc=; b=V6uw6RefBsOwzI
	ZW0pb3NhoyxspFEyAU7lCXNX8FtdpeO40doA11Iw6RE3ikzFLPjdv3FZMeFFWqldZSTaBeAQDTEC9
	1WbK106ohFwwmmdQtQ0vHuvisZ5gSbd/NU7LF4GGTFHq8ehDONXsp2izoZxv+nT/nbmS4JRBb8WwV
	O46S5bsEE3asm447Lb+ONDBU67h78TCMndxBfiLUFrRjnsEKFxMkQB11CTjic5c00tJzVjRJY4MDx
	4Z79K9zRdp0MFQkzs703+KETERXFbXtRvEooPL6Yb/oOXzbX0bEULXuUXXubJsHhQ/6i4n+lrU6LR
	TQfDnfElJi/NRr0Le4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjmKD-0000000AfLu-0OwZ;
	Sat, 24 Jan 2026 22:41:49 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjmK9-0000000AfKz-0PJw
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jan 2026 22:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769294506; x=1800830506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tCiVIRjJzhkPB5YrUZHxI4VllBKOQPTDRVM4LskwCzY=;
  b=fqSZuEvRz6GvYOEd8p4u/YC9ViElsGxompCwJdZp7QUsxP8Y9PlFoEaz
   wKusKINUwSQxmpRPrSbCFnHcsaYgGII/jg4J9eyB2tm/hH33kxxgKLMZx
   IVJmR47d6YD0anGd0faGwJdwLdehJy2CoIkX7/DV53SI3MQakoU/eEj5D
   dg5lUU8n9PSIdcNOWUK3SyMUGGO0ipEOFyefSdULbx0HN2A7dWkcdIYDh
   LbA+Pvg6g83xUV2z6NH+I+9jeIrQ04E1bnr1eSzwBmaCWczWfNxi3tVce
   dcd8taco1vqInuSjaIX0nIVqhPA7C9l3HOta7/N+2APc6ijl9JAvQLxxP
   A==;
X-CSE-ConnectionGUID: zkEkdHd3SGi99NmKU4R8BQ==
X-CSE-MsgGUID: rJHkHIVNTr2GMM8Drv/PFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="93174510"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="93174510"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 14:41:41 -0800
X-CSE-ConnectionGUID: neLE7maPTlam7SqQOlqFwg==
X-CSE-MsgGUID: tvptXF33SgCgQEY+q+vxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="230293681"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jan 2026 14:41:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjmJz-00000000Vas-3rhF;
	Sat, 24 Jan 2026 22:41:35 +0000
Date: Sun, 25 Jan 2026 06:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <202601250653.LXBUL5W6-lkp@intel.com>
References: <20260124133730.3454241-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260124133730.3454241-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_144145_216722_C4211748 
X-CRM114-Status: GOOD (  15.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes linus/master v6.19-rc6 next-20260=
123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/mtd-=
cfi_cmdset_0001-Factor-out-do_write_buffer_locked-to-reduce-stack-frame/202=
60124-213936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/n=
ext
patch link:    https://lore.kernel.org/r/20260124133730.3454241-1-andriy.sh=
evchenko%40linux.intel.com
patch subject: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out do_write_buf=
fer_locked() to reduce stack frame
config: xtensa-randconfig-002-20260125 (https://download.01.org/0day-ci/arc=
hive/20260125/202601250653.LXBUL5W6-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601250653.LXBUL5W6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250653.LXBUL5W6-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer_locked=
':
>> drivers/mtd/chips/cfi_cmdset_0001.c:1734:6: warning: unused variable 'in=
itial_len' [-Wunused-variable]
     int initial_len =3D len;
         ^~~~~~~~~~~
>> drivers/mtd/chips/cfi_cmdset_0001.c:1733:16: warning: variable 'initial_=
adr' set but not used [-Wunused-but-set-variable]
     unsigned long initial_adr;
                   ^~~~~~~~~~~


vim +/initial_len +1734 drivers/mtd/chips/cfi_cmdset_0001.c

^1da177e4c3f415 Linus Torvalds   2005-04-16  1721  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  1722  =

b8a0764c058e872 Andy Shevchenko  2026-01-24  1723  static int __xipram do_w=
rite_buffer_locked(struct map_info *map, struct flchip *chip,
b8a0764c058e872 Andy Shevchenko  2026-01-24  1724  					   unsigned long cm=
d_adr, unsigned long adr,
b8a0764c058e872 Andy Shevchenko  2026-01-24  1725  					   const struct kve=
c **pvec,
e102d54abf6806b Nicolas Pitre    2005-08-06  1726  					   unsigned long *p=
vec_seek, int len)
^1da177e4c3f415 Linus Torvalds   2005-04-16  1727  {
^1da177e4c3f415 Linus Torvalds   2005-04-16  1728  	struct cfi_private *cfi=
 =3D map->fldrv_priv;
c172471b78255a5 Nicolas Pitre    2006-03-30  1729  	map_word status, write_=
cmd, datum;
b8a0764c058e872 Andy Shevchenko  2026-01-24  1730  	int ret, word_gap, word=
s;
e102d54abf6806b Nicolas Pitre    2005-08-06  1731  	const struct kvec *vec;
e102d54abf6806b Nicolas Pitre    2005-08-06  1732  	unsigned long vec_seek;
646fd12784d5061 Massimo Cirillo  2008-01-11 @1733  	unsigned long initial_a=
dr;
646fd12784d5061 Massimo Cirillo  2008-01-11 @1734  	int initial_len =3D len;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1735  =

646fd12784d5061 Massimo Cirillo  2008-01-11  1736  	initial_adr =3D adr;
812c5fa82bae9f3 Andrea Adami     2014-06-02  1737  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  1738  	/* Let's determine this=
 according to the interleave only once */
b5d194ceaeffce6 Guillaume LECERF 2010-10-26  1739  	write_cmd =3D (cfi->cfi=
q->P_ID !=3D P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1740  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  1741  	xip_disable(map, chip, =
cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1742  =

151e76590f66f54 David Woodhouse  2006-05-14  1743  	/* =A74.8 of the 28Fxxx=
J3A datasheet says "Any time SR.4 and/or SR.5 is set
^1da177e4c3f415 Linus Torvalds   2005-04-16  1744  	   [...], the device wi=
ll not accept any more Write to Buffer commands".
^1da177e4c3f415 Linus Torvalds   2005-04-16  1745  	   So we must check her=
e and reset those bits if they're set. Otherwise
^1da177e4c3f415 Linus Torvalds   2005-04-16  1746  	   we're just pissing i=
n the wind */
6e7a6809c555aeb Nicolas Pitre    2006-03-29  1747  	if (chip->state !=3D FL=
_STATUS) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  1748  		map_write(map, CMD(0x7=
0), cmd_adr);
6e7a6809c555aeb Nicolas Pitre    2006-03-29  1749  		chip->state =3D FL_STA=
TUS;
6e7a6809c555aeb Nicolas Pitre    2006-03-29  1750  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1751  	status =3D map_read(map=
, cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1752  	if (map_word_bitsset(ma=
p, status, CMD(0x30))) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  1753  		xip_enable(map, chip, =
cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1754  		printk(KERN_WARNING "S=
R.4 or SR.5 bits set in buffer write (status %lx). Clearing.\n", status.x[0=
]);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1755  		xip_disable(map, chip,=
 cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1756  		map_write(map, CMD(0x5=
0), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1757  		map_write(map, CMD(0x7=
0), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1758  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1759  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  1760  	chip->state =3D FL_WRIT=
ING_TO_BUFFER;
638d983840bb64e Nicolas Pitre    2005-08-06  1761  	map_write(map, write_cm=
d, cmd_adr);
e93cafe45fd7493 Anders Grafstr=F6m 2008-08-05  1762  	ret =3D WAIT_TIMEOUT(=
map, chip, cmd_adr, 0, 0);
c172471b78255a5 Nicolas Pitre    2006-03-30  1763  	if (ret) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  1764  		/* Argh. Not ready for=
 write to buffer */
c172471b78255a5 Nicolas Pitre    2006-03-30  1765  		map_word Xstatus =3D m=
ap_read(map, cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1766  		map_write(map, CMD(0x7=
0), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1767  		chip->state =3D FL_STA=
TUS;
c172471b78255a5 Nicolas Pitre    2006-03-30  1768  		status =3D map_read(ma=
p, cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1769  		map_write(map, CMD(0x5=
0), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1770  		map_write(map, CMD(0x7=
0), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1771  		xip_enable(map, chip, =
cmd_adr);
c172471b78255a5 Nicolas Pitre    2006-03-30  1772  		printk(KERN_ERR "%s: C=
hip not ready for buffer write. Xstatus =3D %lx, status =3D %lx\n",
c172471b78255a5 Nicolas Pitre    2006-03-30  1773  				map->name, Xstatus.x=
[0], status.x[0]);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1774  		return ret;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1775  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1776  =

e102d54abf6806b Nicolas Pitre    2005-08-06  1777  	/* Figure out the numbe=
r of words to write */
e102d54abf6806b Nicolas Pitre    2005-08-06  1778  	word_gap =3D (-adr & (m=
ap_bankwidth(map)-1));
c8872b069c53697 Julia Lawall     2008-08-02  1779  	words =3D DIV_ROUND_UP(=
len - word_gap, map_bankwidth(map));
e102d54abf6806b Nicolas Pitre    2005-08-06  1780  	if (!word_gap) {
e102d54abf6806b Nicolas Pitre    2005-08-06  1781  		words--;
e102d54abf6806b Nicolas Pitre    2005-08-06  1782  	} else {
e102d54abf6806b Nicolas Pitre    2005-08-06  1783  		word_gap =3D map_bankw=
idth(map) - word_gap;
e102d54abf6806b Nicolas Pitre    2005-08-06  1784  		adr -=3D word_gap;
e102d54abf6806b Nicolas Pitre    2005-08-06  1785  		datum =3D map_word_ff(=
map);
e102d54abf6806b Nicolas Pitre    2005-08-06  1786  	}
e102d54abf6806b Nicolas Pitre    2005-08-06  1787  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  1788  	/* Write length of data=
 to come */
e102d54abf6806b Nicolas Pitre    2005-08-06  1789  	map_write(map, CMD(word=
s), cmd_adr );
^1da177e4c3f415 Linus Torvalds   2005-04-16  1790  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  1791  	/* Write data */
e102d54abf6806b Nicolas Pitre    2005-08-06  1792  	vec =3D *pvec;
e102d54abf6806b Nicolas Pitre    2005-08-06  1793  	vec_seek =3D *pvec_seek;
e102d54abf6806b Nicolas Pitre    2005-08-06  1794  	do {
e102d54abf6806b Nicolas Pitre    2005-08-06  1795  		int n =3D map_bankwidt=
h(map) - word_gap;
e102d54abf6806b Nicolas Pitre    2005-08-06  1796  		if (n > vec->iov_len -=
 vec_seek)
e102d54abf6806b Nicolas Pitre    2005-08-06  1797  			n =3D vec->iov_len - =
vec_seek;
e102d54abf6806b Nicolas Pitre    2005-08-06  1798  		if (n > len)
e102d54abf6806b Nicolas Pitre    2005-08-06  1799  			n =3D len;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1800  =

e102d54abf6806b Nicolas Pitre    2005-08-06  1801  		if (!word_gap && len <=
 map_bankwidth(map))
e102d54abf6806b Nicolas Pitre    2005-08-06  1802  			datum =3D map_word_ff=
(map);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1803  =

e102d54abf6806b Nicolas Pitre    2005-08-06  1804  		datum =3D map_word_loa=
d_partial(map, datum,
e102d54abf6806b Nicolas Pitre    2005-08-06  1805  					      vec->iov_base=
 + vec_seek,
e102d54abf6806b Nicolas Pitre    2005-08-06  1806  					      word_gap, n);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1807  =

e102d54abf6806b Nicolas Pitre    2005-08-06  1808  		len -=3D n;
e102d54abf6806b Nicolas Pitre    2005-08-06  1809  		word_gap +=3D n;
e102d54abf6806b Nicolas Pitre    2005-08-06  1810  		if (!len || word_gap =
=3D=3D map_bankwidth(map)) {
e102d54abf6806b Nicolas Pitre    2005-08-06  1811  			map_write(map, datum,=
 adr);
e102d54abf6806b Nicolas Pitre    2005-08-06  1812  			adr +=3D map_bankwidt=
h(map);
e102d54abf6806b Nicolas Pitre    2005-08-06  1813  			word_gap =3D 0;
e102d54abf6806b Nicolas Pitre    2005-08-06  1814  		}
e102d54abf6806b Nicolas Pitre    2005-08-06  1815  =

e102d54abf6806b Nicolas Pitre    2005-08-06  1816  		vec_seek +=3D n;
e102d54abf6806b Nicolas Pitre    2005-08-06  1817  		if (vec_seek =3D=3D ve=
c->iov_len) {
e102d54abf6806b Nicolas Pitre    2005-08-06  1818  			vec++;
e102d54abf6806b Nicolas Pitre    2005-08-06  1819  			vec_seek =3D 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1820  		}
e102d54abf6806b Nicolas Pitre    2005-08-06  1821  	} while (len);
e102d54abf6806b Nicolas Pitre    2005-08-06  1822  	*pvec =3D vec;
e102d54abf6806b Nicolas Pitre    2005-08-06  1823  	*pvec_seek =3D vec_seek;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1824  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  1825  	/* GO GO GO */
^1da177e4c3f415 Linus Torvalds   2005-04-16  1826  	map_write(map, CMD(0xd0=
), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1827  	chip->state =3D FL_WRIT=
ING;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1828  =

c172471b78255a5 Nicolas Pitre    2006-03-30  1829  	ret =3D INVAL_CACHE_AND=
_WAIT(map, chip, cmd_adr,
646fd12784d5061 Massimo Cirillo  2008-01-11  1830  				   initial_adr, init=
ial_len,
e93cafe45fd7493 Anders Grafstr=F6m 2008-08-05  1831  				   chip->buffer_wr=
ite_time,
e93cafe45fd7493 Anders Grafstr=F6m 2008-08-05  1832  				   chip->buffer_wr=
ite_time_max);
c172471b78255a5 Nicolas Pitre    2006-03-30  1833  	if (ret) {
4843653cab0db03 Nicolas Pitre    2005-08-06  1834  		map_write(map, CMD(0x7=
0), cmd_adr);
^1da177e4c3f415 Linus Torvalds   2005-04-16  1835  		chip->state =3D FL_STA=
TUS;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1836  		xip_enable(map, chip, =
cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1837  		printk(KERN_ERR "%s: b=
uffer write error (status timeout)\n", map->name);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1838  		return ret;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1839  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1840  =

4843653cab0db03 Nicolas Pitre    2005-08-06  1841  	/* check for errors */
c172471b78255a5 Nicolas Pitre    2006-03-30  1842  	status =3D map_read(map=
, cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1843  	if (map_word_bitsset(ma=
p, status, CMD(0x1a))) {
4843653cab0db03 Nicolas Pitre    2005-08-06  1844  		unsigned long chipstat=
us =3D MERGESTATUS(status);
4843653cab0db03 Nicolas Pitre    2005-08-06  1845  =

4843653cab0db03 Nicolas Pitre    2005-08-06  1846  		/* reset status */
^1da177e4c3f415 Linus Torvalds   2005-04-16  1847  		map_write(map, CMD(0x5=
0), cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1848  		map_write(map, CMD(0x7=
0), cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1849  		xip_enable(map, chip, =
cmd_adr);
4843653cab0db03 Nicolas Pitre    2005-08-06  1850  =

b8a0764c058e872 Andy Shevchenko  2026-01-24  1851  		if (chipstatus & 0x02)
b8a0764c058e872 Andy Shevchenko  2026-01-24  1852  			return -EROFS;
b8a0764c058e872 Andy Shevchenko  2026-01-24  1853  =

b8a0764c058e872 Andy Shevchenko  2026-01-24  1854  		if (chipstatus & 0x08)=
 {
4843653cab0db03 Nicolas Pitre    2005-08-06  1855  			printk(KERN_ERR "%s: =
buffer write error (bad VPP)\n", map->name);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1856  			return  -EIO;
4843653cab0db03 Nicolas Pitre    2005-08-06  1857  		}
4843653cab0db03 Nicolas Pitre    2005-08-06  1858  =

b8a0764c058e872 Andy Shevchenko  2026-01-24  1859  		printk(KERN_ERR "%s: b=
uffer write error (status 0x%lx)\n", map->name, chipstatus);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1860  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds   2005-04-16  1861  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  1862  =

^1da177e4c3f415 Linus Torvalds   2005-04-16  1863  	xip_enable(map, chip, c=
md_adr);
b8a0764c058e872 Andy Shevchenko  2026-01-24  1864  	return 0;
b8a0764c058e872 Andy Shevchenko  2026-01-24  1865  }
b8a0764c058e872 Andy Shevchenko  2026-01-24  1866  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
