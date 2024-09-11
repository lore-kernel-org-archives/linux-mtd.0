Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FD0EE57C0
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2024 16:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:
	Message-ID:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HHqgb7yokRItqEUrtSfOp0s6f4dsO8qw+Sbu5ogDwdY=; b=FEbDG/CsAP8SaP
	LxsMlrx09EgGi5ezsD8F/0WQ7ugEdN+gVMXzIf4gknlHQ93PrU6JTMSu2vFHb/lxYJlJwcOskFtMD
	bOwycOwX4zRtU8/fETYGzt+3MLuNoWqxswv1gfPfiN6QH7oQnGXt7Su1+jgqhbJVPkWaOCZ1g8zE/
	3RRm0SPX9DYmfa8Jjs4A9BQwGA8bvwQg/Tk01wlNIDnw7VD0IkKuqWiN+KIHilxlKb8st7zA38gP2
	sdLI3AaYiRFEtRTrKyhe01vjO+9RzTr83XVQpUEMF3mC9sWTGfBo5ZcT9DfTUbS5rq86fJ12BvH8Z
	we3CbtP7SV1VPrV/TAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPur-0000000AJYc-3Cc6;
	Wed, 11 Sep 2024 16:10:01 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPuo-0000000AJXY-2nf0
	for linux-mtd@lists.infradead.org;
	Wed, 11 Sep 2024 16:09:59 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-70b2421471aso39119a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2024 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726070997; x=1726675797; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sc5r8MHJVUIehGKNe2oMI6+sEV+3yZ1UqhmlGV+6ivw=;
        b=RiKap/DQzhiCXi0owMvpx91ScK6jikXkVQCYtvNqpj4pIWryJtGes8KTJksXo5e3RO
         bNzNVf1vtaAqOoxp8tUC7KxQ2bXFeRpItDyGfjNA2/mCqdws1AYIcIbgorSoDI9jGeFS
         bzYpVvbkRzpzn2Ptkkgyetyi68kiX27Mxiju07JscY5AY2FtemtAFfLxoA59N8zyESWL
         t6/eRacqq3dWINqIqhPzy7kMhMUGsh8y1ZG3NYyHZPCty2gwAHadjdUOu81wCYSQMQI1
         50NR+pQGa1fFpVYnGwvlaTOXui5OYLcg57CezsZaKND/AHH1wwkab72nEhOP0g6LTwoU
         v+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726070997; x=1726675797;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sc5r8MHJVUIehGKNe2oMI6+sEV+3yZ1UqhmlGV+6ivw=;
        b=SfU35V4PqIzZFNhT+ZfRInE4r/rIFoQOOk3Wl7k4yqWz6zEvkNZDSflTrTArM11M7t
         tVhA/G57dG6wym+d7rhtsDnd0tk39AinWOf6RfMR5Wz+ykOcH/vZ/7ZSfl5Rf/iT8CUX
         NcA8MlYKU2pgaMdxUpkNJisEKt9t5X60CJmo1CxRWey1F0hlCzlCUUUOfw/b+BelnMKl
         w1eZ/Jlap+iwL8+GqwspzryJzXOdc7HjNxmoMls2I0xcJUojhDxP4ttvo3X8KdgynRYW
         Gxic8auDFKmji04dZ0Jd+Y//P0p2fGo2qf66rSiOQA5N2EM2kHLREfriY/ADHIRWmahk
         LFlA==
X-Gm-Message-State: AOJu0Yx2o/Jaaqbm+tdq1bkNbxeLNnenG1qZw8bLk8XbEcgzotxy9a/m
	QXXYCbYGv3NLKbDWuj78yT/98CDrSSgHrS0wgmhZIMqzxcwZjGZcy/DSCzWa
X-Google-Smtp-Source: AGHT+IEsIvf+OKQN8EY7tGNxhv6cR36wpFQgJOOsfODkKSP7dzoYtIf2+Z91smkkxCBdl4RJNrJt8Q==
X-Received: by 2002:a05:6a21:458a:b0:1ce:d13d:5e62 with SMTP id adf61e73a8af0-1cf5e11fc71mr6262111637.27.1726070997359;
        Wed, 11 Sep 2024 09:09:57 -0700 (PDT)
Received: from [103.237.86.105] ([103.237.86.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7190909222bsm3145901b3a.115.2024.09.11.09.09.56
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2024 09:09:56 -0700 (PDT)
From: "Mrs.Elle Dridg" <mritunjaymorya0738@gmail.com>
X-Google-Original-From: "Mrs.Elle Dridg" <castillom551@outlook.com>
Message-ID: <3699c500c523a9309abeb3a60ea24b0df17db39e882b23bb45f1375cfb8e450e@mx.google.com>
To: linux-mtd@lists.infradead.org
Subject: Gifting an Acoustic Instrument
Date: Wed, 11 Sep 2024 23:09:56 +0700
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_090958_711946_43F8B0AD 
X-CRM114-Status: UNSURE (   2.79  )
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
Reply-To: eldridg84@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hello,

I am offering my late husband's Yamaha Baby Grand Piano to a passionate instrument lover. If you are interested or know someone who would appreciate having this beautiful instrument, please let me know.

Thanks,
Mrs.Elle




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
