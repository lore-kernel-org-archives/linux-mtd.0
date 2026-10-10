Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85492CA9EC9
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 17:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bqcknXsLSKsQ0soPYli6T5VRiHpfLizE/j973mTMkYA=; b=T5XbwHW6U5yVWs
	QwLBAhyfMpdOgfuv8LuIgPQ1FLdtpnzQ2ZbdbY2Wjkqpl1xJ9yAIKSe0JQ3vE0sMJ9ED5C2SZ17Nj
	WyLNKqwYex1QyqfkcWDdsZPXVGlgtJpV0eevD8COUaFDv0iIQhSos9MdddOxlk/AwUouMt+MONGnR
	ZQuTCxdXdN/MHKJ570tOhWPb1t/oOTad58aOy/h+oFUsGOx7/MmK+YXhohSy7sY3KCvpQFNo6tWG9
	Ya2lfWi3tevZTe0n2jChSuoh2G+KKVCJ8UEJs+NhaSy/EGYDwOGjGWdw/5YnpsfsxIg12F6BrnQ6y
	knfCc7rIaPjKk21EPikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFalY-00000008K6Y-40BB;
	Sat, 10 Oct 2026 17:21:48 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFalX-00000008K5r-02tv
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 17:21:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a02718da81so5247415e9.1
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652904; x=1792257704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzwaUnI7IRPLhxyFnbCvNhosRBqBfqx+J3GlDpy+vjk=;
        b=d8mtsDn0EzfNJNAqez/mkwgH6qpWrlhP6/hvRIj6oQcYjhLmnipuELtrOZTyvpIUrX
         YJjfAr+XKtekynJm1TZ/DP+JxuKpzZ3dOpsM6uWgfRp8n8ZwpKJSNIQyNQQXZauyaWGO
         rRJG85YbRUkjuhqn7ydCPporEmUuGBC8MgnBbji/6JWM59Xsgpk56wYGVGBkEgoN3OgR
         fD/KVaLtorW25NjFNKRYD9npdeYj5bVSh0eiKb5NscBuYN7b2RF5r4RtLjOlwZ87DI+9
         0AMxqaxKcvURNmvcCwF82vODErtXL/2pg9YrwWIoUzDdjbCcU0DenXsirTVYMvNoui5v
         amFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652904; x=1792257704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzwaUnI7IRPLhxyFnbCvNhosRBqBfqx+J3GlDpy+vjk=;
        b=nRkxem0hhiEX87dLvZGunGe3WsUH7ZvbUTlbw3UChfPPgbIJEga6ljoZG5W++UgtQI
         wQ6TMkgPT9NBv/xCNdbYMo6+yxJRS+pyWZnQVu8fsMJpm7karOOas9Xk910IXm6H3JUQ
         d/VibA6K4x45pP4YMkupoDRbBWLJQgJeqnjkkvLR/OLyw/SWgMM745BdKJ7h5MXnDHUT
         g+HiVYpPW+QYGi6Zrnt82NShkIYxFhZ2oKUfaO6dK7Kps4vNg5fZBRzL0oe/g1QqzCTl
         lQCz7n/MaAh/YlVIEFbA4ZHqzjPMpO6ctgN5YL2XXHGlv1Ea+Fa7OZukuhwH3U9jHcnK
         TD0g==
X-Gm-Message-State: AFq9FYLPZj0g+JRXJSA4s1/V8mJ+egYg43FStDXLS/dwZ1LyTSLx9/HW
	1mEBBTQZsHn7Niwb2utIp9WVVpLL1XuNlfuFBYKbx5mFc+NoCPnpUG+H
X-Gm-Gg: AYBFou2urZx20FbnHDOSsVKJUPFBtUB+/vWbaBrgV1Ahi51ab5xFhgH9ozErcJajH8y
	VlA3clZxelRvasiD90u6ODO4LCBbvXFsKiCDYmR8fbEvmmmckBFnyexPM3J5m9h3NMaRh+Ee+wU
	CUk2TiogT6fKmDGMN8YudOJjICtZcFjdnjo/vCz7N5S9bIBhQCTZJbdNd5LhfJUmd/p4fUtML4G
	hlgtxP41YhhcaMJpd7BfqUd/mS7Q4iKMy1yp7g4KJLrHjamuhm2/ty1nDnQV0kDmsAZMk7qm5x7
	AhngXucRycArOi6N47HB0ICEeKMcMAkZZ7kzL+0JUFjGTrNT1G++cfpModk4PU90dQJ5vQ71q4y
	BtBkdkhXAg0Utd/6AqJCCw7MUilFdFqCbNgr1OYXZJpDAOLKCF97apGteF2zxVUgH6pL7kehtAl
	dByouXVZJ4kdPlu+Sko/NPobn0Dch7NJiCHwUuhyN74wn7orsl1APQZqJrbcCtSvVeK1W9b4qSg
	wVmJ2jcrYBf6a+a7HkUDZKf0xCq1xFkwzQ3mnGn7x2NpbYk8CKOiP9QmSFql62tvv8jBpf2SXCE
	46LFzvFlCbv8xxbc
X-Received: by 2002:a05:600c:3e8c:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-4a18e49d251mr95380695e9.5.1791652904195;
        Sat, 10 Oct 2026 10:21:44 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:43 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/3] mtd: point() for cfi_cmdset_0002, on simple maps only
Date: Sat, 10 Oct 2026 17:21:39 +0000
Message-ID: <20261010172142.2138956-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_102147_085950_5B996D15 
X-CRM114-Status: GOOD (  14.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

jffs2 scans a flash in place through mtd_point() when the chip driver
offers it, and copies every used eraseblock through mtd_read()
otherwise. cfi_cmdset_0002 never had point(), so every jffs2 mount on
an AMD-style NOR copies the whole used area. On an Octeon CN6635 board
with a 100 MB jffs2 partition on an 8-bit M29EW that takes 15-30 s at
every boot.

1/3 tightens the existing gate first. map_is_linear() only checks for
a physical address, so cfi_cmdset_0001 already points at maps whose
own accessors swap bytes (IXP4xx), switch pins (Gemini) or lock the
bus (lantiq). The new map_is_simple() also requires the simple
accessors.

2/3 adds point()/unpoint() to cfi_cmdset_0002 behind the same gate,
modeled on cfi_cmdset_0001, and lists it in the cramfs documentation.

3/3 lets the Octeon flash map use the simple accessors when no eMMC
host shares its boot bus. Without it, 2/3 changes nothing on Octeon.
It builds without 1/3 and 2/3 but only pays off once they are in, so
taking all three through mtd with an ack from Thomas seems simplest.

Tested on that board with 7.2.9: the mount drops to 0.6-0.8 s. The
md5s of the images on the jffs2 partition held across reboots and
across ten 8 MB write/delete rounds. The series applies to v7.3-rc4
and to mtd/next.

Separately, for the MTD maintainers to judge: the write-buffer count
truncation that cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the
write-buffer chunk at 256 bytes on an x8 device") fixed in
cfi_cmdset_0002 has two siblings. do_write_buffer() in cfi_cmdset_0001
writes CMD(words) and the one in cfi_cmdset_0020 writes
CMD(len / map_bankwidth(map) - 1). On an x8 device CMD() keeps only
the low 8 bits of the count in each device lane, so a write buffer
larger than 256 bytes per device would be programmed with a truncated
count. I have no x8 Intel or ST part to test on, so I have not touched
either; I do not know whether such a part exists.

Orgad Shaneh (3):
  mtd: maps: only point() maps read through the simple accessors
  mtd: cfi_cmdset_0002: implement point() for simple linear maps
  MIPS: Octeon: flash: use the simple map accessors without a shared
    eMMC

 Documentation/filesystems/cramfs.rst  |  11 +-
 arch/mips/cavium-octeon/flash_setup.c |  37 +++++-
 drivers/mtd/chips/cfi_cmdset_0001.c   |   2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c   | 156 +++++++++++++++++++++++++-
 drivers/mtd/maps/map_funcs.c          |  12 ++
 include/linux/mtd/map.h               |   2 +
 6 files changed, 207 insertions(+), 13 deletions(-)

--
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
