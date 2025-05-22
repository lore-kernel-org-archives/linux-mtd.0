Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F7C54756
	for <linux-mtd@archiver.kernel.org>; Thu, 22 May 2025 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kchiygqhcPk8foplYAvbqG0V0gnu1l2jfzdaG9K3JTo=; b=odqHyHaqzLkkDP
	OUslhCjCltn+l4A956iIDYdCvbzEnZ4ZL9bN/gZgDC427RI2ueLFVqhPPNxeGTlb9sK3M2QXuOj1E
	NuVflfHRi+zRdFvg7ZOFqeyDbW6tBhxINIgZ7+GHeeXspLT3ElUOoouc0J9MRH4iDpzC3WtELPTU9
	Z6OErfaw2qp21+TeWSNLohIVxCdzLqKVeIXMS0ORIPFWnidSN63ggRduJYkOX5Ut+KfjyqX0TBu6w
	U9ahrdrx4G1S5UA40IFWHjHQGh9M7Me52gv61noxaUBQ9dOEtZggcCwk4cHKJ9QlnN3ITyNThDRkt
	sNHzAl+Ux/ZRQFSf9IXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1Te-00000000Jf2-39Q3;
	Thu, 22 May 2025 08:40:34 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1A9-00000000GNs-1yH1
	for linux-mtd@lists.infradead.org;
	Thu, 22 May 2025 08:20:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ad52d9be53cso950478466b.2
        for <linux-mtd@lists.infradead.org>; Thu, 22 May 2025 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1747902023; x=1748506823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I43E9Used7ZzOVDhq/ufhep8eOi1ZE1QL/P9g55nGak=;
        b=EtfydumDC5lcWE/kXQADBcejxr0aRzqLAh9ogDKk/vLRE9xhhsH2dKOM/KoDBgi7Va
         P+PTwkVEvlW9o1AqO28V6pnJ4r/dZimZcpOE2jk8WiTAm/hyF5slAki1li2aekYwN3+S
         RQY9JJT3bCDrZLw5iofZNoqQRHEwm3p4ADs2bJoqbm4YlXflVQAG7ihqxWDW0w/yR5D9
         Wb3a76zVDt05iIxp/CLWqkeyzwfeoqp72zCajc7cCwxqS1P2Ft6O+Z/Cl5Hbu/Gak/DZ
         1OkAZlCS1+B79RK59WQovlk7Lf76YbbRyQ18sHgp1e+BV8RL0nUs8J19+VHVigkoC4NY
         Ueyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747902023; x=1748506823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I43E9Used7ZzOVDhq/ufhep8eOi1ZE1QL/P9g55nGak=;
        b=sl44xgeIyqT0YU6XleMwsOK2U+/EaVgJaCOaaxQaBRXeSss4fuRm9bkFTkn4VmganT
         DEwV0UR6va7U2SV0niZ43P5dHNxXW7by98bxp6uNVGujBub8BI9MqA9ngNzfkzuzKwja
         yWvqXz3NPEhqXc8Ks8jKvlnj1OdbeimanYbOTt1TjO/c2C7sLTFjjIEdifKEmNo2bVaU
         O6coCt9YsBSC3xIlfAmIH2murKeLIUo+404i11qBHvw9n84h0VpJ7vOfzI1ryK2+Izwh
         t3i0zsLjoKEE/oodZuQPpsJzrmTXLIPFDiwpT9KMWRatJZ3aSCc9Yq+RqPE7UZyVZGwo
         EWUg==
X-Forwarded-Encrypted: i=1; AJvYcCWWdkTOVIK9ZD5687I5igvxDpY786onnORUi52Ge7kOBLy5Hsb37n+0PcaAdZWzNmYlF852TWYx9Sw=@lists.infradead.org
X-Gm-Message-State: AOJu0YydRv43Qt7860N2XClZOJXQW21EuzBCcC2nNjxLdZvAfNF5CYY3
	cutidWuZeo0Bc1/bQfmXFfGTpVPvN6ZpfMU0pfQiXcKPHd2ee++arNCXnydwcb80uWu5JWndE0S
	woRD8b0xAow==
X-Gm-Gg: ASbGnctVo4gOqob4OPz6ZC/s+BQS6yL6dAtf1OPuwURD5ukoPLiXbbbYYKtT5PIi4Wu
	twa9HCx/8MuV2rhofbvYekEdcTzDBZopPBhoh8E7jAA2n9d86cov4GH9491bHLBnhkSqqEVVuBV
	syTFHlSgm65Z7IfteEHlhtxXJSxeM7Mx3mXSFjxqELpm/5yzk0S63pUhRNPIsJYifVXaKWguFWa
	aFDua65zTjxIa68oyRkOGcsk9E1s+khHFOoGtabvfEmhSDMaYk+CU+N5dMf1aUASQmqxkesOHXK
	S3wz1C9xXN1Kg7mjjTGK6o+I3SC0aN6TSZpDKZQdAfc/rpF2sYgJBDZpGaL81aKdf5E+nRvFqP6
	dMNioDAeSVJwwAiHyjlxBHMv8
X-Google-Smtp-Source: AGHT+IHd/c+RlpU9wZSwKb6MHnIxte3dN22uhcNe9UW8PMtyUqFZZ0KzS+tArvGbttCUDJzPrSUFTg==
X-Received: by 2002:a17:907:3f08:b0:ad5:68b7:b0df with SMTP id a640c23a62f3a-ad568b7b232mr1504511566b.46.1747902022820;
        Thu, 22 May 2025 01:20:22 -0700 (PDT)
Received: from somecomputer (ip-046-005-029-055.um12.pools.vodafone-ip.de. [46.5.29.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad53603a399sm998546366b.40.2025.05.22.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 01:20:22 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [ANNOUNCE] Alpine Linux Persistence and Storage Summit 2025
Date: Thu, 22 May 2025 10:20:20 +0200
Message-ID: <1826170.yIU609i1g2@pliers>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_012025_804239_05BCA70D 
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

We proudly announce the 8th Alpine Linux Persistence and Storage Summit
(ALPSS), which will be held September 29th to October 2nd at the
Lizumerhuette (https://www.lizumer-huette.at/) in Austria.

The goal of this conference is to discuss the hot topics in Linux storage
and file systems, such as persistent memory, NVMe, zoned storage, and I/O
scheduling in a cool and relaxed setting with spectacular views in the
Austrian alps.

We plan to have a small selection of short and to the point talks with
lots of room for discussion in small groups, as well as ample downtime
to enjoy the surroundings

Attendance is free except for the accommodation and food at the lodge
but the number of seats is strictly limited.  Cost for accommodation and
half board is between 55 and 84 EUR depending on the room category,
with additional discounts for members of an alpine society.

If you are interested in attending please reserve a seat by mailing your
favorite topic(s) to:

        alpss-pc@penguingang.at

If you are interested in giving a short and crisp talk please also send
an abstract to the same address.

The Lizumerhuette is an Alpine Society lodge in a high alpine environment.
A hike of approximately 2 hours is required to the lodge, and no other
accommodations are available within walking distance.

Please note: reservations for the lodge are not handled through the
reservation system, but as part of the ALPSS registration.

Check our website at https://www.alpss.at/ for more details.

Thank you on behalf of the program committee:

    Christoph Hellwig
    Johannes Thumshirn
    Richard Weinberger



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
