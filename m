Return-Path: <SRS0=UT8Q=ZG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454CDC432C3
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 12:02:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0BF206D5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 12:02:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cjgvbIRP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0BF206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsD1/8OJDphElpaahEWU7pH1whReNQeIjQBn7xVYfcg=; b=cjgvbIRPtqu0x6
	PzGmEwI/o+NcUmpKClZFqE1ZmQ5Wozwk8ByMaUhSU+P4IaH4Yhp+IDBtoF6EzaYtSdzR7/I/KIaQA
	fvZn1u6UqhquBbp8KKbm61Z6YvG9OMoeBX9zY6yD/XXHcbS+XxblzL93retO6WnM/w7Dsjy3D+DB0
	Uyl5g6uS7i6S3sNJbSndToFkmp5PEhWy1fGggMpd1JFAAMMSe/N+2oSCK3RSaRUsKHgktyZ/yxM0y
	7uSr2vsqfdmfhwN+VZOgytkenFUm5wgjQ+SgQCiArwQyM3i66t8Xvgu0Vcsy2HoSnXCEDNpPjUvTw
	KAZD/dyAjY2heF8qDmPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVDov-0004xx-S6; Thu, 14 Nov 2019 12:01:53 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVDor-0004wL-RN
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2019 12:01:51 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 50BCC23F07ECCC0C5F4B;
 Thu, 14 Nov 2019 20:01:40 +0800 (CST)
Received: from [127.0.0.1] (10.133.219.224) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 14 Nov 2019 20:01:36 +0800
Subject: Re: [PATCH] jffs2: Fix mounting under new mount API
To: Han Xu <xhnjupt@gmail.com>, Sergei Shtylyov
 <sergei.shtylyov@cogentembedded.com>, Richard Weinberger <richard@nod.at>
References: <156950767876.30879.17024491763471689960.stgit@warthog.procyon.org.uk>
 <f34aaf61-955a-7867-ef93-f22d3d8732c3@cogentembedded.com>
 <CA+EcR22=7F7X-9qYXb94dAp6w0_3FoKJPMRhFht+VWgKonoing@mail.gmail.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <2758feea-8d6e-c690-5cac-d42213f2024b@huawei.com>
Date: Thu, 14 Nov 2019 20:01:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CA+EcR22=7F7X-9qYXb94dAp6w0_3FoKJPMRhFht+VWgKonoing@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.133.219.224]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_040150_064445_3919B8FF 
X-CRM114-Status: GOOD (  15.42  )
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
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 2019/11/14 4:38, Han Xu wrote:
> Tested the JFFS2 on 5.4 kernel as the instruction said, still got some
> errors, any ideas?
> 

> 
> With the patch,
> 
> root@imx8mmevk:~# cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00400000 00020000 "mtdram test device"
> mtd1: 04000000 00020000 "5d120000.spi"
> root@imx8mmevk:~# mtd_debug info /dev/mtd0
> mtd.type = MTD_RAM
> mtd.flags = MTD_CAP_RAM
> mtd.size = 4194304 (4M)
> mtd.erasesize = 131072 (128K)
> mtd.writesize = 1
> mtd.oobsize = 0
> regions = 0
> 
> root@imx8mmevk:~# flash_erase /dev/mtd0 0 0
> Erasing 128 Kibyte @ 3e0000 -- 100 % complete
> root@imx8mmevk:~# mount -t jffs2 /dev/mtdblock0 test_dir/
> root@imx8mmevk:~# mount
> /dev/mtdblock0 on /home/root/test_dir type jffs2 (rw,relatime)
> 
> BUT, it's not writable.

You should revert the following commit to make it work:

commit f2538f999345405f7d2e1194c0c8efa4e11f7b3a
Author: Jia-Ju Bai <baijiaju1990@gmail.com>
Date:   Wed Jul 24 10:46:58 2019 +0800

    jffs2: Fix possible null-pointer dereferences in jffs2_add_frag_to_fragtree()

The revert needs to get into v5.4. Maybe Richard has forget about it ?

Regards,
Tao

> 
> root@imx8mmevk:~# cp test_file test_dir/
> cp: error writing 'test_dir/test_file': Invalid argument
> 
> root@imx8mmevk:~# dd if=/dev/urandom of=test_dir/test_file bs=1k count=1
> dd: error writing 'test_dir/test_file': Invalid argument
> 1+0 records in
> 0+0 records out
> 0 bytes copied, 0.000855156 s, 0.0 kB/s
> 
> 
> On Fri, Sep 27, 2019 at 3:38 AM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
>>
>> Hello!
>>
>> On 26.09.2019 17:21, David Howells wrote:
>>
>>> The mounting of jffs2 is broken due to the changes from the new mount API
>>> because it specifies a "source" operation, but then doesn't actually
>>> process it.  But because it specified it, it doesn't return -ENOPARAM and
>>
>>     What specified what? Too many "it"'s to figure that out. :-)
>>
>>> the caller doesn't process it either and the source gets lost.
>>>
>>> Fix this by simply removing the source parameter from jffs2 and letting the
>>> VFS deal with it in the default manner.
>>>
>>> To test it, enable CONFIG_MTD_MTDRAM and allow the default size and erase
>>> block size parameters, then try and mount the /dev/mtdblock<N> file that
>>> that creates as jffs2.  No need to initialise it.
>>
>>     One "that" should be enough. :-)
>>
>>> Fixes: ec10a24f10c8 ("vfs: Convert jffs2 to use the new mount API")
>>> Reported-by: Al Viro <viro@zeniv.linux.org.uk>
>>> Signed-off-by: David Howells <dhowells@redhat.com>
>>> cc: David Woodhouse <dwmw2@infradead.org>
>>> cc: Richard Weinberger <richard@nod.at>
>>> cc: linux-mtd@lists.infradead.org
>> [...]
>>
>> MBR, Sergei
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
