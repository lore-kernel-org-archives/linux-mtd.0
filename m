Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682CAC7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 07:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqSojMNypawBkERyj3ZRZoNak0OD9j57RC7ZUbN9ZHs=; b=ZEMFSZ/SMqVl98
	R5TPadFcxP3qFlIhqo/09pC/TfB0Rrwd/Nv/Yv+bSZBB5T6CFA6+G7s1DhNGwl0K6F0xJrp91bpCX
	QCBOh0TLjiJy7jDLbbsZ2rDdj4hh4gjo017AT+bzKjehewDMSjNppNt/Ok051mTfv24EJIp4YeTha
	o+v5KHfOEk2kOArhisDEAYt1oOYz0nJuY+ULAYF1Nmjxe/mxoIyzSiiS2k540uRGDiGlZmUIDZ/8z
	S/7aqArK0ZmDgBDJlPUMEZOJ5TT6ks/powHzuQjSqF6CDD9QoD+NceqjwpcKeFEQnCfc/rIzLjfsT
	+oqPjelIYy0pMnoIFrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9uN-008Iku-2N;
	Mon, 20 Mar 2023 07:26:19 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9uK-008IjV-1V
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 07:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679297176; x=1710833176;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PznhUX2rDF8uhJla7kd2cwVnZx5w5yiNB4r5BQcdnfM=;
  b=S3IbvkVtatRDRykqG6l7gvgysxDNDzhpSnKDYdFdB4OiLfNnV6s57JhM
   r57Ih3D4OaWtuBG1IIpVBSMZPhORxDJnHqwwsGbqO4gIoFLQ8X1AWxWkJ
   xrYsbx+ECdqPxbZL6dG7hgHmT0UOOuaYEs9INHVRmCt2KZtvh+sX7lKhU
   CAMZy/X1MuOYGMAW/zVRO0RKwOWQCH8uyBpD29QYlu6xcAimpvkBtdwNb
   pQlC6osE5XcNr030HRzpTKJuSoTX+9INrupxuPsbMkTmWLSSJIl7Y8wy7
   +nNALVXp1ufDeQsLk14+yIBvtmxmp3YfxbT1IX94wF6L6pp+o6LPerTuO
   w==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673884800"; 
   d="scan'208";a="230987198"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2023 15:26:10 +0800
IronPort-SDR: r/btLqYIMBfg22W9/GnnaSCuaFtrFKDZ1bN24MgdxNLEwQOj8GCBmqo8pqFffCB6MfXmfQvQ7h
 Nl9pQeBJdFQGFXYipzvhfMfQ9hIBJtRgYLAM5DW7UKivaX8Lb3u17wz7xriml1gAEqj3089G88
 V7Y5gjD1YZ2HBOTzmo3h1KEgftcFTVTy88mWC+qnH0Wy6j9uI/gcwiL9KH95KU7ygZxkv4Q6IM
 UPsyA+pPU86iwWdATGVhnjgYz3cP/izSOlwU1Q/TSKM1zky3kTnuz+eJUXe1/rsojkVnnNJjQh
 h18=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 23:42:30 -0700
IronPort-SDR: AKh5cbNJeNntO+bkNZSjFI6/Sq8nzciyUVDq8Xzi/SoWqXj1SuF9DiYpCTsL3cjRunAfL3lUc/
 6PkWhCctZu+to4iFqEp8NmJwNwPqH8rges0u5Dvfixu/82oEU7i6YwC5XVZyivPGnqPQzaJG9J
 jyd9o0uVVZ+ObAijsbwKQQd91cBGBdBCMMD9gBlU4vyxuUEN5luifvbLb7a5fTunp5Alq9UHOQ
 H2wTA2iyU5wiwdFARpnnFqtCLgNiYwylOG75qnE5iMoE4V47eLh68HNHBveaRzCBNgpVGrYn2J
 RdI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Mar 2023 00:26:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pg5rL0snJz1RtVy
	for <linux-mtd@lists.infradead.org>; Mon, 20 Mar 2023 00:26:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679297169; x=1681889170; bh=PznhUX2rDF8uhJla7kd2cwVnZx5w5yiNB4r
	5BQcdnfM=; b=Ac3sR0XYJ+rryJ+0bDOPKxCm+dcSwHcMLzkGxuGt8+HwZ87G7ax
	pAFVEfaZLRQ1T7YBu9pTJb2iOB0dq+m2M50+2ySCb+VWMEj6z8KBJcfvkX/VTy5y
	HdsZwpvEu2xSrqc4DcASona2/D8FSQf2eX7sdS1/ZdFCrT/cmr56n/dcPEizamwB
	YvpCPWbz6qWy+PWRiDVh/KqVyD37i1IhQ4/yFHZk59+5WH/VWBjihD6KvLqKMHsL
	iYmgtRtkq5BDuKsPoQJio8UBdylvkAVkIe2vLW8QNxxsm80THSUesX6KayIzGn6+
	/6kD3KtQY7keflXYjvtNZUIrzhBwhIGlsKA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Uil6XFZWVrqR for <linux-mtd@lists.infradead.org>;
	Mon, 20 Mar 2023 00:26:09 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pg5rB164vz1RtVm;
	Mon, 20 Mar 2023 00:26:01 -0700 (PDT)
Message-ID: <982b6aa9-4adb-acef-d9d7-9a1764a66213@opensource.wdc.com>
Date: Mon, 20 Mar 2023 16:26:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2, RESEND 01/10] kobject: introduce kobject_del_and_put()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
 trond.myklebust@hammerspace.com, anna@kernel.org, konishi.ryusuke@gmail.com,
 mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
 richard@nod.at, djwong@kernel.org, naohiro.aota@wdc.com, jth@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <e4b8012d-32df-e054-4a2a-772fda228a6a@opensource.wdc.com>
 <20230320071140.44748-1-frank.li@vivo.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230320071140.44748-1-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_002616_511361_E920521B 
X-CRM114-Status: GOOD (  12.48  )
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

On 3/20/23 16:11, Yangtao Li wrote:
> Hi filesystem maintainers,
> 
>> Hard to comment on patches with this. It is only 10 patches. So send everything please.
> 
> If you are interested in the entire patchset besides Damien,
> please let me know. I'll resend the email later to cc more people.

Yes, I said I am interested, twice already. It is IMPOSSIBLE to review a patch
without the context of other patches before/after said patch. So if you want a
review/ack for zonefs, then send the entire series.

> 
> Thx,
> Yangtao

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
