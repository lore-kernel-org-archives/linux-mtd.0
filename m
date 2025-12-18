Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE884D68BF4
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Dec 2025 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HtWmRwUazcafQiYiEj/we1Yh+HpVWrw+dORHzZjSys8=; b=JIyIa9+CavWGKy
	nJHDaq6glBcr/BNuoTEbJ1k4emXvx5YOQonE/Cp9T+qIPkQIbBu+f4QPd8Z03I6iYmuvIyfozSBx+
	Bc8AZhRS0OImS9T27olpezcBpjendK0q53BCltdAvJTfo/VdUvgeRYt18G6DD7Yxt2oWMSWQ5jgqL
	wLHV+FWANsDZGXjIE5sCaiMg0TLxzOileh+cQoBruPpomEJDPHktYIa4YHVEjiwHycdjTImLYtaoW
	E6LBnAGSSsODnMRckvmTIBP4h4DIUfy5uYlH0csKUUWK30YFKPNytGadouwzbQzVvCViB8hzYzdWW
	IgY5Qw9vxN0Vi5Fzt17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9eH-000000085HU-0Jjf;
	Thu, 18 Dec 2025 08:46:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9eG-000000085HE-0EQ4
	for linux-mtd@bombadil.infradead.org;
	Thu, 18 Dec 2025 08:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=; b=FSFhRzBvd3HIvXLdTUlyeJYbM7
	v2+fVrNdmcFsJj++CQrUHWxR2bgUn+ytN12z4rivZi+3/0FLGy70CsmrBI9EsG6fTFT4uov0dPj8r
	x8N33byvB3FWu/UzyGjB3pO8GkxhOZ6i7SNZkiU6segW2GcNfrnrW7QEgu0ktqPsgtDiaWa5SNXPr
	MonMS4PKjPZu1aNKLcwZRY7GZji4yerwH04Fc5r4ZDuNo7mDFkiZBupjlcQHCyi+AJRAD7HQjKTQz
	fqpTTZNfypNrWGjccAPTyRZPAofKg43GZM1BsIK2SWlMjN3TRYxOoTRaBDPzzasYvxUJNBAm/Oaan
	3gnri9JQ==;
Received: from mail.torqly.pl ([51.38.112.117])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8mh-00000008NwD-1zX7
	for linux-mtd@lists.infradead.org;
	Thu, 18 Dec 2025 07:50:54 +0000
Received: by mail.torqly.pl (Postfix, from userid 1002)
	id 85FA5A972E; Thu, 18 Dec 2025 09:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=torqly.pl; s=mail;
	t=1766047561; bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=;
	h=Date:From:To:Subject:From;
	b=VtlHQhDfE87+xiJJov+DmmGHt+/ZrqB2wv3Nud0pd9I/4lA0Uuv/eR3tKEF/fs3aj
	 I3rabc/+zDdaXIk3A33/yNRGbuVwJCfUWRHbiiP89gDJAtYovxgmeM9Xs8IT3OMEcc
	 ThupBu3e6dYu2uGKz4uELsSyLf9vqqOSDz6Blp87DX39Fnz/p5fxKGG1B7PuARfVUa
	 imG7fp7CT5RNUFqNg39fTuFZAwYlAGF6kr4UYuJ5VhXeqPl8fa9FYAf455J1bC+wFe
	 ANvGHO2pjIYy284cY5Y4bQv5a+NUyt5W8khZxZtjSI6qi2zIRNlBQCfKg2fRNJZoLa
	 rInPD149dFcaw==
Received: by mail.torqly.pl for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2025 08:46:01 GMT
Message-ID: <20251218084500-0.1.tu.d9ij7.0.becr4pwoj4@torqly.pl>
Date: Thu, 18 Dec 2025 08:46:01 GMT
From: "Tomasz Jaworski" <tomasz.jaworski@torqly.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.torqly.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_075052_207531_43292CC9 
X-CRM114-Status: UNSURE (   1.29  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LCAKCmNoY2lhxYJieW0gd3NrYXphxIcgUGHFhHN0d3UgbW/FvGxpd2/Fm8SH
IHphcnrEhWR6YW5pYSBiZW5lZml0YW1pIHcgxYJhdHd5IHNwb3PDs2IsIHBvcHJ6ZXogbmFzemUg
aW50dWljeWpuZSBuYXJ6xJlkemllLCBqYWtpbSBqZXN0IGthcnRhIGx1bmNob3dhLiAKCk5hc3pl
IGthcnR5IG9mZXJ1asSFIHd5Z29kxJksIG9zemN6xJlkbm/Fm2NpIGkgemRyb3dlIHd5Ym9yeSDF
vHl3aWVuaW93ZS4gRG9maW5hbnNvd2FuaWUgcG9zacWCa8OzdyBqZXN0IGtvcnp5c3RuZSBkbGEg
b2J1IHN0cm9uLiBLYXJ0eSBsdW5jaCB0byBkbGEgcHJhY29kYXdjeSByZWFsbmUgb3N6Y3rEmWRu
b8WbY2kgdyBwb3N0YWNpIHp3b2xuaWVuaWEgeiBaVVMgZG8gNDUwIHrFgiBtaWVzacSZY3puaWUg
bmEgcHJhY293bmlrYS4gCgpLYXJ0xJkgbW/FvG5hIGRvxYJhZG93YcSHIGRvd29sbsSFIGt3b3TE
hSwgYSBuaWV3eWtvcnp5c3RhbmUgxZtyb2RraSBuaWUgcHJ6ZXBhZGFqxIUsIGxlY3ogcHJ6ZWNo
b2R6xIUgbmEga29sZWpueSBtaWVzacSFYy4gCgpNb2fEmSBwcnplZHN0YXdpxIcgb2ZlcnTEmSwg
a3TDs3JhIHBvendvbGkgem9wdHltYWxpem93YcSHIGtvc3p0eSBpIHphcGV3bmnEhyBwcmFjb3du
aWtvbSBwb8W8xIVkYW55IGJlbmVmaXQ/CgoKUG96ZHJhd2lhbQpUb21hc3ogSmF3b3Jza2kKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
