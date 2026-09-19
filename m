Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFA9C982D7
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sORhiId7PUq+4cGLMPV4Jjycqz3zXAbt31XkQx+Cxs=; b=Ax7N49UyWjMB3TQTvpIjnQT6Pj
	D4vPj9X+jf15uoV635tBL3PZq4YIumXC8wJ93mu4b2z7Raez/PP0VX7vEElPlA8ky70OsbwYB8NS7
	esh6yPjpfUFhDVvwC/QLJbVRAMsqzpS2rczfZUB7NywS+Q62j+4Q5jAvO4Opps+VFXtinpRW5Vd8s
	5Itks1ZX+EXrPiYc61PNXjJ07z4nLQIpD8UytPyJDej7lz4YZqMh6xyKrF4jkwou0/XHSavhDcmkT
	EDFBR4JRcPilDOFE2LN0gqZ7CZxLo7fGHfwITv6JKT95sMGTXWTEtyUhJ8+l0URAM9lA0cD5fL4iM
	sXKb0oWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7qoC-0000000G73O-1gD2;
	Sat, 19 Sep 2026 08:52:32 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7qo9-0000000G72z-2Syk
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 08:52:30 +0000
Received: by mail-yx2-x11.google.com with SMTP id 00721157ae682-85d43f9b119so12575577b3.2
        for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2026 01:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789807947; cv=none;
        d=google.com; s=arc-20260327;
        b=A2Y52e/7rYtd3zeGIKo4ShPZqex+wp1CSmMKUFuOgRBKcg6wejye/b1KS9gADoX97c
         sYPoukE732N6PG68rrydAUY/U/lJmmNcEC0jov0LoA0G2+ea9MQQJDIwRDNDg/77d0lw
         7dptePPMsKPSCthgo/rXT5tm+NLIk0J2EcR6vuINvszkpKDFJlOXrF9yG2aymkBTnhBH
         Q29q5yFzpHz0vJ/K+5I6+NO3UTlijR/SVF16+vIxrIrEX6TJu/6Pojwb4WvIFDIQ8Acr
         Q+lM33OHSOidHfEBf00ZFPuzR66OLY2ujK6W0D343s6zkp9lc3BM+5P6cAszxVnGA42e
         erUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k8DYe9oKK5aIG2dHcrCA+rI5R1dlrHFb8Xd46TnuYuY=;
        fh=w+D5AuOEf0Gfyfgvo28dCNcK2XAfSAuabv2PKPOMgfI=;
        b=X0bbuQjhBIny3+k+Iv/bXxss6Y/d6osFF9uWo4KBUD1lEtrkGpp73lbN4CuSS1fiq2
         /kRu5FaAbFxERKvjxvcNsEal5Bc50xdDTPgGLfS9lMzmzc5HSRGf3Zg8JE7+C4ra+nTC
         sAA9pjVArOILF1M/73OuWy7Kiw0pqj8swFU4cN90bQmSz0cWzWWCtWlPLkLfcZrpkTxv
         za8ye+9eSf2mWGcWQK3SEJr1reMveteVRNBSD0ddvXA9glgxHV4z6mAEvFsFuMo9JFbU
         X1yZXcsoSWWHOpcTHgj7YbRA3o7Z7aatc2nn7WHJFYgADjUdfT+CfoHLN+6M4AYSbsuX
         z9Uw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789807947; x=1790412747; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8DYe9oKK5aIG2dHcrCA+rI5R1dlrHFb8Xd46TnuYuY=;
        b=HpOGtJnkUzfGYH3FlgIOvf8i8V/9dbeNOejjCsZB9HjCLmWlh3TmzWZE2fwh3GtBAV
         wAicm9Ul/Ck7Pmv5XiGupN5UxYoQgsM4WujqyNg4GKZM7/AJUgDPBqvbD+K+dFJ/fSBV
         FlzN8m8tWAIASWutDvTQkwbC+2jouXXaOEe1L74TQfuwea/ytdi8eE1skMiM/roS4Hih
         nx+I6uEBzsxVQJJi1n6UTYd4XfxpsC3Om3i+YHps4SZBf9z05K2cKBPRD1ctdEXtcpaq
         SrscH+gWpavhsL7Bruo5hAB/1sW2Wzf0axYGfU+Jd3+eN2vIEJrTH2ONEUnrO1zyGuS6
         hPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789807947; x=1790412747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k8DYe9oKK5aIG2dHcrCA+rI5R1dlrHFb8Xd46TnuYuY=;
        b=AIwom/m+CvpLAc0QFcpVQoJvFGb/Pw/f3/rBojvBFRrmTPsVETCCxwadxd899Pjefe
         tH1JeFhXiiREpA+GOsSu2CecMQWAn4BIdEEVhFNgs5j8K7qX+zhr5mHfaQObadInp7iL
         /FAHoLme8KbvnGegmiiyn8TgHfWdzkrR5wTr/ejqXbPo3hzm0FtDWaheO5ttVW1kBVQw
         +miVvloK3QPPX/pS2VEZxJWzMXXP9Dubyh0MocUKLXkxo3fDbIbznPsilkc2wvZKJIvZ
         KKOnfZMG0bfIwGPRYHdNRInt/aWfONLjX9TDHp41rPT9LiE/vXu0e9UDQhlWHyfVP/gL
         BZ0g==
X-Forwarded-Encrypted: i=1; AKwUvBzNzKdAjhQDMOCrwCzJAbtCaOgusCm2jbFTt5jpV+DRFsN2nWYQ2Ox6Qd1mIfuaIV4cmfWxRLJDxA8=@lists.infradead.org
X-Gm-Message-State: AFuF++kejpFONh0H+154DniOaRBMX1YGfHCpOeTa/sl+p28eGbUtAUn9
	YJlpYcD4byFb6w+Wl7zV/LF2Uh9ONq23W6qM5qlVJup4qd6FINpHSzt9O0Fp5hZbhkAbR/Y71qY
	wbsIU5y83fObLhcAAVzLN6gtVTBYI5tTiD1Re7d10+wY=
X-Gm-Gg: AYBFou2vyZaenW0h3VeDUtLb0q0t9fwx7cyLZwRfIxyjcvhxbrYCM06m51LfOolQfCb
	IhRObLX4GLaNE5GEQCnMKb33dzRhs3SSac3tWyLcgO67aBWi6usDsqlcQ1nYufkC0Hr6G/rc45K
	QTSiv+oP9Pt78ROFPwJrzhcQX9rroV+CVsW1MzO6Z2hvqMgn/Vrky5T7R2B2XmUz8plJOkZDm4m
	3h2icidVjlXz9Cvl7U88F/Ls+EIF4dAV1UN+FIiYNAYrAyiCD4EJsmaAapsInEy355QNS6Jb2+x
	jSEhABB7/RAS2DH3Bt1xSrF7iQYgbR1UnclZumQMYVwJQTfrbbLjAtW7Ub4kyKJggLpjLNtW7gE
	9GA9YWiHnDEgMYruKe4I1JfAOKePV3cq/sldODz/IWLLXgst8LWOgqvqchuINZlJxwNTcFMhye7
	x8W3Ovz+HPVOMcDYE=
X-Received: by 2002:a05:690c:ec9:b0:873:5ddf:d86a with SMTP id
 00721157ae682-89735890a04mr17921557b3.53.1789807947280; Sat, 19 Sep 2026
 01:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
In-Reply-To: <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
From: Chris Roy <iam@thechris.in>
Date: Sat, 19 Sep 2026 14:22:15 +0530
X-Gm-Features: AcwNN1WEOecPIuGbYcd9wxGzHaLC6FdKCU6cgPiJq4iHyUwvDt6WX2KcSk-6_Xw
Message-ID: <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, joern@lazybastard.org
Content-Type: multipart/mixed; boundary="000000000000ea36f6065bd222a0"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_015229_699281_A265DD6C 
X-CRM114-Status: GOOD (  31.24  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--000000000000ea36f6065bd222a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026, J=C3=B6rn Engel wrote:
> This is just awful taste. You are inside a file called "block2mtd".
> The prefix to the mutex an workqueue add absolutely nothing.
> [...]
> Pick a name that gives us some information like that, please!

Agreed. v4 renames to list_mutex and setup_wq. Additionally, I fixed
tag formatting and removed a redundant if-guard.

On Sat, Sep 19, 2026, Richard Weinberger wrote:
> While we're here, maybe it's time to add a decent configfs interface
> to this driver instead of configuring through module parameters.

I will look at a configfs interface as a follow up once this
lockdep fix lands.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

Regards,
Chris

--000000000000ea36f6065bd222a0
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mtd-block2mtd-defer-device-open-out-of-param-sysfs-w.patch"
Content-Disposition: attachment; 
	filename="0001-mtd-block2mtd-defer-device-open-out-of-param-sysfs-w.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mu855l5m0>
X-Attachment-Id: f_mu855l5m0

RnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaHJpcyBSb3kgPGlhbUB0aGVjaHJpcy5pbj4KRGF0ZTogU2F0
LCAxOSBTZXAgMjAyNiAwMDowMDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0ggdjRdIG10ZDogYmxv
Y2sybXRkOiBkZWZlciBkZXZpY2Ugb3BlbiBvdXQgb2YgcGFyYW0vc3lzZnMgd3JpdGUKCmJsb2Nr
Mm10ZF9zZXR1cCgpIG9wZW5zIHRoZSBuYW1lZCBibG9jayBkZXZpY2Ugd2hpbGUgc3RpbGwgdW5k
ZXIKcGFyYW1fbG9jaywgYW5kIG9uIHRoZSBzeXNmcyB3cml0ZSBwYXRoIHVuZGVyIGtlcm5mcyAo
YW5kIHBvc3NpYmx5IGEKc3BsaWNlIHBpcGUgbG9jaykuIFRoYXQgbmVzdHMgVkZTIGxvY2tpbmcg
dGhlIHdyb25nIHdheSByZWxhdGl2ZSB0bwpvdmVybGF5ZnMgYW5kIHRyaXBzIGxvY2tkZXAuCgpE
cm9wIHBhcmFtX2xvY2sgYW5kIHJ1biBzZXR1cCBvbiBhIGRlZGljYXRlZCBvcmRlcmVkIHdvcmtx
dWV1ZS4gS2VlcAp0aGUgY2FsbCBzeW5jaHJvbm91cyB3aXRoIHdhaXRfZm9yX2NvbXBsZXRpb24o
KS4gQWxsb2NhdGUgdGhlIHdvcmsgb24KdGhlIGhlYXAgc28gREVCVUdfT0JKRUNUU19XT1JLIHN0
YXlzIHF1aWV0LgoKQ2hhbmdlcyBzaW5jZSB2MzoKLSByZW5hbWUgbGlzdF9tdXRleCAvIHNldHVw
X3dxIHRvIHNheSB3aGF0IHRoZXkgYXJlIGZvcgotIHRpZHkgbmV3IGNvbW1lbnRzCi0gZml4IEFz
c2lzdGVkLWJ5IHRhZyBmb3JtYXQgKGNoZWNrcGF0Y2g6IEFHRU5UX05BTUU6TU9ERUxfVkVSU0lP
TikKLSBkcm9wIHJlZHVuZGFudCBzZXR1cF93cSBjaGVjayBpbiBibG9jazJtdGRfc2V0dXBfZGVm
ZXIoKSAodGhlCiAgc29sZSBjYWxsZXIgYWxyZWFkeSBnYXRlcyBvbiBpdCkKCkNoYW5nZXMgc2lu
Y2UgdjI6Ci0gcmV3cml0ZSB0aGUgbmV3IGNvbW1lbnRzIHRvIG1hdGNoIHRoZSByZXN0IG9mIHRo
ZSBmaWxlCi0gYWRkIEFzc2lzdGVkLWJ5CgpDaGFuZ2VzIHNpbmNlIHYxOgotIGhlYXAtYWxsb2Nh
dGVkIHdvcmsgKHYxIHRyaXBwZWQgREVCVUdfT0JKRUNUU19XT1JLKQotIGRlZGljYXRlZCBvcmRl
cmVkIHdvcmtxdWV1ZSBpbnN0ZWFkIG9mIHN5c3RlbV93cQotIG1vZHVsZSByZWZlcmVuY2UgYWNy
b3NzIHRoZSBkZWZlcnJlZCBvcGVuCi0gZmx1c2gvZGVzdHJveSB0aGUgd29ya3F1ZXVlIGJlZm9y
ZSBleGl0IHRlYXJkb3duCi0gc2VyaWFsaXplIHNldHVwMiBvbiB0aGUgd29ya2VyIHVuZGVyIGxp
c3RfbXV0ZXgKLSBlYXJseS1ib290IHBhcmFtbGluZSB1cGRhdGVzIHVuZGVyIHRoYXQgbXV0ZXgK
ClJlcG9ydGVkLWJ5OiBzeXpib3QrN2NhYjZhMTk2MTlmMWI4ZWZjMDBAc3l6a2FsbGVyLmFwcHNw
b3RtYWlsLmNvbQpDbG9zZXM6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRp
ZD03Y2FiNmExOTYxOWYxYjhlZmMwMApBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1zb25uZXQt
NQpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBSb3kgPGlhbUB0aGVjaHJpcy5pbj4KLS0tCiBkcml2ZXJz
L210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jIHwgMTE2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCAyMSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jIGIv
ZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9jazJtdGQuYwppbmRleCAwM2U4MGIyLi5hNTQwMDg5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jCisrKyBiL2RyaXZlcnMv
bXRkL2RldmljZXMvYmxvY2sybXRkLmMKQEAgLTI3LDYgKzI3LDggQEAKICNpbmNsdWRlIDxsaW51
eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgvbXRkL210ZC5oPgogI2luY2x1ZGUgPGxpbnV4L211
dGV4Lmg+CisjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+CisjaW5jbHVkZSA8bGludXgvY29t
cGxldGlvbi5oPgogI2luY2x1ZGUgPGxpbnV4L21vdW50Lmg+CiAjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgogI2luY2x1ZGUgPGxpbnV4L21ham9yLmg+CkBAIC00NSw2ICs0Nyw5IEBAIHN0cnVjdCBi
bG9jazJtdGRfZGV2IHsKCiAvKiBTdGF0aWMgaW5mbyBhYm91dCB0aGUgTVRELCB1c2VkIGluIGNs
ZWFudXBfbW9kdWxlICovCiBzdGF0aWMgTElTVF9IRUFEKGJsa210ZF9kZXZpY2VfbGlzdCk7Cisv
KiBQcm90ZWN0cyBibGttdGRfZGV2aWNlX2xpc3QgYW5kIGVhcmx5LWJvb3QgcGFyYW1saW5lIHVw
ZGF0ZXMgKi8KK3N0YXRpYyBERUZJTkVfTVVURVgobGlzdF9tdXRleCk7CitzdGF0aWMgc3RydWN0
IHdvcmtxdWV1ZV9zdHJ1Y3QgKnNldHVwX3dxOwoKCiBzdGF0aWMgc3RydWN0IHBhZ2UgKnBhZ2Vf
cmVhZChzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywgcGdvZmZfdCBpbmRleCkKQEAgLTQ2
MSwzMSArNDY2LDg1IEBAIHN0YXRpYyBpbnQgYmxvY2sybXRkX3NldHVwMihjb25zdCBjaGFyICp2
YWwpCiAJcmV0dXJuIDA7CiB9Cgorc3RydWN0IGJsb2NrMm10ZF9zZXR1cF93b3JrIHsKKwlzdHJ1
Y3Qgd29ya19zdHJ1Y3Qgd29yazsKKwlzdHJ1Y3QgY29tcGxldGlvbiBkb25lOworCWNoYXIgKnZh
bDsKKwlpbnQgcmV0OworfTsKKworc3RhdGljIHZvaWQgYmxvY2sybXRkX3NldHVwX3dvcmtmbihz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCit7CisJc3RydWN0IGJsb2NrMm10ZF9zZXR1cF93b3Jr
ICp3ID0KKwkJY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBibG9jazJtdGRfc2V0dXBfd29yaywg
d29yayk7CisKKwltdXRleF9sb2NrKCZsaXN0X211dGV4KTsKKwl3LT5yZXQgPSBibG9jazJtdGRf
c2V0dXAyKHctPnZhbCk7CisJbXV0ZXhfdW5sb2NrKCZsaXN0X211dGV4KTsKKwljb21wbGV0ZSgm
dy0+ZG9uZSk7Cit9CisKKy8qIFJ1bnMgYmxvY2sybXRkX3NldHVwMigpIG9uIHNldHVwX3dxLCBi
bG9ja2luZyB1bnRpbCBpdCBjb21wbGV0ZXMgKi8KK3N0YXRpYyBpbnQgYmxvY2sybXRkX3NldHVw
X2RlZmVyKGNvbnN0IGNoYXIgKnZhbCkKK3sKKwlzdHJ1Y3QgYmxvY2sybXRkX3NldHVwX3dvcmsg
Knc7CisJaW50IHJldDsKKworCXcgPSBremFsbG9jKHNpemVvZigqdyksIEdGUF9LRVJORUwpOwor
CWlmICghdykKKwkJcmV0dXJuIC1FTk9NRU07CisKKwl3LT52YWwgPSBrc3RyZHVwKHZhbCwgR0ZQ
X0tFUk5FTCk7CisJaWYgKCF3LT52YWwpIHsKKwkJa2ZyZWUodyk7CisJCXJldHVybiAtRU5PTUVN
OworCX0KKworCWluaXRfY29tcGxldGlvbigmdy0+ZG9uZSk7CisJSU5JVF9XT1JLKCZ3LT53b3Jr
LCBibG9jazJtdGRfc2V0dXBfd29ya2ZuKTsKKwlxdWV1ZV93b3JrKHNldHVwX3dxLCAmdy0+d29y
ayk7CisJd2FpdF9mb3JfY29tcGxldGlvbigmdy0+ZG9uZSk7CisKKwlyZXQgPSB3LT5yZXQ7CisJ
a2ZyZWUody0+dmFsKTsKKwlrZnJlZSh3KTsKKwlyZXR1cm4gcmV0OworfQoKIHN0YXRpYyBpbnQg
YmxvY2sybXRkX3NldHVwKGNvbnN0IGNoYXIgKnZhbCwgY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJh
bSAqa3ApCiB7Ci0jaWZkZWYgTU9EVUxFCi0JcmV0dXJuIGJsb2NrMm10ZF9zZXR1cDIodmFsKTsK
LSNlbHNlCi0JLyogSWYgbW9yZSBwYXJhbWV0ZXJzIGFyZSBsYXRlciBwYXNzZWQgaW4gdmlhCi0J
ICAgL3N5cy9tb2R1bGUvYmxvY2sybXRkL3BhcmFtZXRlcnMvYmxvY2sybXRkCi0JICAgYW5kIGJs
b2NrMm10ZF9pbml0KCkgaGFzIGFscmVhZHkgYmVlbiBjYWxsZWQsCi0JICAgd2UgY2FuIHBhcnNl
IHRoZSBhcmd1bWVudCBub3cuICovCi0KLQlpZiAoYmxvY2sybXRkX2luaXRfY2FsbGVkKQotCQly
ZXR1cm4gYmxvY2sybXRkX3NldHVwMih2YWwpOwotCi0JLyogRHVyaW5nIGVhcmx5IGJvb3Qgc3Rh
Z2UsIHdlIG9ubHkgc2F2ZSB0aGUgcGFyYW1ldGVycwotCSAgIGhlcmUuIFdlIG11c3QgcGFyc2Ug
dGhlbSBsYXRlcjogaWYgdGhlIHBhcmFtIHBhc3NlZAotCSAgIGZyb20ga2VybmVsIGJvb3QgY29t
bWFuZCBsaW5lLCBibG9jazJtdGRfc2V0dXAoKSBpcwotCSAgIGNhbGxlZCBzbyBlYXJseSB0aGF0
IGl0IGlzIG5vdCBwb3NzaWJsZSB0byByZXNvbHZlCi0JICAgdGhlIGRldmljZSAoZXZlbiBrbWFs
bG9jKCkgZmFpbHMpLiBEZXRlciB0aGF0IHdvcmsgdG8KLQkgICBibG9jazJtdGRfc2V0dXAyKCku
ICovCisJaW50IHJldCA9IDA7CgotCXN0cnNjcHkoYmxvY2sybXRkX3BhcmFtbGluZSwgdmFsLCBz
aXplb2YoYmxvY2sybXRkX3BhcmFtbGluZSkpOworCWlmICghdHJ5X21vZHVsZV9nZXQoa3AtPm1v
ZCkpCisJCXJldHVybiAtRU5PREVWOwoKLQlyZXR1cm4gMDsKKwlrZXJuZWxfcGFyYW1fdW5sb2Nr
KGtwLT5tb2QpOworCisjaWZuZGVmIE1PRFVMRQorCW11dGV4X2xvY2soJmxpc3RfbXV0ZXgpOwor
CWlmICghYmxvY2sybXRkX2luaXRfY2FsbGVkKSB7CisJCS8qIENhbm5vdCByZXNvbHZlIGJsb2Nr
IGRldmljZXMgdGhpcyBlYXJseSAqLworCQlzdHJzY3B5KGJsb2NrMm10ZF9wYXJhbWxpbmUsIHZh
bCwgc2l6ZW9mKGJsb2NrMm10ZF9wYXJhbWxpbmUpKTsKKwkJbXV0ZXhfdW5sb2NrKCZsaXN0X211
dGV4KTsKKwkJa2VybmVsX3BhcmFtX2xvY2soa3AtPm1vZCk7CisJCW1vZHVsZV9wdXQoa3AtPm1v
ZCk7CisJCXJldHVybiAwOworCX0KKwltdXRleF91bmxvY2soJmxpc3RfbXV0ZXgpOwogI2VuZGlm
CisKKwlpZiAoc2V0dXBfd3EpIHsKKwkJcmV0ID0gYmxvY2sybXRkX3NldHVwX2RlZmVyKHZhbCk7
CisJfSBlbHNlIHsKKwkJLyogTm90IHlldCBkZWZlcnJlZCB0byBzZXR1cF93cTsgc2FmZSB0byBj
YWxsIHNldHVwMiBkaXJlY3RseSAqLworCQltdXRleF9sb2NrKCZsaXN0X211dGV4KTsKKwkJcmV0
ID0gYmxvY2sybXRkX3NldHVwMih2YWwpOworCQltdXRleF91bmxvY2soJmxpc3RfbXV0ZXgpOwor
CX0KKworCWtlcm5lbF9wYXJhbV9sb2NrKGtwLT5tb2QpOworCW1vZHVsZV9wdXQoa3AtPm1vZCk7
CisJcmV0dXJuIHJldDsKIH0KCgpAQCAtNDk2LDEwICs1NTUsMTcgQEAgc3RhdGljIGludCBfX2lu
aXQgYmxvY2sybXRkX2luaXQodm9pZCkKIHsKIAlpbnQgcmV0ID0gMDsKCisJc2V0dXBfd3EgPSBh
bGxvY19vcmRlcmVkX3dvcmtxdWV1ZSgiYmxvY2sybXRkIiwgMCk7CisJaWYgKCFzZXR1cF93cSkK
KwkJcmV0dXJuIC1FTk9NRU07CisKICNpZm5kZWYgTU9EVUxFCisJbXV0ZXhfbG9jaygmbGlzdF9t
dXRleCk7CiAJaWYgKHN0cmxlbihibG9jazJtdGRfcGFyYW1saW5lKSkKIAkJcmV0ID0gYmxvY2sy
bXRkX3NldHVwMihibG9jazJtdGRfcGFyYW1saW5lKTsKKwkvKiBBdm9pZCByYWNpbmcgc3lzZnMg
d2l0aCB0aGUgZWFybHkgcGFyYW1saW5lICovCiAJYmxvY2sybXRkX2luaXRfY2FsbGVkID0gMTsK
KwltdXRleF91bmxvY2soJmxpc3RfbXV0ZXgpOwogI2VuZGlmCgogCXJldHVybiByZXQ7CkBAIC01
MTAsOSArNTc2LDE2IEBAIHN0YXRpYyB2b2lkIGJsb2NrMm10ZF9leGl0KHZvaWQpCiB7CiAJc3Ry
dWN0IGxpc3RfaGVhZCAqcG9zLCAqbmV4dDsKCi0JLyogUmVtb3ZlIHRoZSBNVEQgZGV2aWNlcyAq
LworCWlmIChzZXR1cF93cSkgeworCQlmbHVzaF93b3JrcXVldWUoc2V0dXBfd3EpOworCQlkZXN0
cm95X3dvcmtxdWV1ZShzZXR1cF93cSk7CisJCXNldHVwX3dxID0gTlVMTDsKKwl9CisKKwltdXRl
eF9sb2NrKCZsaXN0X211dGV4KTsKIAlsaXN0X2Zvcl9lYWNoX3NhZmUocG9zLCBuZXh0LCAmYmxr
bXRkX2RldmljZV9saXN0KSB7CiAJCXN0cnVjdCBibG9jazJtdGRfZGV2ICpkZXYgPSBsaXN0X2Vu
dHJ5KHBvcywgdHlwZW9mKCpkZXYpLCBsaXN0KTsKKwogCQlibG9jazJtdGRfc3luYygmZGV2LT5t
dGQpOwogCQltdGRfZGV2aWNlX3VucmVnaXN0ZXIoJmRldi0+bXRkKTsKIAkJbXV0ZXhfZGVzdHJv
eSgmZGV2LT53cml0ZV9tdXRleCk7CkBAIC01MjIsNiArNTk1LDcgQEAgc3RhdGljIHZvaWQgYmxv
Y2sybXRkX2V4aXQodm9pZCkKIAkJbGlzdF9kZWwoJmRldi0+bGlzdCk7CiAJCWJsb2NrMm10ZF9m
cmVlX2RldmljZShkZXYpOwogCX0KKwltdXRleF91bmxvY2soJmxpc3RfbXV0ZXgpOwogfQoKIGxh
dGVfaW5pdGNhbGwoYmxvY2sybXRkX2luaXQpOwotLQoyLjQzLjAK
--000000000000ea36f6065bd222a0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--000000000000ea36f6065bd222a0--

