Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4475606A320
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kD/kT8b7;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=dXFb6oC+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h8VluB2jzLP/Qx2OKM08sSvk3uqM0novzmL8lptKwGw=; b=kD/kT8b7qqhr9yQ/GUOkuSJi0X
	9o1KojJAHt3dr3PQmcvKthAOx6NMmRZ0FK3gDkeVp+EF9SMoW3qTj6dtT6deIOLvUpGer3SbIjIWH
	pc2kqaC1tLsIHVRs12kxTIfx1v9DuLOgwz0c5iMuTbknbpUGqYo3Qvp79fwyE+4DMnZg/wEa3Zd+g
	AvpaPHXYZN1SS8+dmpRsdL1q2PL9hZLu5RyHAa+4vNlyDrQ8I4SAuYwclMThCFSPYTH9tmkwA02n/
	W8gSiWC3fQsWbei7vGGH0LtkctyH+HjGRq5ubP7R1pQvhYrzJ1AA+874qmmC3q6UzwFLEJe6Qw0dB
	MP1iCbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBk1-0000000G3z8-0GMq;
	Fri, 23 Oct 2026 09:39:13 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBjx-0000000G3yk-49NY
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 09:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792748345; bh=DYRtRbYJzIecKf94Y8Hf2dQuCsjWudl8ekWtZbZxUUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dXFb6oC+QleMPScBZIeCpLuBj0DDaM1fJOjfmlJXGtI6PXDcB2P2QEc7RqcJAVaM+
	 5KThR/qSWaX1e/jTG6KWwkVP5Ubtr31oE2+jYLvWzykNI0je99TEnAVhnA9TTfUFrV
	 VhSNu94wVOv62J4zaFGtyMhznUuWtvGS83wqBcRo=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 9C336277; Fri, 23 Oct 2026 17:39:03 +0800
X-QQ-mid: xmsmtpt1792748343to8drg1o2
Message-ID: <tencent_FC0BADFC51D31FAE8618D9C4953B9BB42606@qq.com>
X-QQ-XMAILINFO: MJf32pulH481JOyonSMHW8kWaKttrgn4csTxU+iZvEPX0ofa89buxakGZjua4V
	 i6KxRui9GZcf2DtyircQr2RV5ETVGpHihyo7PJmJGhuC2jWe7pMRVeA6b8b5EHznvlGthmvVjmCv
	 oUe8UEkCLGD0Jj7UNFZ0Nml3NRV71cAWceLt62Q4L1AUdk4cz6me8DCHuoQw6H2N7IhPwx6MCr/b
	 ml5tlTvhOVwQ2309ikEYAICRrbcbOv3ZPn6o7YMEtTWmHlC5TXOEiZpHax+a/FaUsv1JO53z4zYg
	 B0NqYA0ryMAtUp1VBoPlzhODpyij/+hXJdzx3htXG9YUoSXppq6WBhvQzv5PJ/Au09ZOgLmzN1nC
	 fjv64qK4D5/7j18JySubqdLGrfazGLOPCJoXdtj+JH7PLKIGvAWklyg7z33JUCS/c5wpgIKdq/rU
	 iexoLEPU0of7PrxPamhCZbjBPM5563zmQIDIGf3bxUMnVSuCXOMiY1B04GGgbPRTF4mDmliHeUjE
	 fWIVJeUqxfQhNIaS0LQR7lPi0MjKU51MPvAnol/chL/A59wEfbQIKyTwJpxZRHZSQ4qQ0S1hhLyq
	 kA/6Gk6tLasDkTNDMUrMopO/i4hlQ1nL2jyDHX1Bja1+afq3oVQd8OrBR3xUk3gO0P5Ue9mfmLHv
	 7KZakcUCvdhoIpYd2bTnDOoLivARqwsHOIqctL+PND2QDdIseSHVveW5+Mf+E3+Qut0fQ9sJIzse
	 Je+qLmlvCTajD1WagHX1qFXs/CIEglwjlCIQzRNMZzGIbC+wpBkh815T+cFQxiYDenPGxQeoa2Zs
	 zogzPVP28X1dqmSLumZhnn+bA+oN4FCs+yvRlHh+3YRq7TC7NEAErGG0YoFQdOJGaH4auKhxZYNa
	 Nqfbs04R5SVZrxX3ymjDFtv8JUkK/koobkmTBaRyU9DnAvC/nf0o8d/+p4fqyGQZgf4rres2fv/y
	 i53C+QgIx86QjG+c5zP75xCmAXR91qVfidPCNH61BBWbqe/H/q/VnhKFI6egSFkYbL8hn/gb3Ffc
	 Q7q4nwXsXoOHLEWRHQzacDCLDmCncCAxwbuHfaTJmm/CE4fO8b1u6hSsQPYb8QOLxSnvarKwC4Ma
	 LqZEOohaeFXSCLQ+Q=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Shuai Liu <847807867@qq.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: fix missing space after comma in legacy flash names
Date: Fri, 23 Oct 2026 17:39:03 +0800
X-OQ-MSGID: <20261023093903.3976761-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023092444.3969022-1-847807867@qq.com>
References: <20261023092444.3969022-1-847807867@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_023910_583664_C4094C55 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026, Michael Walle wrote:
> Well, that is because they are aligned with all the other entries.
> IMHO this is just unneeded code churn.

Ah, I see it now -- the entries without a separator keep the
second column aligned. I only looked at the checkpatch errors
and missed that. I agree this is not worth churning. Please drop
this patch.

Sorry for the noise.

Best regards,
Shuai Liu


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
