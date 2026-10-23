Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8DA606A326
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n1K/Etzz;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ysI2M+o8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AX7R8sYfjS8G7lixhf2fEPz/1gCPWOZKR5sYxcw02lc=; b=n1K/EtzzIyJBCWPUkdzqJ4Sfsp
	Uy61upRJnUtMCqwHYW3kKpqnYq0d//HHOornA1KHFH5BJ+9FgAi4FDT2CIU5Uuuq7HB0zFnSPy8iC
	9l3N9puIzU6m+/Er42oPrhiIaSZ0Xa7i68nWd2U39ZiFYDBx2UNKL9BYuerOdgur58aSlPGOvbXNX
	G/lbk7tpIuRMuwiduF8mFer2FQoMen0Qc19Zp3RWP+PZ+KcSgg/3kO47IoFd5WkWISvHNHxg0QcqF
	GTC7zyGuVZbqzLxuaWtHs+tAFMcZfm8dcGNnuKsb7gpbZB6CgfT1/CawtbrtS0hvD6MKqHF52nvok
	W7W8JSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBg5-0000000G3bm-0gNe;
	Fri, 23 Oct 2026 09:35:09 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBg1-0000000G3bO-39mv
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 09:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792748101; bh=Q49VUA00x5uwNyTjfQDoJW5O3dFV558y68RO2tYrc+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ysI2M+o8YXDhbNqM13zsUEyPFe2hRy3xnKtc34JIxBzmULYUdnD5MbSNLXPZFI3ma
	 6pLItR4EWQ7Ci8gSpBwSGiQg2DFpNMxUvwIbe3vquxpYipBpHpzZq0t6SrPiw08XMu
	 TbmixLTgqYZstPK2i/jO72y5sjneYrTjaW0UcRCk=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 8BA976D0; Fri, 23 Oct 2026 17:34:58 +0800
X-QQ-mid: xmsmtpt1792748098ts3wyb2of
Message-ID: <tencent_32B822621313A1EE74D2622CD2F2BE4D7208@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznYNwCOoVeajaew3v2Spxco+a06QtS3Kz423FRXqd/AT3815vgAq
	 PdhNN1XO0QtTPUDn8pN+gSRk189GA1cTXK5WsPcq5LrXT8V3wKxcpg+r9AtBmd1LyI9WdeUNop5u
	 Z1uE9KuWL1ZySGy7zpB3OKD5olw6Qdxg+2+Rh4e8C5TE/OvfNRq64TJ7NX3+HzzJEwUMFBbzUfcM
	 WBpOZYiUomNP/hIZrLTCQ5jR7VkGlt8b77lsPjDn+kF+/S4sVPy5e6GYLyh+Ukbu3XXECkZ3wtQ+
	 WQl6iY7SzSpsgJVpUSfeAfw5Pilqbi45LIGeNdyak0TMNAMs/XF4MrHujqW4cYjjpvS7CqiNfEVi
	 ym1587xbETMJOyMY2gAYeXAtN7MlL+QIu+BF1LhbokhulhVsnSC5ZOO8HT1OgfeuafuNYI+etPF7
	 RUhLW9GICTbPW6QlW8pN2Z3bW2+01PhAtRamuDGPh0uhgvnawuyXZwkqTeRqvhYk9BXDC11hnpx/
	 dTesIB2d5keQU75a/0lybVbvMGZblyuKnA9oCFxSb/44sD7OKZCjZF2paqjBKSu9eEDByMaRteAR
	 ywKZ4cqsGVswV2RRrGXC9g/O+3NyWebM7WdLlHzveTxbXYzmJs7Q4mU4xitekiN8ZLT3ufy9M9bi
	 LDJ6dAGeKdQpo9/MCVCIMsbid5mAoqukS72IHIxkg+qVR9X4xQBzCJs6JNdF4stAUAe5n+if2sMw
	 KjMwjdXFA13uoAHztYsgX+Ku+gVKZekpK8NJs3SoUH9d0VtjDx+/txYG65gEBsSn9n9TDyckoW6i
	 6Oic2fzo7Xpp39GI65fIYQESh2zVBQYpgEHEzoA5DP0y4mO7iRo/r7DQMzbyLqwLwBRZ6NKjSOLY
	 uh2jdEIJV1lIwrqTzL3AFkWniAb7VtU0MDZtZElF2hhJW31ymyT8avFgluh3qPDmxYmVmeIwfyti
	 K1rZzuIb2tS6WbLxLqmDTR3QyAGc+MspJQuImOwp/6pc87qLV9BFFqLpEqHs9hwBLRtGV5oX3/4e
	 va+ICaDLcHPMoRxkMJfQ0bKCsq9TYcLkZh7//0+qPh/XQFHM1YHf1gmn+D3Mc=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Shuai Liu <847807867@qq.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: swp: remove unnecessary else after return
Date: Fri, 23 Oct 2026 17:34:58 +0800
X-OQ-MSGID: <20261023093458.3974496-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023092445.3969055-1-847807867@qq.com>
References: <20261023092445.3969055-1-847807867@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_023506_333145_EF603D5C 
X-CRM114-Status: UNSURE (   6.98  )
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
> So what is the checkpatch warning? IMHO that change make the
> readability worse.

It's the "else is not generally useful after a break or return"
check in checkpatch.pl.

Fair point. With the comments attached to both branches, the
symmetric if/else reads fine, and I agree this isn't worth
changing. Please drop this patch.

Sorry for the noise.

Best regards,
Shuai Liu


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
