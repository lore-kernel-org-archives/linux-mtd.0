Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C40CD98DA
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfNENmy3U8JHYxw4h0jVyrWWF+T9Qdesz1UrInClNWc=; b=lG5F91/Ez9zEg6
	8csHFzwIFJZR9Y/AhMLv2tZvFypP3cvtS5S95344IaqiEXsKmxj9UvI/ioLBFpbGYA5DtINMh8GU9
	/plc1KElgYZgOUBKghv1zqCK/lBxSs3Bl4Bafur35h5m6hypieF8PApPM+hrH9bSd4l7ekhVwpvQK
	QnyUwTNUafUCu0hD2BDmOIB/jo6rpRb2W5qGX0g658ofZycouEssk8HLLkkXR5qDP/LAWXajZubJl
	1ULI0Q+YnTxTHa5KNxCBQmWhWudoF/GFef5o4yAv5n7N2piF9IRuQEaqfR7bjMchtyYKv66zYGU98
	KPw7S2L4HnymysbvY7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQnR-0000000FaLb-1EME;
	Tue, 16 Jun 2026 10:13:29 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQnK-0000000FaKK-3a2J
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jun 2026 10:13:27 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-9159951f05aso485056085a.0
        for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781604800; x=1782209600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+M/4BfCg4kebp/5c+3KqKstn3ZcQMD8Dq5coTSVGSOk=;
        b=Ugkl0k68rRC79X5skescS4aUpVXaNVBlrvo0ML5XAVO2DtfXXUwPPf17xpm96PnXLk
         g+9by/vgxgDPNTD+kmIQgiGpCMnIA6rxPVKrIrq8M3s0lSsRfIxcCfLJ/YNF1XMZt2W7
         IJFCIufbUYMDBR2mCRxppimT+Ud6T/sp0IebXDDIluI+kh9BPJKK4UfEJA4Y1u/1ulXU
         gtHuSa6zRqO79HUz0GG7gCzaoml7QxXnEBLfY2LhDz8oiZXIcccezHzWOFetfBnZ4Rtc
         ZZePWWEZUl93XgLATyq7tzAX0UV9mbe3HMr7eULUwMzCwHclZ6/i7HtQh9GzqnNMV0bd
         HBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604800; x=1782209600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M/4BfCg4kebp/5c+3KqKstn3ZcQMD8Dq5coTSVGSOk=;
        b=NnzIR8wVnUvrxLw+DOP1cGVYXecMptstXtMUKFTT0Hfl3D98WgHN0Ux9mrkHeEu/zg
         L5HCa3u6HCvFojC6imbYUy3m/KqGG9hHnebShB8ft/eEiiCjJhNULGzZXRsFzgIw1/Ah
         k7TW//TVnO7jN+Z1K09IvokC92P6SS5dlbcpFvFoSigGrg7PDlDIW9H2eDETv3lWsPzL
         xUUUnuK7tCxLA2E8InDmVyYPwe1Ok8Rqe0i9r79rzljsix0fEhqId5HN8erUjt+zLCDK
         JNIay8QmmQbpfntZXxiwHopKSTXmmCL2Rwxgd7aXlFLEKukjQpqDptU2A+/o65XEibuW
         ZjRg==
X-Forwarded-Encrypted: i=1; AFNElJ9gqqKVcSF72Mn+s2guKs4YHJumtzS13bpaH+lW+qgfyX7SAOByv5HmCOT/iZ2tn8IqyUx4UlnMe4k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwINdDDnh+vLZv//1YuW+fM/XCiFT4ov9gdBFCiAXEv0y2bneXB
	pWT+RXv20erBAZny4QdmgUbjRoz4GqhBWFd7/bb8dIqQPQOM/PHzlO4s
X-Gm-Gg: Acq92OGZjagvzLX9hXyf3wt+HmcMJllj5LpdYiJRBEqj/AAxxw6CZWANwfQF+2ckrAo
	tkWW3wWqlO2ttR0qOGYNpQjOtc2jzLp1oO2VgemODAIfpk+fU2idieBuPej0oLczzuaCr4NZ69Y
	rn2prFs7C13auAYYMmJezctdLzIp4/eiH24mzIHqsi5OENAN3qefu/pLFMT6yGJgtlkv1qva9Vp
	Rar9ppwHAVGTpc/Nz54FNtJnWlbg2WeiVEZNtQ+Mw89NCzisKP2NNOGN4LeneS0dUps+IYFrJIE
	ok5kR4dylC2mPYmwYpy7ChegKxULa6FH8TVvAu42qiNLSk4mjYiP6T4M6jCyBMOyVoO/O2NFi78
	Xd2uPpvakhDd2DZyZDssbAoCDEfmNo7/+2xK39b+DpnbByRjOaJIChaIx4ZTJgQdYMMi2mSqhAO
	dgOGUlodpkyGQyhBRT
X-Received: by 2002:a05:620a:628b:b0:915:86c6:8432 with SMTP id af79cd13be357-9161bc4aa09mr2765037285a.14.1781604800130;
        Tue, 16 Jun 2026 03:13:20 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a03bd31sm1425927085a.34.2026.06.16.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:13:19 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:13:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
Message-ID: <ajEhuS8xwcX1AA_I@stanley.mountain>
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
 <DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_031322_898882_7B76AAD9 
X-CRM114-Status: GOOD (  13.24  )
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

On Tue, Jun 16, 2026 at 11:51:53AM +0200, Luca Ceresoli wrote:
> Issue 2: in mtd_virt_concat_destroy_joins():
> 
> 	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
> 		mtd = &item->concat->mtd; [0]
> 		if (item->concat) { [1]
> 
> At line [0] we dereference item->concat, but at line [1] we apparently
> handle the case where item->concat can be NULL. Either [1] is always true
> and we can remove the if(), or [1] can be false, so [0] is a bug and should
> probably be moved to inside the if().

That's not a dereference on line 0, it's pointer math.  So the code
works.  But a lot of people find the distinction confusing.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
