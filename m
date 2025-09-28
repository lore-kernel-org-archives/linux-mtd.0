Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABF3CAC5BB
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Sep 2025 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uysb52BVIirdO7AkfI/QrvcC+T3IddZRygfA1b3eFqA=; b=0FzuWzcbrQ08hp
	jSspYnpevTJGS7cgWxDxiVqssGGU7qtnDCPNxjv35RtczJsKW4UYp/4YTGxhuKn4/1pzchLizERiZ
	F54BUdpBHYG8lDmPTZAuvfiCMh/Kq6A+KROhofIycEc64zDL34UvsH8ZGj2igH0vjLlNPi7VVM681
	fJz/l86TCsCdJk28oSF2Qn7OiwZcdhPqTlLEyZwkmXvAg6V9PslLzBP4nvDoo3qiXTuR4b9oP49yc
	GwvzbpB1/nOx0R+BsOdX5u7hIe+7Tb3BPaN5O7kYZ9HTTazYWwA+uzFMFTY2JjC5nHc+my5zV930M
	+4/SRaOGjw+MCtogDOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2qEr-0000000FPfi-2zxq;
	Sun, 28 Sep 2025 12:10:49 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2qEn-0000000FPYD-1ssM
	for linux-mtd@lists.infradead.org;
	Sun, 28 Sep 2025 12:10:46 +0000
Received: from jtjnmail201623.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202509282010093563;
        Sun, 28 Sep 2025 20:10:09 +0800
Received: from jtjnmail201621.home.langchao.com (10.100.2.21) by
 jtjnmail201623.home.langchao.com (10.100.2.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 28 Sep 2025 20:10:09 +0800
Received: from jtjnmail201621.home.langchao.com ([fe80::31c7:1db7:6c09:282a])
 by jtjnmail201621.home.langchao.com ([fe80::31c7:1db7:6c09:282a%7]) with mapi
 id 15.01.2507.058; Sun, 28 Sep 2025 20:10:09 +0800
From: =?gb2312?B?SGFycmlzIFNvbmejqMvOv62jqQ==?= <songkai01@inspur.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>
Subject: fs/jffs2/read.c: When a data CRC error is detected, why not mark the
 node obsolete?
Thread-Topic: fs/jffs2/read.c: When a data CRC error is detected, why not mark
 the node obsolete?
Thread-Index: AdwwcDY6j0QDKI6WQpmneibx12Rfxg==
Date: Sun, 28 Sep 2025 12:10:09 +0000
Message-ID: <f3ed0f6d27dc45088c4aad862dc05941@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [120.224.42.186]
MIME-Version: 1.0
tUid: 2025928201009fa0e8f26662b185ca6c731fadd015f61
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_051045_836705_B3662F5A 
X-CRM114-Status: UNSURE (   6.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all, 

In fs/jffs2/read.c, when jffs2_read_dnode detects a data-CRC failure it immediately returns -EIO to user space. Any read attempt that the application makes shortly afterwards will fail with the same error.

int jffs2_read_dnode()
{    
    ......
      crc = crc32(0, readbuf, je32_to_cpu(ri->csize));
      if (crc != je32_to_cpu(ri->data_crc)) {
            pr_warn("Data CRC %08x != calculated CRC %08x for node at %08x\n",
                  je32_to_cpu(ri->data_crc), crc, ref_offset(fd->raw));
            ret = -EIO;
            goto out_decomprbuf;
      }
    ......
      return ret;
}

The system must wait for the garbage collection mechanism to handle the issue. After processing, the node may have been rolled back to an earlier (valid) version, and only then can the application read the data successfully.

In such a scenario, since the node is already corrupted, would it be possible to directly mark the node with the CRC error as obsolete(jffs2_mark_node_obsolete or a similar helper)? This way, when the application reads again, it could immediately access the correct data without  waiting for background garbage collection.

like this: 

int jffs2_read_dnode()
{    
    ......
      crc = crc32(0, readbuf, je32_to_cpu(ri->csize));
      if (crc != je32_to_cpu(ri->data_crc)) {
            pr_warn("Data CRC %08x != calculated CRC %08x for node at %08x\n",
                  je32_to_cpu(ri->data_crc), crc, ref_offset(fd->raw));
            jffs2_mark_node_obsolete()
            ret = -EIO;
            goto out_decomprbuf;
      }
    ......
      return ret;
}

Thanks
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
