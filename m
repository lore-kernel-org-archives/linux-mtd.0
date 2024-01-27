Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC176C46CD2
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Jan 2024 08:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LmZMO4uPryp90zmNgCPvdysFcca/htdytKZ/CGxFBVM=; b=u0wT15MzvKaTIg
	bHHq6d0uJqCS3IjitZT2n20G22p1LSGPD0PigBg1mTMe1CLX3FgIK/HNXRxFcN8oRBFx8/TDvm4x2
	3C1VmQymCplIA6UwGBVHVjwEcssZpcdKbhEQULHjfaFNWBZaX4ajlo4IHbmXKvNg+FaD2X7QTLEQp
	BcrErvD4TFRJVwYiK4SM1hpeGOt/Nebq1DdMVOuUzdb5+qfuZP1UDEGAyms/VtKUKZx3XGQOv5wcY
	9iwlWhvROf6ApCEygONaFO0bA2Win0VLG8tUTjyLM4HGJUT8CiLNykUmjgkQ3WhV08vZZQeZTOie5
	UcvHBPPSF56sR0sHuAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTe1o-000000079HG-1CxD;
	Sat, 27 Jan 2024 08:27:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTe1j-000000079ER-14lv
	for linux-mtd@lists.infradead.org;
	Sat, 27 Jan 2024 08:27:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a3169f46d73so34978866b.1
        for <linux-mtd@lists.infradead.org>; Sat, 27 Jan 2024 00:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1706344010; x=1706948810; darn=lists.infradead.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZcJQsLhZWh/yYW2Exmnxbqre8RfnYmZr+JOb/fNAlQ=;
        b=0GY0QVd3W/1K22wYF++TOsOB3dqTVVdNyx01MNNmj7lx9SIGiLEK9h5DkZqfb/Ae03
         Yi9VK9xP2cJLoSDiPAtOFrWBDTUXXRM8eUsPV19Wd/hRFIMkc8gax84huq3Nng4Vr36P
         ymmgkwdWhVX3mIZry5VQXw1Rc/sYXoSddWRIUZxmDIWZN9PLaiBk/n1UoHtADmCDJVz7
         obE5N+YcJO2T8UTzpw+E+53gshhe1tELmJopqg1yN3VwcTCYkw93Y3uU3j5+7syocytG
         FghBewjHNpNFLClNHfzpAzH2CNqxvlKsvO66RPe5WHJYHoDZejmBGg09Cw5HADekeMZG
         fqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706344010; x=1706948810;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZcJQsLhZWh/yYW2Exmnxbqre8RfnYmZr+JOb/fNAlQ=;
        b=A8neZdOYVz9Cv+sZkKcN6etCgo5LderW6by1OXMVQPD7iPRFTZv6PeBf+1pa3Sjd70
         2nSBp19Hg2h9jlvu/vpkv6kePzGL5ifbLhTGjD37kWpVIbz8vU+q5RCex7IYqt7HhQnl
         0tKmn7aAWdnR7YdQ1+RL4AaYM7Fz/AgkWogJvJfdO1I1EurbHAc9DKXiCxkG4ng6nmq/
         6mmM97rPK+XFEY2EhKTy/FQe2AJzk8E1DtpXrqBJ0bH24Mtzk7NY8yVIkyCuYa5MKzTG
         f2QvCJJp19GazRUqZWkfJau8Gvoi8G31Ie5Gi9JCwsLGKnQPwoN+a2eWS17f/skMrbej
         d9lg==
X-Gm-Message-State: AOJu0Yz/TwYM4Q+Qe08gkRqPTl/tcITRXpNXLA5DYH4e1mNdzGJM6Z04
	HoCQG/sp7nf+l176v+NJ3VQzTz4yzYg9pDCoS1+PtL9vLZodAc4CAMuiC0ieimo=
X-Google-Smtp-Source: AGHT+IH5GPlHdnxblD9bjgkz4seFu3hVBl0p1VvML+Fg5/SBWeqi1q6fzsWVFg8pBqqdDOeM3qEMVw==
X-Received: by 2002:a17:906:1c57:b0:a35:3eb7:3b74 with SMTP id l23-20020a1709061c5700b00a353eb73b74mr498284ejg.3.1706344010096;
        Sat, 27 Jan 2024 00:26:50 -0800 (PST)
Received: from smtpclient.apple ([105.225.45.176])
        by smtp.gmail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm1525002ejb.54.2024.01.27.00.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 00:26:49 -0800 (PST)
From: Ezra Buehler <ezra@easyb.ch>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 2/2] mtd: spinand: esmt: Extend IDs to 5 bytes
Date: Sat, 27 Jan 2024 10:26:37 +0200
Message-Id: <F3EF7144-ED08-448C-860E-D8ED898A7931@easyb.ch>
References: <adf1fa3b-33eb-4def-97e3-55a7231430d4@salutedevices.com>
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Martin Kurbanov <mmkurbanov@sberdevices.ru>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Sridharan S N <quic_sridsn@quicinc.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <adf1fa3b-33eb-4def-97e3-55a7231430d4@salutedevices.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
X-Mailer: iPhone Mail (20D67)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_002700_324284_4476704F 
X-CRM114-Status: UNSURE (   6.63  )
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

Hi Martin,

> On 26 Jan 2024, at 20:49, Martin Kurbanov <mmkurbanov@salutedevices.com> wrote:
> 
> Tested for F50L1G41LB
> 
> Reviewed-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
> Tested-by: Martin Kurbanov <mmkurbanov@salutedevices.com>

Thank you very much for your valuable feedback!

Cheers,
Ezra.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
