Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433AEC388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 11:39:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A258B20659
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 11:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BC4HSmLP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A258B20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nf1IJY6iPnbhWudzdZblzNzTY9tc2l7ObjzYoXglVJc=; b=BC4HSmLP7a8kH8pukr/px8dEb
	Yg6mrPCUOT4XBTpCQh4CpKhhAoNMHhbc2l6FRi32aTDn6IgiomkPZmxGuonzdKhbvybwrZSTVzXY6
	ckWaGKj8zO4WlJJrow9Wv2tfDWqXLVaWm5VJ2R8X6w5m7CrwUnJuratMn2zE9y4cls0QGdy61k8Ld
	7sHrVhxjxUIZ87zU2l9tf48GaPudH34nQTKbobvceq5/p9vvm0TEssxCdVDdOXDtAXTeSlqma9yFK
	vx8XFxhhZoEbPlY5cVOKuVxVSgP8GLUTR4qGt+JgMJ+gafGG0aaAXxcuCtMtkfTV8JSZoVIsMGyGM
	fsu/nwVTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcRz0-0007Mp-2F; Tue, 10 Nov 2020 11:38:42 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcRyv-0007LV-DM
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 11:38:38 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 7553D803071A;
 Tue, 10 Nov 2020 11:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNvMC4C0WzIc; Tue, 10 Nov 2020 14:38:29 +0300 (MSK)
Date: Tue, 10 Nov 2020 14:38:27 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <20201110113827.hl5i27cpl6exo3md@mobilestation>
References: <202011021254.XC70BaQT-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202011021254.XC70BaQT-lkp@intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_063837_812840_010E5417 
X-CRM114-Status: GOOD (  14.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Miquel,

A situation noted by the warning below won't cause any problem because
the casting is done to a non-dereferenced variable. It is utilized
as a pointer bias later in that function. Shall we just ignore the
warning or still fix it somehow?

-Sergey

On Mon, Nov 02, 2020 at 12:42:57PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3cea11cd5e3b00d91caf0b4730194039b45c5891
> commit: b3e79e7682e075326df8041b826b03453acacd0a mtd: physmap: Add Baikal-T1 physically mapped ROM support
> date:   4 weeks ago
> config: sparc64-randconfig-s032-20201031 (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-76-gf680124b-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b3e79e7682e075326df8041b826b03453acacd0a
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout b3e79e7682e075326df8041b826b03453acacd0a
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=sparc64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> "sparse warnings: (new ones prefixed by >>)"
> >> drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast removes address space '__iomem' of expression
> 
> vim +/__iomem +78 drivers/mtd/maps/physmap-bt1-rom.c
> 
>     57	
>     58	static void __xipram bt1_rom_map_copy_from(struct map_info *map,
>     59						   void *to, unsigned long from,
>     60						   ssize_t len)
>     61	{
>     62		void __iomem *src = map->virt + from;
>     63		ssize_t shift, chunk;
>     64		u32 data;
>     65	
>     66		if (len <= 0 || from >= map->size)
>     67			return;
>     68	
>     69		/* Make sure we don't go over the map limit. */
>     70		len = min_t(ssize_t, map->size - from, len);
>     71	
>     72		/*
>     73		 * Since requested data size can be pretty big we have to implement
>     74		 * the copy procedure as optimal as possible. That's why it's split
>     75		 * up into the next three stages: unaligned head, aligned body,
>     76		 * unaligned tail.
>     77		 */
>   > 78		shift = (ssize_t)src & 0x3;
>     79		if (shift) {
>     80			chunk = min_t(ssize_t, 4 - shift, len);
>     81			data = readl_relaxed(src - shift);
>     82			memcpy(to, &data + shift, chunk);
>     83			src += chunk;
>     84			to += chunk;
>     85			len -= chunk;
>     86		}
>     87	
>     88		while (len >= 4) {
>     89			data = readl_relaxed(src);
>     90			memcpy(to, &data, 4);
>     91			src += 4;
>     92			to += 4;
>     93			len -= 4;
>     94		}
>     95	
>     96		if (len) {
>     97			data = readl_relaxed(src);
>     98			memcpy(to, &data, len);
>     99		}
>    100	}
>    101	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
