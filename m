Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF84C27C65
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2024 19:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PE18LnjvIAhxE+62OX524I3m/UwCxBFkrht+PwPMTB4=; b=gtpOeInoYam233
	O6dFFKz8Ilzco7gO5brizCD9A1f3BAoZAoGvHJJmosrmxLKB6dLsRre6ejQss6Z9bSGHFaZymTPTe
	/NFoRg6aEPnHseoGCkoM4nclDtXayfuiZX3OHeL2mu2Dot2f3UU5UC3OPqk4Xlhupi/yoF2Aue4St
	GXsNm21B2s8S4Ex/O1fg11Odo1sJsiy3WHjH3OVF7PvmI56FCuRccyDbQQ/+HsL4HRvtwhInzJZ9l
	/NPWhZda33qDkusHo5RqJP6a+SYbWEyJabV2mhM8yRpXigaxsiEWLD3zuYFmL2/0gjArKC/sYEi11
	EppaSMVQFVNMlZtrOdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH769-00000009zAu-3nfg;
	Tue, 11 Jun 2024 19:24:01 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH767-00000009zAN-001f;
	Tue, 11 Jun 2024 19:24:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4VzJWL4fk8zlgMVV;
	Tue, 11 Jun 2024 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1718133830; x=1720725831; bh=rZhPumdb2n42pDla++r+0nDR
	HS4rqP791XrFPg2G27s=; b=tf12JUS8O/vzIYeKCwJjv+pwBfVWJQo9KgcDGp0z
	zC7lV0/c/f2ThXKlndGod8/GtTQwAvp2FqIrETvuNz72J0EV/Nq7OLg2Ro3uTx1k
	a3Lag73AcQE3SA5r4iVyJOxbBbB3z7MfHM9AUAy4N74Z8QUhqfhGTIxZ6DcyQWB0
	8Q6dtcQ0sUi3rbVLLp7uCK5xx11aui7r2k4FrkxildcMH3hs4D+DUFLmfX5g1L14
	BQ47XWYzIYACtm6ChhwhZqZfg6iWXjIO/WaP2y1Mjt4ULw04tLtnXIqdkxdlkhKw
	j/QTJWPUoPxIYeArXQy68tOsZbpeaOqMb660pTcOxJP27w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id zYqmexEwqHMb; Tue, 11 Jun 2024 19:23:50 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4VzJVz4rs6zlgMVT;
	Tue, 11 Jun 2024 19:23:39 +0000 (UTC)
Message-ID: <165613a2-237d-4f2b-9843-75ce0f928dff@acm.org>
Date: Tue, 11 Jun 2024 12:23:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/26] loop: always update discard settings in
 loop_reconfigure_limits
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-5-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240611051929.513387-5-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_122359_088479_22AC9E99 
X-CRM114-Status: UNSURE (   7.32  )
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

On 6/10/24 10:19 PM, Christoph Hellwig wrote:
> Simplify loop_reconfigure_limits by always updating the discard limits.
> This adds a little more work to loop_set_block_size, but doesn't change
> the outcome as the discard flag won't change.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
