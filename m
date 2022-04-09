Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B025C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 08:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKerSYHn/nq7fbyFkdnzAd9QQBwuvGc5c2H8jhl6AoM=; b=wDBZKNABAaEAEa
	RY2swSg51wS+/DjOByNuiV2dWAAzuwygwMmKDxTlPrnfIkRDmFYAX/jghl2mRnfixm3AgacFEGeUd
	WC+P3kktQXJmtpxkbR5jKdYPcI8M91+i1+JFpy5vXbbCftB/hsPzL1bmxNvn4YU9/1QZeUcNgVOaU
	Z9rykcnQSxcum0ShsNgfcVm3WG8/hJ5ot395gQ9al8k1zsrsJRqpjRtQqpCZZhao+Ssg4mmcp1nYQ
	IL3XzEygNcwwdQ1dToQjQEKEBukZMCM6dgoljcalI7rqPNmEqz+OjAowO6pffnhBqmZcBW/h6RSfO
	bDTLm8Y53goWCVdHzpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd6G5-002ZRL-6B; Sat, 09 Apr 2022 08:15:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd6Fx-002ZOH-HQ
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2022 08:15:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r13so16018116wrr.9
 for <linux-mtd@lists.infradead.org>; Sat, 09 Apr 2022 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linbit-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sw+fQbvS6SFTnotjqrxbhqCVHIPsenv7yxMzOYGId1I=;
 b=swx5mkkbJNix1TPl46oJjK+Fw0+J2z/XHhCyUPh+dcKkTNBekj88xkgZeDCIEgfzZd
 +FA0t7ckuNM4K4OwCilxgo/M+WNIfDm8hTC88nPXmxm39Wp7Y3PlmqfYEyysUU8hQUUf
 QcFmQYaxbOUrhMO1omCXZ8F/Rog5zixS+JPWEUQR0KkNkX4orlWG0JIiavrTh9qI4888
 PfuJYdextltFDNT3Q+47ZPQuPkokUbAa0jhifptu2z1GSQMaUF7eHMsw0ukFDymbedqA
 fJT7coHgReWy+GC/y+kW2UJS/DziuPPZTxFTP9KzlhdtF9p6DIhUJyZVoMiIdhtFkJM+
 cESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sw+fQbvS6SFTnotjqrxbhqCVHIPsenv7yxMzOYGId1I=;
 b=30Fd4xo14EOiglBnSYZ4EkGG9QFehPSS16PvX8Eyg5mMMbz9U3HGoxN3rLveD26RmW
 IVymTfHwK4+PVirJMWAoGDafxMLF6G3smQidFg7OU/hjwnLE//ryQFGOeypsoLV68wYA
 1Do6CPONeYAvFllRDQnbFMoEokCdCd2oTVQJN/yQYYDM7EgSHGJ1XJIgHCbVONAdbRZC
 xXHGZ73OSsyRQQ7JQrs0dBGmwEtk1sYISlPSsFWGouof3FEyUQGS+wHRKXbqtVbfVa4k
 e2DL8NVFig/yvG2FX3lyrBr/YGhOyAvcjXMNG0qJyATx2vEUETd86kFxcC8vCU+mbPfZ
 scwg==
X-Gm-Message-State: AOAM533hHFfqZiPQh8KJqzJLL19cUzPaFYfiAHBAI0hpZ5Zd9nCjc9Ex
 dO5w90x6xVAED9TlPkZiD5w8MA==
X-Google-Smtp-Source: ABdhPJzQQyyFsXyXf3Tt03078VjcrkSv2k98fwj9oToPATRHlAVDyH773lIm4bEik17KjObuot5lIg==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr17920640wrz.690.1649492137216; 
 Sat, 09 Apr 2022 01:15:37 -0700 (PDT)
Received: from [192.168.169.127] (178.115.52.210.wireless.dyn.drei.com.
 [178.115.52.210]) by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c4f5400b0038b5162260csm16809052wmq.23.2022.04.09.01.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 01:15:36 -0700 (PDT)
Message-ID: <72e9bd34-3380-e305-65f0-a17306f5bd08@linbit.com>
Date: Sat, 9 Apr 2022 10:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Jens Axboe <axboe@kernel.dk>, linux-bcache@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, Coly Li <colyli@suse.de>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-25-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220409045043.23593-25-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_011542_977761_382348C2 
X-CRM114-Status: GOOD (  13.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDkuMDQuMjIgMDY6NTAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IEp1c3QgdXNlIGEg
bm9uLXplcm8gbWF4X2Rpc2NhcmRfc2VjdG9ycyBhcyBhbiBpbmRpY2F0b3IgZm9yIGRpc2NhcmQK
PiBzdXBwb3J0LCBzaW1pbGFyIHRvIHdoYXQgaXMgZG9uZSBmb3Igd3JpdGUgemVyb2VzLgo+IAo+
IFRoZSBvbmx5IHBsYWNlcyB3aGVyZSBuZWVkcyBzcGVjaWFsIGF0dGVudGlvbiBpcyB0aGUgUkFJ
RDUgZHJpdmVyLAo+IHdoaWNoIG11c3QgY2xlYXIgZGlzY2FyZCBzdXBwb3J0IGZvciBzZWN1cml0
eSByZWFzb25zIGJ5IGRlZmF1bHQsCj4gZXZlbiBpZiB0aGUgZGVmYXVsdCBzdGFja2luZyBydWxl
cyB3b3VsZCBhbGxvdyBmb3IgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBLLiBQZXRlcnNlbiA8bWFydGlu
LnBldGVyc2VuQG9yYWNsZS5jb20+Cj4gQWNrZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8
Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+IFtidHJmc10KCkkgdGhpbmsgeW91IG1h
eSBoYXZlIGEgdHlwbyB0aGVyZTogbXkgQUNLIHdhcyBmb3IgZHJiZCwgbm90IGJ0cmZzLgoKPiBB
Y2tlZC1ieTogQ29seSBMaSA8Y29seWxpQHN1c2UuZGU+IFtiY2FjaGVdCj4gLS0tCj4gICBhcmNo
L3VtL2RyaXZlcnMvdWJkX2tlcm4uYyAgICAgICAgICB8ICAyIC0tCj4gICBibG9jay9ibGstY29y
ZS5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
