Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B58FC5B572
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+u6m5fcNHmPDj2D6/LC/j4jgi04IjWTjFW9RNN42JI=; b=U0IbvY0K3o+Uzm
	V3CKezhrOmusI5Jh6rINbrq7Rs1/ozIsIqDtQuAkE7Pc+Qic0hXoggShTCjzNM4FMpKDBu2rvLNGl
	PT3lXWJ9HPP8Z/4Q8W/SfAtUMR9EtTiYsmgHC35uIryDMsAWsl2iaY1N1Ct6Cc+orGs8/BS1y5ahf
	/w5mafN2OZCH0yNFsgp6VhqAofkI3HZzqqiu/SMw4VO7dwgjxkNoB2nCjaiKTQFrw+x3WB6z7eJhC
	Lt09/TSM81iGuunUQhyAeIa79eykXYop2mC6fxl21GGtaC+bTXE60nTReRVien3coKgP72ZFE1z1E
	nj9S5i69Tr8nPLj/o8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu89v-0000000GCNw-0jXB;
	Wed, 12 Aug 2026 12:34:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu89s-0000000GCN7-0nuE
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 12:34:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 77FE44E411CE;
	Wed, 12 Aug 2026 12:34:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 395236045E;
	Wed, 12 Aug 2026 12:34:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DDE511C48FB2;
	Wed, 12 Aug 2026 14:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786538048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xuFjDi+sqwOiT9DOGhyCDzTUfQjl1AKPwxZGlAghHCs=;
	b=YyhxBNCpAmrz7AsVZImu0Omgf9G2QK4rQCmlcz+11OnuKSb2zuruJNwhBDkxYtbx0f99V4
	nutTl3TxMuC+RQpOBwMXfLIHVtW6bXNW0YVWxPTWFh6hprgvtnlsvJAi9oWTnE2OjF5UOs
	AtUpHKS4Kl73uV5sWtJ1OPOBgReV4s83WUm5q7qS+s8rL1rAsJmzSG540NN3eMQP1O9MQY
	neBGMDtYRAKPeZcMpVyZ46VHh7DI8ypQ9pbVicVcoeMKio6zXsHmokpQD29YSLdgA7xmf6
	djdU59My1IqW/n0idurHxu0aAbE+UyA7a72NEFm2oKEckvmoaLwEat2QJxOhOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: joern@lazybastard.org,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com,  =?utf-8?Q?J?=
 =?utf-8?Q?=C3=B6rn?= Engel
 <joern@barelysecure.org>,  stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: block2mtd: Fix divide error when erase_size is
 zero
In-Reply-To: <48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01@kylinos.cn>
	(Pei Xiao's message of "Wed, 12 Aug 2026 09:52:42 +0800")
References: <48230456575d27aa83ce8640de8fc07cc62e8efb.1786499433.git.xiaopei01@kylinos.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 12 Aug 2026 14:34:04 +0200
Message-ID: <871pc3msar.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_053412_428141_A66E09BF 
X-CRM114-Status: UNSURE (   9.28  )
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

T24gMTIvMDgvMjAyNiBhdCAwOTo1Mjo0MiArMDgsIFBlaSBYaWFvIDx4aWFvcGVpMDFAa3lsaW5v
cy5jbj4gd3JvdGU6Cgo+IFRoZSBlcmFzZSBzaXplIGlzIHBhcnNlZCBmcm9tIHRoZSAiYmxvY2sy
bXRkIiBtb2R1bGUgcGFyYW1ldGVyIGFuZCBjYW4KPiBiZSBzZXQgdG8gemVyby4gYWRkX2Rldmlj
ZSgpIHRoZW4gZXZhbHVhdGVzCj4KPiAgICAgICAgIGlmIChzaXplICUgZXJhc2Vfc2l6ZSkKPgo+
IHdpdGggYSB6ZXJvIGRpdmlzb3IsIHdoaWNoIHRyaWdnZXJzIGEgZGl2aWRlIGVycm9yOgo+Cj4g
ICAgICAgICBkaXZpZGUgZXJyb3I6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBQVEkKPiAgICAgICAg
IFJJUDogMDAxMDphZGRfZGV2aWNlIGRyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmM6Mjk2
IFtpbmxpbmVdCj4gICAgICAgICBSSVA6IDAwMTA6YmxvY2sybXRkX3NldHVwMisweDU5Mi8weGRh
MCBkcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jOjQ1OQo+ICAgICAgICAgQ2FsbCBUcmFj
ZToKPiAgICAgICAgICBibG9jazJtdGRfc2V0dXArMHgyNy8weGUwIGRyaXZlcnMvbXRkL2Rldmlj
ZXMvYmxvY2sybXRkLmM6NDc2Cj4gICAgICAgICAgcGFyYW1fYXR0cl9zdG9yZSsweDIxNC8weDMx
MCBrZXJuZWwvcGFyYW1zLmM6NTg5Cj4gICAgICAgICAgbW9kdWxlX2F0dHJfc3RvcmUrMHg2NS8w
eDkwIGtlcm5lbC9wYXJhbXMuYzo5MDQKPiAgICAgICAgICBrZXJuZnNfZm9wX3dyaXRlX2l0ZXIr
MHgzYTQvMHg1NDAgZnMva2VybmZzL2ZpbGUuYzozNDUKPiAgICAgICAgICAuLi4KPgo+IFJlamVj
dCBhIHplcm8gZXJhc2Ugc2l6ZSBiZWZvcmUgcGVyZm9ybWluZyB0aGUgbW9kdWxvIG9wZXJhdGlv
biBzbyB0aGUKPiBleGlzdGluZyAiZXJhc2VzaXplIG11c3QgYmUgYSBkaXZpc29yIG9mIGRldmlj
ZSBzaXplIiBlcnJvciBwYXRoCj4gcmVwb3J0cyB0aGUgaW52YWxpZCBhcmd1bWVudCBhbmQgZnJl
ZXMgdGhlIGRldmljZS4KPgo+IFdoaWxlIGF0IGl0LCBkcm9wIHRoZSB1bm5lY2Vzc2FyeSAobG9u
ZykgY2FzdCBmcm9tIHRoZSBzaXplIG9wZXJhbmQgb2YKPiB0aGUgbW9kdWxvLgo+Cj4gRml4ZXM6
IGVhNmQ4MzNhM2ZkZCAoIm10ZDogYmxvY2sybXRkOiBjaGVjayBkZXZpY2Ugc2l6ZSIpCj4gUmVw
b3J0ZWQtYnk6IHN5emJvdCtiMzIwYTRkNWY2NWE2MWRiYmY4OUBzeXprYWxsZXIuYXBwc3BvdG1h
aWwuY29tCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzZhN2I1OGJhLmFj
MzYxYzA5LjIyZmYwYS4wMDQ1LkdBRUBnb29nbGUuY29tLwo+IFN1Z2dlc3RlZC1ieTogSsO2cm4g
RW5nZWwgPGpvZXJuQGJhcmVseXNlY3VyZS5vcmc+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBQZWkgWGlhbyA8eGlhb3BlaTAxQGt5bGlub3MuY24+CgpBcHBh
cmVudGx5LCByZW1vdmluZyB0aGUgY2FzdCBsZWFkcyB0byBhbiB1bnN1cHBvcnRlZCBvcGVyYXRp
b24gd2l0aCBhCjY0LWJpdCBvcGVyYW5kIG9uIDMyLWJpdCBhcmNoaXRlY3R1cmVzIChTZWUgU2Fz
aGlrbyByZXBvcnQpLgoKSSBndWVzcyBpdCBpcyBiZXN0IHRvIGtlZXAgdGhhdCBjYXN0IGluIHRo
ZSBlbmQuCgpTb3JyeSBmb3IgdGhlIGNoYW5nZXMgYmFjay1hbmQtZm9ydGguCgpNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
