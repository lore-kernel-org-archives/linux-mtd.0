Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115D2C25B75
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2024 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jd+VUgkw1UsedRGyc+m94stRb1KJqyJ7g1DYrsjRH4w=; b=Wwxs1VqPvggmaU
	lXGZaUD/V2ORAfLw2chmaC2KdfnRxvgCI2369bGyFVBiLhCv/TaUJz/L56POivOzEpOQZscapDU5T
	uYN9whk0Ktoo828JMFd3jgXJl9Cv6Hmjvvy7bfsOVJoS68NZV6HGimevZmhESQ0V298WqC6hSqvjd
	ZPWS/zg7lsb6YruFQbl+fvBnaFvbvwcpmZaHBdbmr0zQK4k8lEMiWkJpPXURRHtO4FxPtYwP7ydbe
	Arg4EhVjUAJqrFuH9KweBT9q0NMTNX7WVxkq08o30ZjX0asKoVzrjkvtWh77PGuppXwekKdadSNel
	N+wZnf8g9gLE1SqiIajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIsA-00000004BGa-2aKN;
	Wed, 29 May 2024 12:57:42 +0000
Received: from mail.bizexpand.pl ([51.195.45.234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIs7-00000004BFh-1MuV
	for linux-mtd@lists.infradead.org;
	Wed, 29 May 2024 12:57:40 +0000
Received: by mail.bizexpand.pl (Postfix, from userid 1002)
	id 43233A3E01; Wed, 29 May 2024 14:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizexpand.pl; s=mail;
	t=1716987451; bh=hy7OL951zzMc4+HXkALzt9LRZiawYsmWYUx9WMj5lrk=;
	h=Date:From:To:Subject:From;
	b=oG5JST4udUKwH9X0KcxNyAj98zs8Ho4qvGtkO9DnYczh8Qvpb9Ec//W7DCwVviarU
	 7J5LhN76AlOTlTKiL0D6g/vKWt312J3Br//TkpdWHssJ+lZjcJbNDdVHeKgmYnGiT3
	 wizFmfAEGEdFOMtNw6DMVOeNXwoa+5VNV5OmA01bn9AjSCwFU/TOd1Nm50xCws+L92
	 VqzvSf6KihXTB8XrYNRg8QJVNwoKBd7j6sDK5QKD7pzWuUxQvAiWx33iQVM6KdgybC
	 qRJ8QX+1iKTfnAxjmqyJBdJzWQxz9hpg2yRXScHuF9uKTb2slgUh2uG6P3AGYL6B8q
	 kxtM5/LFV4G6Q==
Received: by mail.bizexpand.pl for <linux-mtd@lists.infradead.org>; Wed, 29 May 2024 12:52:02 GMT
Message-ID: <20240529144500-0.1.hw.23eiu.0.j3hom15x3e@bizexpand.pl>
Date: Wed, 29 May 2024 12:52:02 GMT
From: "Agata Lorenc" <agata.lorenc@bizexpand.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Nowa karta
X-Mailer: mail.bizexpand.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_055739_519966_D325AB51 
X-CRM114-Status: UNSURE (   1.35  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IGtvcnp5c3RhbGkgUGHFhHN0d28ga2llZHnFmyB6IHByemVkcMWC
YWNvbmVqIGthcnR5IGx1bmNob3dlaj8KCkN6eSB3aWVkesSFIFBhxYRzdHdvLCDFvGUgYWt0dWFs
bmllIGlzdG5pZWplIG1vxbxsaXdvxZvEhyB6d29sbmllbmlhIHogb3DFgmF0IFpVUyBhxbwgZG8g
NDUwIHrFgiBuYSBrYcW8ZGVnbyBwcmFjb3duaWthPwoKRG9maW5hbnNvd2FuaWUgcG9zacWCa8Oz
dyBqZXN0IGtvcnp5c3RuZSBkbGEgb2J1IHN0cm9uLiBQcmFjb3duaWN5IG1vZ8SFIHRha8SFIGth
cnTEhSB6YXDFgmFjacSHIHphIHBvc2nFgmtpIHcgcmVzdGF1cmFjamFjaCwgeiBkb3N0YXfEhSBv
bmxpbmUsIGNhdGVyaW5nIHB1ZGXFgmtvd3ksIGN6eSBwb2RjemFzIHpha3Vww7N3IHcgbWFya2Vj
aWUuIEplZG5vY3plxZtuaWUga2FydHkgbHVuY2hvd2Ugc8SFIGRvc2tvbmHFgnltIG5hcnrEmWR6
aWVtIG1vdHl3YWN5am55bSBkbGEgemVzcG/FgsOzdyBwcmFjb3duaWN6eWNoLgoKVyB0ZW4gc3Bv
c8OzYiB6YWRiYWrEhSBQYcWEc3R3byBvIHpkcm93aWUgaSBkb2JyZSBzYW1vcG9jenVjaWUgc3dv
amVqIGthZHJ5LCB3ZHJhxbxhasSFYyByb3p3acSFemFuaWUsIGt0w7NyZSBwb3p5dHl3bmllIHdw
xYJ5bmllIG5hIGVmZWt0eXdub8WbxIcgYml6bmVzdS4KCkN6eSBtb2fEmSB6YXByZXplbnRvd2HE
hyBzcG9zw7NiLCB3IGpha2kgbW/FvG5hIHd5a29yenlzdGHEhyB0ZWdvIHR5cHUgYmVuZWZpdCB3
IGZpcm1pZT8KCgpQb3pkcmF3aWFtLApBZ2F0YSBMb3JlbmMKU2VuaW9yIEhSIE1hbmFnZXIKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
