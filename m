Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD77C3ABD2
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwRPp3om0r9xNT/myy3mjFOwXJDoSdyZnU+3lSWDe9Y=; b=H7gAQzloDYokK8
	ozGmQh3SpwkAcvvd1bWVH+Ruf7Pn915Mf09Z7mNB3ZqP/s9xrb75SbtorKMvCBHsadiV0sFk4/qQn
	OqbHKCXACh4WtQWMcqjxfBJ5hY9jrkCA35DEN0s2TuC/Unoprv4JC5o2X5OEcYnXtDBBo12wF9eFl
	dzXNtE+Px8geUGVG1vPWwe9mlV93+z+XPl5hGv3JeVa8vDgZ02gv6DKInkMFKYDdMpsYMgE5cHn1L
	y3ojtryg5zjPbUDG6/okSBLGWUrbmQ2ibHUoSgxwXXUZV3inaPG8AinV2KW2HVPsyu/lnH6zykPhG
	t531p2fxhcF4g0Ocg7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUX0-00000005pbK-1m2j;
	Tue, 17 Sep 2024 09:29:58 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqUWv-00000005paA-2AjA
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 09:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1726565372;
	bh=E3PhI7GXCpAJdmzT2a4iNhDJzEoJFoIPGeg0EuOfq7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xbbf+Y5se0TzGkK89kpabbCdBp92wgqlXTdscQksCmm9GrghDZGTDN2TT4PuYHd4c
	 mJN+l0PnShigT1IHV2tm1DqXY9vJmg4zKGcT34KLlsepiw7s6XxT541KPIvPxv/PeN
	 b6A3MERsdPz1Dhpc982cNNdukLqh6IIzTPZAsA1Y=
Received: from localhost.localdomain ([171.223.88.248])
	by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
	id 75C3E8BE; Tue, 17 Sep 2024 17:29:28 +0800
X-QQ-mid: xmsmtpt1726565368tyrem4zbq
Message-ID: <tencent_A24F6B829322C51ACE3AAD2A496AB0B16608@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9UtifDk/jJniBY8RKeaI9sKcbjuN610V7gSEFfK6wBzGpflnYVB
	 V/6AdePo7ncYeCnMDnaESBdtvmQquIJSso3j3np/0X0HyJGqpGRW0D2CtFNac+j0+pkhhHGs6/ZX
	 IeceYG2Yvmzf+vr7DxjYjbAhHOxE7u5dqFHuszCG30bvnfdC+yjYKtlfSRoO8Gq6H6Vi7Fly/mP8
	 TfVQiIbxyT1Ek5Dwgcghoo1uyf4igg922et+BskjVIoItEH/QWk9MNfH2BFXOzHpog26qzfHpBU+
	 SWL2Mr+FJWjAbxXD53NJR3SjIjvnAo0pQqZUT5JirLPyKTinN9MAFVxsojNHfNkgORmdCIaZSbpV
	 Y0q0bv0iN3xQpQRFuqZ+tmrd9jOFdzmSY59bVnG9H1Y5dYIqdyA4mvpyYwgHrBPukioT4U3dpSGQ
	 cWPOIBTWIm0I/gkZVgUAq8AsduYJIkt4A8JpmsfmWnoaIYddMi+5UZFkPDMirUOmac+hJo00vjK6
	 3RgQBdA7TCsKXqqYGrt3wukCjBXmkRp4cPEJgMehHIspPSBEXkRNAy/lBiKtolxSeIUbMORf/gkP
	 8yH/BJI/v/SoQi0dHWjuiAx1ZJXUbpBfcv63UTB6fEW+Sl5MFKIfcT3EEb+HlKMtm6aZ3akGue5T
	 MAtRdiseYPGmnYhd7f3DOwoBBLRHFwLSg36W7ygjSX/PU6/rdfUHuLeltaFSn7ilJ97TI8HXqXsd
	 QsmhQ3rA4C2hJVnlaFMKjKXjIYwVrXjXR9OquEk8Rv5/LjhxNAV0G56IL10FlffAYUPwfamEeGF7
	 uJi+L3vpkm3yL2Y5deaddM14XLBTOPTNJyGklJdm92JE8rv6zfgQeSG48DGN8nYDNPT9NK7m+Sng
	 YtyyyzwuY0ta5qUs16pH3YzSE4KuhPENCE1GwZSUkCOEtuv+/hVuc1cJsAuJCjrb3ukUjX5Q2ey4
	 llCjHjAlYyk7EKbvV65vy2m+zVKS4E4Fs0YH2Cup+pyIyQtqVVGIUbFAXDZpmIEAJJOokY2VXfXT
	 ILW29MvQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Renjun Wang <renjunw0@foxmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	mwalle@kernel.org,
	pratyush@kernel.org,
	renjunw0@foxmail.com,
	richard@nod.at,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH] mtd: spi-nor: Add support for gd25 and gd55 series chips. 
Date: Tue, 17 Sep 2024 17:29:22 +0800
X-OQ-MSGID: <20240917092922.4840-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <47e0745c-e7a4-4201-b1bf-bb8e44e5911d@wanadoo.fr>
References: <47e0745c-e7a4-4201-b1bf-bb8e44e5911d@wanadoo.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_022954_250062_6349F3A5 
X-CRM114-Status: UNSURE (   4.43  )
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

Best Regards


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
