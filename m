Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88140606A323
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aPJPM3R1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04x3aYY7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DlvN7U91zTN1McBFoWqdo0lSI21BpFD9IEykRXkIN/c=; b=aPJPM3R1EaykTmIbzDaMD7xDGs
	trfoOaY0XU0knZDab13ArQgdDTX48I+Up0iZIyCYQ18fAic5nTfPrj7wBXdbDMwln6LJC4ZcWr9nT
	O061D2X5uWoKMpVqSO7nDbNi6GWkF9944UAAlK3WVa4vBDQA8guAXlukzMrdFaqd/b9Qk3d4eWzxY
	0E91p0et/i0W90fqUfsQN/GT728oT0UY3SlmQ0axER6X9y7gzj2+b3KgWj50MMvSk5WfOFiPpc1Mz
	8ivanw8e1OOmQ642+rIR09TDred++brDOzRgP94nAs9189u0csP+EwDYohZ7BNvRwzLXjUA5cfwS8
	HjTt8bbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXbN-0000000D0GB-1dtx;
	Thu, 26 Nov 2026 11:25:21 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXaK-0000000CzhE-0UUV
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 11:24:29 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so2754191a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 03:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795692255; x=1796297055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPuYlgDQkbI5iiO9/9VOzdNRhnNYoSZ2JGqLIJUR010=;
        b=04x3aYY7tMa2vGuf6hgyKk/pAsVchWtvgnpqqc0MHBlYzMrG/slR8RDxiun3p8G9Vo
         gw9Ra3mxKLivC6YpxtjTq2rZk5bGANjUShDhxSio3oMJDndJTmKHv4R3kfN2z8lpLCAl
         pyp32bldNJBzoSlHYyQXiMOjDKbTqlyFim86gAx2Jet7nwLk1XLCc2Q1CByMoPMDreO1
         WUNhBN9M8FJ7vBGZqSfasl29JwW1vF8I0SGhBBuZSUwyajTHbzbZ6IJ03aONt9i17HnX
         Q57StNUikOZEU98pa9ia75xTSoI2aLIoS6W/ZNf3RQEaYEyNjtz05xnzp4lLzkt5dhoI
         nv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692255; x=1796297055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPuYlgDQkbI5iiO9/9VOzdNRhnNYoSZ2JGqLIJUR010=;
        b=ZtQBYVrEA5Oov1lCeeNICyXWqBXW8Acks6LiwB8yEpbSJikZeR65ECw7ja5LigL8e5
         lLFPebn4GG50M+d/d8FYg/M38xwZI5jSmz38X7F6mwPqKrUWHZt+X0ZIxosygvGE91sw
         083QsptnqI/X6o250ouwjdBp+ip1fbOWR0g28ZMItkJrXIIP1ZljfNM0xiaO5tjLsXIB
         WCSrjNszKuERmMnKV0aE2mRY+b0BNvnOfbSSJKyDRe0LnkwPmTDNyjhqGX7tTR92kXB6
         f5YEGA7IY7MeO07dxu7ROYgrZeDK8kff2jaaRrmasCcF2DV1FQMUHEYBCHy4v7qzKbTa
         jkDw==
X-Gm-Message-State: APuU4Z8/XnQdHGIdoA+akviGZbyzOpK9q621NvKYWOVZ4awU6QAxH+Io
	vjGWh+4GfZaprenJ8xbkptv3+FQ71A+42sQ7dsQUwj+gIbwfHNPwNXCD
X-Gm-Gg: AZFdTZcJefnZF0GGy7EA590BdbgcaScYh/g6miN5mN+xCBLNBOInUmIYAveytlIIwte
	ko5lZPl5c85eeYcQ7vmEVn4r+0uQIYb9BR7ZzcK6iuJs2bdFr7n6S84dCFgOLvZk1bNRvEL+/iA
	EKUi9zTDSgakdCaLhmpdfEaql8drUTsQbj3uY9abEyaD7KLbm1I8mAE09nxLgbL2ygjx32mgiWp
	K/jjx/coRaS+P8WcbuEDg2DoK8Z/8K2nQmKRv55I6YrQHTJDTgcvuTbAdX0kumnyMfiCXu2N4RW
	xDWf6OTUWrmOnmAy4u+ioRljooWl/Ro0hWf4SVbd8zp2nc8SZFQ+hLqXaAZKd3LqKJ8lx2jlcdm
	jmekspX/s3Of8Xfs5PvNA2+ydbtnn4r15bHa5F9AGDGP582F9wAf/qwvibE6YOJtyTxO6/XDumQ
	fL209nlUfYezOpXrl9i51vmd0HFIN/LpuJHGQMsUmzrfUql+e5vUbLbHkUUQY9OM/cPoNsAj9yW
	tGLt0Z8hW9ctK4UrBp1ZseZiL9Di9npXaQ4iYIOQTdRad577ljbpNOmWFVxCoGveKXofcVfBNns
	QHmFf3OGHzKwKBcwZJEEIicjf67Z3cJStw==
X-Received: by 2002:a17:90b:1801:b0:3ac:8446:c1b5 with SMTP id 98e67ed59e1d1-3b41c9e4b0dmr20385243a91.31.1795692254534;
        Thu, 26 Nov 2026 03:24:14 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm11652192a91.17.2026.11.26.03.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:24:14 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Thu, 26 Nov 2026 19:24:09 +0800
Message-Id: <20261126112409.8491-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <878q2fyhvm.fsf@bootlin.com>
References: <878q2fyhvm.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_032416_197019_B58CD6D7 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

Thanks for the reminder about the threading, and thanks a lot for
your guidance on this series.

By the way, if you have some time to spare, I would appreciate if
you could also have a look at the kvmalloc RFC this series came
from:

https://lore.kernel.org/all/20261124025722.1476247-1-leeonion.muyu@gmail.com/

Thanks again,
Ping

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
