Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4B4C2BBCA
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2024 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1I2EtkFqz2SFpwci0NNpsFuDqWmYbKO/WF5cuE43yPs=; b=flM
	VzsYofpGLEi+O/uahbAkgM6Szj++GVgLDnYzjf1oZxu0H+GhCNy7sdzFscTYuXQareJWWv690Q0Ep
	0tdLcUckeTR984bgnGLQAydtXzXgzB0VgOVY2pPLei7g6XfRkl8CGfJzQnjywkkb2BR8RWAQYy4ZP
	nVImNUNqdY8wIqmmdlrWetGaSZiEnzL9QwCjA53qIVb1jA4oEAPIYNhTe5Y5egNesiV+e4MRRhPde
	KYOGP6C93vNED3TrTyR1TsEu92VPZIuTdb0XkmDXWy/E/y0HorV25vbrDjkXHJcvGfjXOfX7+VSww
	dt0TQHQwZM2hvSeYa7TxM5ziYjvBb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM31M-00000002LeJ-15iI;
	Tue, 25 Jun 2024 10:03:28 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM31I-00000002LdL-3EiQ
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jun 2024 10:03:26 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-df481bf6680so4938465276.3
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2024 03:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719309803; x=1719914603; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mEMhxMG/LiIRTDjLHnCcpZoHavz7saC3fZX2mPLP8VQ=;
        b=KQbSZaGzFvFS6ZA6nMP/Ye7Hu4x1EyKSeDkVvxs2k32K3YDIQS70z3sz+k3BkZmzLG
         HCD39l3dihCLUd2jIRezecAqTfxOwusIHVmj9Cvz+SRyHSbWtiwpJNqgxhJsQtV/yC0W
         UUJ0pOH+El8nFzDFssl5KqKhu7Ucs4PBE9BbIN/n0+YHSGNIrbk5IQMH9B7gaveAcRtq
         D5xoSATiPMWia7koR3vc1NhpVs88T7RlOsInkuYEViojInsw7JF4CmawCtxRAKTGmgxO
         5ahrS0O6+wuThjqRTT51Kp5iQznL0wioPeEF4itxdpCg93kqYuOfDsn3NfMaNjicRgP1
         TWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719309803; x=1719914603;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mEMhxMG/LiIRTDjLHnCcpZoHavz7saC3fZX2mPLP8VQ=;
        b=jfaX8/vDWQHtBr/5Jmq0/Ke0GiAB0BGAZE3zXNe6Fw1R03QDPDkFhcNzOdtCwm2wDn
         Uyj4bcC8ipjHy8HFZuG4jQGc9H4ei1OaR7RWj5w4/b70yzifVGDI8bGI0zgWqjoCHnwz
         ngqUJNuliKFCLX2QiZB16G7vImxwG2tN+2W86Oy32UVvugh9cO/W5Q+08rXTij/X9VAJ
         8919bZyNLjtYpU2ejN1GRZN41kX6SKI+H80lXL7d85w+hnZWjAeplJlLgd/XEMlO5DZ4
         9VgAZUmW3O/Bok/kFqzmtyGm2QYMLPuvZK6mzwrUM0OIphTwSHitDe3AmnjU2FZnupQ0
         8Xgg==
X-Gm-Message-State: AOJu0YzN9/nbwaWfeKglnTuplkkl1iTSkoquAs0ubzssUXGYJ7YuSVqU
	molXZer4RTKtO8Muv63vHGTeX1WTeBRED8ckAZnAQhUs3OQDerXiIaizjnJxh8a0kAn8MOuz3Zt
	/DqN7fFdEcvUJN02wjWcF39vdYHoQUGWh
X-Google-Smtp-Source: AGHT+IHwkugDBOA4djibQ6Mlcmm/4iWSuPITPQxCCB6AE7Dv0aXZFwGGi+rBIf9xybsDunbY29iyWjxwpz5jkfFyBKo=
X-Received: by 2002:a25:8709:0:b0:e02:3ade:a10a with SMTP id
 3f1490d57ef6-e0303fea3cdmr5907157276.50.1719309803567; Tue, 25 Jun 2024
 03:03:23 -0700 (PDT)
MIME-Version: 1.0
From: Ramakrishna Rao Desetti <ramakrishnadtv@gmail.com>
Date: Tue, 25 Jun 2024 15:33:12 +0530
Message-ID: <CAEh1p17XdB5-PYUo=UuHc4RjZ+voDt4n4nV5X3CwJ-Y=mrnMgQ@mail.gmail.com>
Subject: Data CRC in JFFS2
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_030324_834637_144D0789 
X-CRM114-Status: GOOD (  11.99  )
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

Hi,

I have a question about CRC in JFFS2 and request your comments.

JFFS2 keeps various types of nodes in flash. I am looking at
jffs2_raw_inode. There are 3 CRCs in it. The question concerns only data_crc.

My question is what purpose is this specific CRC serving?

In the normal operation, when we are opening a file, all its nodes
are read and their data CRC is checked. Suppose data CRC for a node fails, then
that node is not added to the frag tree but it is reported as a
message on console.
While the console message is useful, its use is limited (e.g., no access to
console.)

Now, when an application is reading the file and it reads the part of the file
covered by the erstwhile CRC failed node, JFFS2 considers it as a hole and
returns zeroes. That means the application is not informed of the file
corruption.
If the application is actually interested in file corruption, it needs to use
its own CRC (see e.g., "END-TO-END ARGUMENTS IN SYSTEM DESIGN", by J.H. Saltzer
et al).

Given this, what purpose is the data CRC serving? Note that its existence also
leads to inefficiency because of the time taken to do CRC check.

Thanks and regards,
Ramakrishna DTV.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
