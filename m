Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB5CC3A59E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 01:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 167B0206B8
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 01:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mzNZaE6B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhXFV/Bg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 167B0206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IhuZjbf0dMvdPb9nxVjcB4xQj933wZKonWhRCAgWGRA=; b=mzN
	ZaE6BUNY7tHOfd6jQIhc5UtOUyYFNJhFcQycvvcCxhuJIFUAfwBLyhguCmogda7hpU7aN8YfRpSe+
	sIkyFFG4msFqvN4BUuwwjB6uKY4Erwu3yQ6WaOXn01JE98eeasfdxHPzE76hyrCReZieyowDttWqn
	qkULtZIikgmXb9sxYDI7iiVWE1mikES3N2hBgUzqnj21fwUt2VkgGr1xZlMrpSNdvApHJfzVl/Zqv
	RF6bBzwNJWDMI+11DjBJBCSikci9RjY2d6u+jEHGmOTmdBdRyRZoycIYCt+lPyZIFx7lhI0QQIAYQ
	Pp0HI4eO5Cc221MU8nXpdZ+stHhsBLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5gZ0-0006O7-3t; Thu, 05 Sep 2019 01:27:54 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5gYu-0006Nl-08
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 01:27:49 +0000
Received: by mail-io1-xd33.google.com with SMTP id j4so887193iog.11
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2019 18:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LxGiNonMfD8+JXm5WVocaD115u2yc9iIUJuFM4FEwFI=;
 b=dhXFV/Bg/p03wnqQD35oJm2jKaoYAQYIeUbk+9PZYPv1+kCqB/F6orODPbPT2W5zc3
 ZiPgojhPcssl0p09Sr18emUdQo7Z6/6ICbffnPbPNW5yZIpB2qX92ig9GPHan57qDCjF
 kmw+owT3iDBZA8gLWcLP28w+xKgSPfFyML8vmBbKgemMqDCNuY8HQbHyWoCI3P9ndXx1
 0VcmYk92GOZ2qZ2ye3+QW8X+WzToQvurLR+ICf83v58xn52EsIh5gpyYhPjSuD32c98X
 n252ZeXrCYCCY+TG/M43AVX0OnhFqaPv980tC4vFEwwq7vBOcf9Pe/CpumGWrUmIOib1
 /+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LxGiNonMfD8+JXm5WVocaD115u2yc9iIUJuFM4FEwFI=;
 b=hON/XFkxxa5WfZL/6e7NzXujvQRBancgiNYdAaQsQw9fMCc3HJBqxAFplt9NX0s8xU
 jU0y3saIV+hE+zpFg9jl80P5l8qJnoA5UgMXovidV7ubdpby+QMDrgMTelBHM9UxVbiS
 hmhGdgDC6p0ly5F4y/DHX9a55HFP4hzaJXDiH4tDhtaxkV+E4BxiekDR/dt6/iRwaOSS
 /tTqbTKmVXi+9H9emgUkkstqgLCFx2fBOlzVWb4UD7CG+FNwtDa/rWf9l1bADQcm5wsQ
 aEiFOs3vFVR7L6dGZ8dSJEI4VC78vW7Vfcg9Ub5EHp9tppArs6zWlpIRsmlLIb97seEZ
 OSTw==
X-Gm-Message-State: APjAAAXZJuAsM3naU7ndVtu1SuLa/noOV1C8gfs1t96NN9JnTOyaH2+q
 eoQMS7T9B7pOWH2SBMFpGr+mx+y26nEvKP5Fv4MLIkmc
X-Google-Smtp-Source: APXvYqyun1ePomgifaC9+fB/N5vmhy4ytIVEcOjuGwAoyAD656HAP6BLapJnVaAj0hJzOwGk9o12Kfp7o8W6qMaGik4=
X-Received: by 2002:a02:cc61:: with SMTP id j1mr1376769jaq.138.1567646863920; 
 Wed, 04 Sep 2019 18:27:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP;
 Wed, 4 Sep 2019 18:27:43 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Thu, 5 Sep 2019 11:27:43 +1000
Message-ID: <CAA=hcWTrrC1a_WSNb62ftn60fAMnq1jywVsjwess1=vGufXjLw@mail.gmail.com>
Subject: A big issue of NAND fragmentation
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_182748_047330_C6673B2D 
X-CRM114-Status: UNSURE (   5.73  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I am running kernel 5.1.0 on iMX6 using NAND flash, I write small data
files about 250 bytes each every 5 minutes to a backup storage, the
total size of all data files is about 600 KB, but du shown me 9.7M is
used in that directory. I know NAND using page to flush files, how
does the MTD handler NAND fragmentation?

Does the latest version of MTD (hence the latest kernel version)
resolve this problem?

Thank you.

Kind regards,

- jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
