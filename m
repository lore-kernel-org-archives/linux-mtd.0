Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E87D637B2
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Dec 2025 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lPVTg/e04rnm6RC2LOmiRi8kPLhuKDMO+Qckp+061g=; b=asacLNJnbYWqHQ
	tRPJ/HLeaoNptNEb49cPp6hRxZj+Wu27cqwkolAHD79vHOHKRN/R6GO3sYQQIiKQR2GnrQU4uwbCX
	Eng724i4PlOm0+VO4QTovtdoaDQ6rsd9wmbQgNqOM1Wc74V/wM5R8sFu5z5QBBq3+SJ9LJGtbcPr8
	2TsGQjMeUYRwzWHVkA5rnJGjP80T6AR++1C7J1SEFvcvDaZalsyZPvjFz1UX4Vbbt/Ope528tSMUW
	Deh3pM004l988xOsXIMnn0Sgkipkhkd5gvEWSj0VU6BJJu/TnPZRbIXMLDhvBdS9lsYkN6ZA8F7cB
	0Cp5LmnlFraK3042Z2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWr9A-0000000BNSt-0esQ;
	Sat, 20 Dec 2025 07:13:00 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWr96-0000000BNSP-3M19
	for linux-mtd@lists.infradead.org;
	Sat, 20 Dec 2025 07:12:58 +0000
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id W6QivCfn1KXDJWr8uvNNFP; Sat, 20 Dec 2025 07:12:44 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Wr8svIpVcvXvHWr8svWjzp; Sat, 20 Dec 2025 07:12:43 +0000
X-Authority-Analysis: v=2.4 cv=e4IGSbp/ c=1 sm=1 tr=0 ts=69464c6b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=ujWNxKVE5dX343uAl30YYw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=DfK0_ZNNswAGoXOUU8MA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n1Zq/KZ9c9/IpwF7BqDD4sGMIcr8Lqe8exdAPZLEG84=; b=npYhtjZPM4YDM//6yNLsz9nxjd
	uuUToOf3Fg27jdf1T3OAC1nIL3vh/PRBsKq6h5apacClDHdHbhOzWgdKULNJb4WpsTQB1Vu0yP1YZ
	kDfle+VkCHzEfY8pS60ppGfN5K/GRcufwrzWWnqNQMLqaoxPHPj/VYitAIMN4IcpRidDBm07FCKfq
	TX2rozqEbiy8vpe9N2HhVWk/xGhH+LUDLlcCwe6drrZ4j9VmJMjeXP/S1v+Ky2JeW4vCuAiFr6Q/5
	SdY02XZSJjkajJUvLp0fa6lMSibcZbsCP8efuVpSig0/pKIYbj3vBve4fDl0w/5aNXw5gwk7faf9h
	7wcaKqIw==;
Received: from i118-18-233-1.s41.a027.ap.plala.or.jp ([118.18.233.1]:60170 helo=[10.83.24.44])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vWr8r-00000002tT6-3vUy;
	Sat, 20 Dec 2025 01:12:42 -0600
Message-ID: <c8190aae-25d8-469d-8efa-6d1ff9482347@embeddedor.com>
Date: Sat, 20 Dec 2025 16:12:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: intel-dg: fix array-index-out-of-bounds in
 intel_dg_mtd_probe()
To: Raag Jadav <raag.jadav@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomas Winkler <tomasw@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <aUZFLezigzZQVt55@kspp> <aUZLNTOMgvJ8WrIy@black.igk.intel.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <aUZLNTOMgvJ8WrIy@black.igk.intel.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 118.18.233.1
X-Source-L: No
X-Exim-ID: 1vWr8r-00000002tT6-3vUy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: i118-18-233-1.s41.a027.ap.plala.or.jp ([10.83.24.44]) [118.18.233.1]:60170
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEUzT2Kv/HS1bTdxiAYVM2przpjhOZ2fIWMaDjEGv0+a4pZq1ribCWnenic5Sxvr1eYypwiAZQo/AfogkbsxbFVhZmdiXuAKMjOHLQPo4YSv2RnC2xbT
 6EpN6S/KVB03Wu30v6Nx7XitaBNzWJB87EYLT8cd9L4Xadb0M2bImWivmPd+tUsnU5VrkxPQqm0yCE/Akci1Wn9zW4Pxi76ea3LLjCnABYUaN8rbQ8faZON5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_231256_954479_DB46D31A 
X-CRM114-Status: UNSURE (   4.20  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 12/20/25 16:07, Raag Jadav wrote:
> On Sat, Dec 20, 2025 at 03:41:49PM +0900, Gustavo A. R. Silva wrote:
>> Fix the UBSAN: array-index-out-of-bounds issue below by updating
>> counter nvm->nregions before the first access to flexible-array
>> member nvm->regions[].
>>
>> from kernel bugzilla:
>> https://bugzilla.kernel.org/show_bug.cgi?id=220823
>>
>> Dec 15 22:01:52 orpheus kernel: UBSAN: array-index-out-of-bounds in /var/tmp/portage/sys-kernel/gentoo-kernel-6.18.1/work/linux-6.18/drivers/mtd/devices/mtd_intel_dg.c:750:15
>>
>> Notice that this flexible array is annotated with the counted_by()
>> attribute, hence the counter must always be updated before the
>> first access to the array.
> 
> Already fixed[1], but not sure if it's landed yet.
> 
> [1] https://lore.kernel.org/linux-mtd/20251111-mtd-nregions-v1-1-61db61e78c63@intel.com/

Great! :)

Thanks
-Gustavo


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
