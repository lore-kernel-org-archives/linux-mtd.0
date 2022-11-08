Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF053C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Nov 2022 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQIL7qvfaCQBdffyHndQTsfmmtFf/4Mj43ayOGmFl0A=; b=fkVfLQ2REkISR0
	BuGLqDKWuC6Bc6gaPbxeOrL8D4gzayNkl9nf2YYGHEaiPJlkzhX0bKVr1hq75wL0yWgQjTgKXonq4
	K1Uo2HgC3yQCdzWMt+ADMhwKAVln8ca0dZT1uADL1zwSNWh7fkhRgbiHmTrwGgvTFcEL+/VaWtltu
	yWXmQMT4Y7HpvinGz7KV3DibJ9h9RKzFnvOsthl3akVn8DxoXUdYmZG9VPIQT3MBOPxDLC+NnksRR
	u5NrsE8p5LOzvkJ9STnUUxHJXW2srR7NOHXpNaKzRPfrEAksgpz8Sa4OlWiIA9WMeDbhJwjeEfJeu
	4MvPUnqC3NT7J22NoZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKTR-003s8W-Bf; Tue, 08 Nov 2022 09:00:49 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKTO-003s7S-Sp
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2022 09:00:48 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id C9C90829E8; Tue,  8 Nov 2022 09:00:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1667898042; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=a0FWiGUc9eU/NWvbpnAb0aha9QtjvWdLvU+tJrpfsDnmLenRC1hktwPXnDqFJHYAI
	 HFmdhLCY9YKNnPVxele1szCUcB7UgNoeYXX4xHiDpc//LxDveIH9c06jnL+AE/vBR/
	 zeGI7ARHqkf6kE4xeZURF7dKHa7QrRFpuaNRHRUJ4QNO8iRs0wUqe+dUYrNI+v33+U
	 O3deqmOWNe8bB7FkseWyBJJcUU1ZGVH04AMz3LUsUAGdOKiYAC1Ru0V6Aj6oAjW3dA
	 pwzgH98IxicawUXvCNaIA9URD9oRFsulpCW2EwbvkhOypHSYKJ3UGYD3HXCvJY1UMV
	 lxKwz7s349Nfg==
Received: by mail.lokoho.com for <linux-mtd@lists.infradead.org>; Tue,  8 Nov 2022 09:00:26 GMT
Message-ID: <20221108074500-0.1.24.5o6s.0.s8vy5mlqa9@lokoho.com>
Date: Tue,  8 Nov 2022 09:00:26 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_010047_075841_C59190E0 
X-CRM114-Status: UNSURE (   2.34  )
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
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
