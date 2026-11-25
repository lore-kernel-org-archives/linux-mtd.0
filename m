Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59498606A326
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XWX4+NZh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VTJv790j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTa/1GSv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ANad0cIdg7BXIIQ9xPNZ6NEXt6Hua81hMamiBiOiWsA=; b=XWX4+NZhK+NjJAqXyysa5+4Sjz
	1whLAVnBLV9YbFp3HDIM4RyuO5JXq+gLxfdP5bvDH4SYnOfwXBPFNMub9Y3hjGjCgWAQJXHbXT6PR
	1IeG9ygqav8CAXfLO4RNxSJmdFSK6Jo3DM5jLgiEahEHE/crcKD45buvk2lMttv4uNV1M2LtFxiqp
	qZxA1MgRzf4ziZvMBE4brejSXNNNRB8cKJyQbmbeGEf5LEF+Du/6+DJPMk2sS72AgNCb3m73SfEsn
	Yj++GGOdKgpfNDdNAkeMM3a/NRETD5vDIc59ZWI6hBGz8B1N4IxBB3KqPehFGejJHBCMNOomEHqol
	55RdKfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWl-00000009ing-1eLE;
	Wed, 25 Nov 2026 11:51:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWk-00000009imf-11Kg
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Nov 2026 11:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5PVf7Z9Y3ZYTlZU6j9uRG7cWLP6I1HaW6b5iETcLWko=; b=VTJv790jJN3wrv7+uKQl3r/30W
	ZY1vNePqfuo6Kaxn436BaQnKpTMXC+tVnh8mvKeK9eOzKPuAEt5pi8ZWdTMDD1b/I2vAjnxzL9XEP
	Wf8Bll+jRKgwCp/BmOR/dArO/YsouIjA73Fjc4TqAGL+j5Vy93YAqbNn1DsgWyOOmTjDCzwaP3PzA
	AwSpET1UfTE26aQxDbX0tr5JfYi5ub2ru8cJ0pksoexqh/TTQFtNU58LCxkGcxnzAA3JvPbGAepDE
	OUp75cmBTWT3GaMcXtlU4hfvuO6i7fWg3fvqMbNLfGDx1yfmAwC34LJ+iqtCWnsDizSxY4RTUrLG5
	Pt8KMkzA==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWh-00000005G6h-0cUs
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 11:51:05 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso3387686b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 03:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607460; x=1796212260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PVf7Z9Y3ZYTlZU6j9uRG7cWLP6I1HaW6b5iETcLWko=;
        b=hTa/1GSv1SsO81/XooRUt8v1+CmlDsrTlccOSok+cjRKBoQjIDEY2Pd4XSTtzizWq/
         1tJLKGmiebtqzIBwJco0G1F7YMP4g2adHbJgCB6VuOoWiRWPNSyNITVnf5mJRbQveqfs
         eZPLHK9gRMNIV+elrLoAM+awqBvcEHUacnZIeUo/WoIG65W4YL4HpeZ25lYp+p6+d9Jd
         Cl/KSmyNqRo/LUv7CGMfyrdefdJm94/muwFJeo7pp+2otz8h08/QtGoR+1R/Xb0+6ELL
         OSdG6mnwiI6iCnB2aZOoocj3krByQrOUj8n6vO/QNop11Km+F/wkgd3M/p3Fmb4eSrPf
         7Yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607460; x=1796212260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PVf7Z9Y3ZYTlZU6j9uRG7cWLP6I1HaW6b5iETcLWko=;
        b=ejXRvt7+hay1ckmGx4CVTjR3Ma1sGCvk2I+rmrbVvDCbVYOEx/xqs0SV5j83QCxFr+
         gGzqv9BoCaJbj5nkWrXwG/t0aVuz9m8MbTHSXUs4ALYxbAtoINHTiUm7HjVIFQadJcA/
         r0/CwLzCvDcleoqumf9/UdUJ9EXVecltxwPlDJZwJnSGpBhnuXrMNM+Xwb4uFclouV7C
         bTOW6tBVslUC8yTyyijA1tn6odTAeK0Du1jy5EzqoDJhe1xN97M867diPpMJRo/rsqSj
         mI+2eIkpDBnHENNGRymcBwyCoP5ADBredhHVpipoyOJIhwD2bA8pXbG622+8HpoaQyXT
         aogg==
X-Gm-Message-State: APuU4Z+6iF8GQ1Py6eH4LbmG6A8j2xXBRokvqJjVn8XjXXcPnfyeX+Sk
	uzq3kdYzewqzzgKa2wzQk5B9YwMYhzJ0wRUlw8oorMoZlrTFLDTJTp27YnHjQRc3
X-Gm-Gg: AZFdTZeVior1hEXoB0kSkHIO+y4ootnNOxNsPrraQkAcrVcCxcOM2+hT+1MoRhJKWu0
	67mDBIvDEcTXdR6/nGMYUrceiw4OTDmmLBGQVQjCsjL+44RVDMpYAowXnEAmcJkFgHoKYBqhaCc
	/asw7ii3E/bPPT5HxXKUFkNoFRen1HQPIPIGt8VY4RmRtWfQIYdfqzY7v+cqrg9zP7nqhXZRMkz
	8z1QJZ3b+bI0BaDleHSmEeA9tCvd6Q64FgKBH/JwkEUaX6+b57Q0fPNoTAH5uxbunUtOyeHWFpF
	EexzfK4kcRPQaqPiojXPfgbO7O4+BkvgDhIkR7RKxORjL5KfQjpJ0EFPVqCjqTBZoKE4I7dAMkC
	j03wy6+PwUfMDj960GVtI3roPBnM7kFdaOsYEFymxa2+7R7ZlKRmJ7LfB869Eq92ewnax/sguy8
	9heqFxhXOg0p1Lqkj2kunagBNr+aEpVIQkbO+G862rh3K1FND91GDFq+z6uC6UpbIW147poN8cj
	TFMg7stRhYe1IVfvAVA3tT0r0TAozW55EJbs+v3ekSXeYudRSexDNmDPnI+CMWhglGsuixleJG6
	qaVwlD0sPsi/XKjsB40L4Rj2XpVyvTSe3g==
X-Received: by 2002:a05:6a20:da12:b0:3eb:b2fc:bed7 with SMTP id adf61e73a8af0-4014d35aab3mr11946036637.16.1795607460361;
        Wed, 25 Nov 2026 03:51:00 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm8804824b3a.3.2026.11.25.03.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:50:59 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v3 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 19:50:55 +0800
Message-Id: <20261125115055.4146985-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87o6bdz1fm.fsf@bootlin.com>
References: <87o6bdz1fm.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_115103_067105_B094AF09 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: leeonion.muyu@gmail.com

Hi Miquel,

On 25/11/2026 at 10:48:45 +01, Miquel Raynal wrote:
> Can't we change the default for this chip then?

Right, advertising the requirement through chip->buf_align is much
better.  v4 sets chip->buf_align = R852_DMA_LEN next to the
NAND_USES_DMA declaration, so the core also bounces misaligned
linear buffers, and the local condition no longer needs a
justification of its own.

> Please drop this comment after fixing that, it is not useful,
> this is information that should belong in the commit log.

Done, the rationale lives in the commit log now.

Ping

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
