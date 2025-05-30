Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EB9C3ABB2
	for <linux-mtd@archiver.kernel.org>; Fri, 30 May 2025 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OytsUPSKDeiI/AvYltFmcV4KVZOKcTD4mT05OMXHsjE=; b=p0TeDfji8e+6WO
	YmLO/94XjX1uf3dsal9K2DhQW6dABaT3mIquR4prW29TdF+OyusPiSKfN1QPj0iS9m8EuHsg2IJFV
	h0ST2HIct1LFJvO0KsAIr5To3zMu8jwLWAkyMhpS4Gze5y3hPfWANDQh94cs8r+hZNwaQV7z9rM+a
	Ki/vpSAdgBHD3xONb52qyKrML1NdZibJx3no3c4Eq/q8WmTovGmLviBv19gaUMDLeFS4qL0lELsRn
	MrxWzar3Kb4Lnp+sTuKpwaobMsfZV+YwOl1BuzlmfyUEzNuBAFixEUI30r/rJZTjhjCuu/QzZvQ9h
	CD4ptQhER9OK+45d6pgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuO2-0000000HU1y-3t7a;
	Fri, 30 May 2025 07:42:42 +0000
Received: from mail.growven.pl ([51.68.70.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuNz-0000000HU1e-3pht
	for linux-mtd@lists.infradead.org;
	Fri, 30 May 2025 07:42:42 +0000
Received: by mail.growven.pl (Postfix, from userid 1002)
	id 89561266C2; Fri, 30 May 2025 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growven.pl; s=mail;
	t=1748590952; bh=YxUJwSDYTiifz63s6cOCrXf5LN2PjYKK0bgKM+svvBw=;
	h=Date:From:To:Subject:From;
	b=oomC47TTNOYU+TQis6op3zyeveAXsJeF+GaIUyyOM00SbKIq0f4yQNN36u/FjOpl8
	 tqRJ7LoEGhLxb4eK77sqPTC74pZls4TnYvxSZAbn37gd2a1SgE5+SG1vNovu5T6bXq
	 Y03idpSBNlYSnGSgumhoBvRyRC4pku7K8b0KRn5L4LTnCY+Cgm2Nhy8oRKY6KN0XK5
	 e3i5t+VLp8pZug6otEOW98bofP0jWZX2BdbOIbNQ449IAtTObSfp/n69G3ercrAJZQ
	 N2zuE62q3uaATI0YNO/Tbfw5nyNCnfi3y+c5tiArzrO4FHCJeCnW5T2rsohWXJx9Dk
	 48BCuI2HZ4EzQ==
Received: by mail.growven.pl for <linux-mtd@lists.infradead.org>; Fri, 30 May 2025 07:40:43 GMT
Message-ID: <20250530064500-0.1.2a.hdzh.0.mf48awhz8h@growven.pl>
Date: Fri, 30 May 2025 07:40:43 GMT
From: "Robert Kozielski" <robert.kozielski@growven.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.growven.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_004240_088635_053DF999 
X-CRM114-Status: UNSURE (   1.70  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIHN0cm9uxIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KUm9iZXJ0IEtvemllbHNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
