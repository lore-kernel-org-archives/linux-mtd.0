Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019E3C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jul 2022 11:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yKjOil9fUzIOpZxrwsCnc4boXwXFJz+bW84Ce0RniD8=; b=ZohCz9XaqPOnnd
	aTlVIF9U4eWrTk6dZHqaul4nlezbOh7Li+RGSQ7p5lRTSDazwYioY8IKiPxIEkmKKdIewe+r20jRZ
	WufgZjjEFPaFHOl8k3vJBXAFex+XXRUIbEX7m1sYLRTWRCkKL9WdsmHZS45WzNTdAA2TSVmESQCZi
	rwD/03tZXzT+HY3PbD7/5OSoStC2LX1DahtcCFV0fIOc7SZBLXbGlWWNwZtJo6vsTgHjHDQ+0OlBh
	8sBOI1cuBf3WyIwaZuBuwlGUWkHzlQP/f9vQKip3LH/ElvQoLRQgMX+fVbnBc+k75yQto0hCJ/P4Z
	e4arA1Euqig7/TFkcOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KXM-0082Az-Km; Mon, 04 Jul 2022 11:46:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KNy-007rF5-4J
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2022 11:37:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id z12so3467766wrq.7
        for <linux-mtd@lists.infradead.org>; Mon, 04 Jul 2022 04:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jKBXFXotED+1B6HSUGwFJyKmmy7t6L5/nnjdgGUAKlQ=;
        b=GchmpI00QpgNnXPViV6O1v1u0F8sqA2pYV/cmhjXgilUzmxqputunPj9kcvX8y0JLC
         BpDbb+GL/1bygv5SU05WXap65417/i/IXvnNDOkhv79FGrB+PTfB5uRuVWSU0/jBJ4me
         MoTMjxYmbR5gg+7zrb9sAWn3eGh6RUaIRWeNLMifSXbfB9ySbYKY+QL89oyW0xfWalxI
         ZRcnYlRlQdrOx7i7c+wRMUoWjM1cz2b8Y3UQdcfUlWhUhZxhA/fxKcW3HvEKz8nLdvn9
         37NC0pbJL3n5XNm8NpJfXHxqUweivGk0tSFaiYu2nAr+BxrvIYdt1iwmlPs2IMSP25+9
         xxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jKBXFXotED+1B6HSUGwFJyKmmy7t6L5/nnjdgGUAKlQ=;
        b=a4nHh4zl70CCDqquc5wsd8q+MjgShJjEG7K/h3X9uZGRPEckuXQgdhFRhbxVoB6PP9
         YsVF6qpYXlMS84Zf92PH14ouHZbzxEaK7MH0mG4hprgLq0k5pQyTbzpI+1BaCJee+39E
         Vx5inry7ghrMrYeO2hHR+YKSg6utQBM+yJ+33MqjKTGQQib7A04B/6KllSgwBHycNoPr
         uiBQD1UV1M6VfhNOO8tl5l6s8t9E6v5esyl3glAwRseComlIPm2oMEscaqrR2V4KCNOk
         u9dnCLKmvbSUJYv5S7OhhU/AntFcNko9tsAvlnecNfqNEcTn0Da49OTIre2Rk2siInOE
         MdAw==
X-Gm-Message-State: AJIora+/Gausv8l8GL61SBKi2rpkhMFh276SKZMRhAMldUeT3DPZz9YN
	hmAFfC2gKrqmt5eRg+ObAHyU4w==
X-Google-Smtp-Source: AGRyM1v7SuvpBPTmFFNywaDGZaClkX0cqYJPP32wQi/aQNebSh9M5YVFubXkbTKAoYfCuR9nCHZjYQ==
X-Received: by 2002:adf:d215:0:b0:21d:689f:7eb0 with SMTP id j21-20020adfd215000000b0021d689f7eb0mr5986598wrh.542.1656934617719;
        Mon, 04 Jul 2022 04:36:57 -0700 (PDT)
Received: from blindfold.localnet ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id e20-20020a5d5954000000b0020fcaba73bcsm30279765wri.104.2022.07.04.04.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 04:36:57 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: alpss@penguingang.at
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
Subject: [ANNOUNCE] Alpine Linux Persistence and Storage Summit 2022
Date: Mon, 04 Jul 2022 13:36:56 +0200
Message-ID: <1778345.CLbsiaQdQ3@somecomputer>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_043702_572778_B3692ED5 
X-CRM114-Status: UNSURE (   7.12  )
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

We proudly announce the fifth Alpine Linux Persistence and Storage Summit
(ALPSS), which will be held October 11th to 14th at the Lizumerhuette [1]
[2] in Austria.

The goal of this conference is to discuss the hot topics in Linux storage
and file systems, such as persistent memory, NVMe, zoned storage, and I/O
scheduling in a cool and relaxed setting with spectacular views in the
Austrian alps.

We plan to have a small selection of short and to the point talks with
lots of room for discussion in small groups, as well as ample downtime
to enjoy the surrounding.

Attendance is free except for the accommodation and food at the lodge [3],
but the number of seats is strictly limited.  If you are interested in
attending please reserve a seat by mailing your favorite topic(s) to:

	alpss-pc@penguingang.at

If you are interested in giving a short and crisp talk please also send
an abstract to the same address.

The Lizumerhuette is an Alpine Society lodge in a high alpine environment.
A hike of approximately 2 hours is required to the lodge, and no other
accommodations are available within walking distance.

Due to the ongoing COVID-19 pandemic special rules including travel
restrictions, mask and vaccination mandates may be in place in October.
Please check the travel restrictions [4] carefully for international
travel.  We very strongly recommend all attendees to be vaccinated
against COVID-19 and will provide you with updates as needed.

Thank you on behalf of the program committee:

    Christoph Hellwig
    Johannes Thumshirn
    Richard Weinberger

[1] http://www.tyrol.com/things-to-do/sports/hiking/refuge-huts/a-lizumer-hut
[2] https://www.glungezer.at/l-i-z-u-m-e-r-h-%C3%BC-t-t-e/
[3] approx. EUR 40-60 per person and night, depending on the room
    category
[4] https://www.austria.info/en/service-and-facts/coronavirus-information




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
