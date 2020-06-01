Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4611C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 14:01:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC6F2074B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 14:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XXXwpxPt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="ct9Ob0fV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC6F2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajsII3aWFePbwj3Gi3on9my+n2ux1iqXqjnv5o1Msn0=; b=XXXwpxPtOmoo2R
	V4pMTVTopx77dMifm1/gB2XlJVggFx9LYaz8TzIq8UmobY1JRyQvQD9J9Ix4BroXrKCVxzSuherqG
	OnZX/iP7lD3z37luaBXookA7+JU0BYyABYQg/yifyCsFdLiaCtU4szOzaz5qZ2sKytwwI0UNYzfSV
	smzXvhaWf2ukiWTtha9fHObSGGPyXW6mDaN9j0UEXGoxQDzT8oFNi3EIEQRWUfqVbc0R+aOSL7EV/
	w9HMAw46K+mlQ9hE5d9Ww3wQHCZYMsx68ORiYahsIAIl3nqmoOBlLUpLk6cMJWwE95JoWjtsBxc3P
	aahxLF9MCMZPgMPonvrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfkzj-0005Qx-BQ; Mon, 01 Jun 2020 14:00:51 +0000
Received: from mout.web.de ([212.227.15.3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfkzf-0005Qf-Pm
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 14:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591020034;
 bh=e4M583n+ndEFe7uz2Jqv6SloIP8i0ix03FxgdPGGvhQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=ct9Ob0fVIXFHh1FpSun13ZCyN6SGRqjW958I+rXjkNRBFcH4a+vUB9JQLnLli7hhV
 Mc7DXeXJks9HkufQx42nTt1HEnDeZqPitrreAekK9aX3nKQiawVZiyzzFdPPUWPHGd
 UQ003s8kf9SMzmGZ7IgI1DMmnKjivUqYj+Jfhayg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.133.32]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4vNQ-1iwuDG2K6m-010sT9; Mon, 01
 Jun 2020 16:00:34 +0200
Subject: Re: [1/2] ubifs: Fix potential memory leaks while iterating entries
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
References: <2bec05b7-78d3-fa36-134a-efbe977933e3@web.de>
 <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <4fe27809-552e-ea98-ba1f-cbf68e625d22@web.de>
Date: Mon, 1 Jun 2020 16:00:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <45e2cd69-93ec-a0b9-b2a6-d170eee44055@huawei.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:Obc3LXDUWzNYAR7rOJ2xt8xMNqUN5H+O9DoGw784fRwgkHrQVxb
 oPmoTc6ELoffvar2f6rRfG01a9xxHevQlOSC4JPSHtoHGwgBhAySkqqvHyvUnF7mNewo3f9
 ccgHkfs68V3O/gOtGExNbcaL/IGXFSuUfLEjJ7tiCuBu1ogHJPDJizn3RfoB+6NNm3Ho+Pu
 ITaeuSIa912MCrFB1Xxlg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VXWDgan85Jg=:B9USaHgU53/jTmeGtDUtib
 me6ZCwodrgs8hm3QQ/V+mJguGfFFkYvs1AYNUi+ekCMD1a/ylJfx7eAYKkNAwnGBy5U6p14lC
 8BMyu3+W+aJ3zw/3JVfqm+jcedtUPzya/7fWuc+jfetDinHEtp36rvo05KTbYwGo2HHlBFEEc
 EQJfGl3drXju9u2Cer6DOIU4RZ450Rs0v8C2YSayaG4GxSVwBpF+jwK8UoyHuG4By6KiKYrvx
 1KE/4nfc9F3wigtmCjQ6L/r7wpuIz+KgQJyDWJqSj7YW/VBmLNA01DgK0mjdmcZCu7SjGTvLP
 vtMAs+zdlEtHlRq1sNfQhBJOTTiDhFWbxKKWNeJXNjjN9fXFKfmKC89gF5O8NxmTLP0MZYWlp
 7RHa+3qeZY6ex6TwkwW08irGIV63EpzUSrVlYI9iyX8QLsiFbuPiiZ8RcaU77Enrnmj7EfNma
 gIqtVahHyxcliTBLdy8h8jfbfJM4sZP6fvpVTM/61IHx51wpuyw1nwtBkf9J+Qw7+Il/S/NHr
 rD7z7JugvB9jIs65yROpUUA2t2oYoxc+VlZkJtf4KCfxpdA4slvJMbxEkZXqxTy4k56lXBveg
 cmqzZLlroNOA7d1yMMHdrUQmXUa+gDedhBqwSICXcMdsnSxDZq1wObbDlWDY0kAwO5pwwy1RQ
 NhyHAlJP5YxmHGE+nOFWm+uZr/urxwy7bH3Oh+BDZnW5gZT4PxCE6lBEiw26c4M+Bnn9IXwzY
 ER3pzly8diSAd6EP+f/wByP377lVAFIzsHjP26aoTX1hZorG4pi4occqIF+FfT539ZZsb6wST
 GWfb0Sm5bFzl7ONb0AYWnyMtrrjcmL1eW4oqNQBFafsJBnLurg8SZLXXujsb6YJIGjfE8RoGQ
 iDMpFimtNUEpZCGJbiQKDx8oYESxnNo4fbHa/A4TQY+818VnGapYBfKgrZLwTlRSUIAhJ6C4M
 w+FVHQeMc+GW765Sbolp5f8S6vkPVtzONe/lgWgPCHRm07rOPwOuxDNEN2zqmMw2eOgT8b50/
 /aQKH1ZLBBu7DMhZ3go/azhu5Yiws+8q/G/ufUZEd8YU/qQ8aVWLS2Reda5iXFsUkHmNBsw8Q
 KsG8WIWuvDzaG1LbHhW7nRihjcQbFrDQEF/6RcWC1z7CXtHDOiFCYEZbTg7ChA46DOvZ3uM8/
 gQPh9hmDxru6oWfFcvgKXRR14+d/Bbtk5V/Kdvm/72AJoiOdkuNnhKCkxAaNiZVTo029uh7xv
 j7DOmAzaUpcVdd/8E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_070048_170385_481BE671 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pj4gSSBzdWdnZXN0IHRvIGF2b2lkIHRoZSBzcGVjaWZpY2F0aW9uIG9mIGR1cGxpY2F0ZSBmdW5j
dGlvbiBjYWxscwo+PiAoYWxzbyBmb3IgdGhlIGRlc2lyZWQgZXhjZXB0aW9uIGhhbmRsaW5nKS4K
Pj4gV2lsbCBpdCBiZSBoZWxwZnVsIHRvIGFkZCBhIGZldyBqdW1wIHRhcmdldHM/Cj4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0P2lkPTNkNzdl
NmE4ODA0YWJjYzA1MDRjOTA0YmQ2ZTVjZGYzYTVjZjgxNjIjbjQ1NQo+IEkndmUgdGhvdWdodCBh
Ym91dCB1c2luZyAiZ290byBlcnJfdGFnXzIiIGluIGtpbGxfeGF0dHJzIGNvZGUgYmxvY2sgdG8g
cmVsZWFzZSBwcmV2IHhlbnQsCgpJIHByb3Bvc2UgdG8gY2hvb3NlIGJldHRlciBsYWJlbHMuCgoK
PiBidXQgbGF0ZXIgaXQgbmVlZHMgdG8ganVtcCB0byAnb3V0X3JlbGVhc2UgdGFn4oCYIGZvciBy
ZWxlYXNpbmcgcHJldmlvdXNseSByZXF1ZXN0ZWQgbWVtb3J5LAo+IHdoaWNoIGNhbiBjbHV0dGVy
IHRoZSBjb2RlLgoKV291bGQgeW91IGxpa2UgdG8gcmVjb25zaWRlciB0aGlzIHZpZXc/CgoKPiBJ
dCBzZWVtcyB0aGF0IHR3byBjb25zZWN1dGl2ZSAnZ290byB0YWdzJyB3aWxsIG1ha2UgdGhlIGNv
ZGUgbGVzcyByZWFkYWJsZS4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gdHJ5IGFub3RoZXIg
c29mdHdhcmUgYWRqdXN0bWVudCBvdXQgaW4gc3VjaCBhIGRlc2lnbiBkaXJlY3Rpb24/CgoKQ2Fu
IGl0IG1ha2Ugc2Vuc2UgdG8gY29tYmluZSBjaGFuZ2VzIHRvZ2V0aGVyIHdpdGggdGhlIHVwZGF0
ZSBzdGVwCuKAnHViaWZzOiBkZW50OiBGaXggc29tZSBwb3RlbnRpYWwgbWVtb3J5IGxlYWtzIHdo
aWxlIGl0ZXJhdGluZyBlbnRyaWVz4oCdCmludG8gYSBzaW5nbGUgcGF0Y2g/Cmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIwMDYwMTA5MTAzNy4zNzk0MTcyLTItY2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20vCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8x
MjUwNDU2LwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
