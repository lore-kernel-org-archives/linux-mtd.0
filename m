Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAF2C2BD09
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2024 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qrtWcYl5oehKUDlv2euUd0vqfky+Ovcl06CM8ohDYig=; b=myDz4Gf4oSxRa7
	fiI2ULVRFv6k1cEl9YhqnKedGEAMy8GIL/twUmRzovTVc4RBDa2OAAegksEBYyL+i0hxSRmJEI5sV
	6wG+7m+kT59rjJbGk9QyyddmMPq7JCvWjd7yQvDy3TSPoD2aAml9T4dnGIq84Gv2nSpCpxhxe92LX
	GASW726Nq+FtWH4EKs6PETxXVoVzrc+psfCbjDFw0QfXbkMJ5nOV6TVC7cMO/A9WIZuCM5pxrwElI
	GlzvCC64w3Fwybzye1ezVBaspZ5G/LUiN2e75aTNuGsh3Nadcsj4vs9Iz0ynH0hQLIfqy84o17D6b
	CoKnXvQ58nCHyqdj85lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR65S-00000006N06-0DTS;
	Tue, 09 Jul 2024 08:20:34 +0000
Received: from mail.creationavenue.pl ([217.61.16.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR65O-00000006Mz3-1tkJ
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jul 2024 08:20:31 +0000
Received: by mail.creationavenue.pl (Postfix, from userid 1002)
	id A729884D74; Tue,  9 Jul 2024 10:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=creationavenue.pl;
	s=mail; t=1720513050;
	bh=ChscJKp3Om3FoG8SjFzTAmp7diEPSUZN/W3lUPFw6JM=;
	h=Date:From:To:Subject:From;
	b=XbSKGBK3oo2j8JGRMyL9HGzC+9PtgAb98xYAhVx9/30oynV91KVEIAWcRZpJmN70n
	 PPvagDPXdmePF7XLD6WRVmhOoTPrSBwUIa4urvfHbUMMSNoQ75iAhxHGvkNDBY9uaf
	 sJWIIgDPkxVeRTJP3vGQlCRF2OUpVTiBceQ7XaG5I4SlqQcgqm2RQ8TxpP1suB8I1S
	 9GYNSRY7Y264NlQGkwtz9UJEDIkJm9Ol3QMCbsgcn7WcxuT9JfIDafx2guoSaZXPyA
	 ihlG0PV8i/kMNitiKptXy/P9Z0H59/ZnqWAxVCrHgR4O7vWYBZ2Q1srWjwHmXFFJ5U
	 R1WfdGhYlE9hQ==
Received: by mail.creationavenue.pl for <linux-mtd@lists.infradead.org>; Tue,  9 Jul 2024 08:15:57 GMT
Message-ID: <20240709084501-0.1.4o.mi8o.0.c5fla39p8g@creationavenue.pl>
Date: Tue,  9 Jul 2024 08:15:57 GMT
From: "Karol Winiarski" <karol.winiarski@creationavenue.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.creationavenue.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_012030_633541_851426E0 
X-CRM114-Status: UNSURE (   0.96  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KS2Fyb2wgV2luaWFyc2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
