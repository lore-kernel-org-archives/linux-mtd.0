Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B852606A329
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 19:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bnF8A30m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHGp5FbM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a/KjWKU9dB/tqUnhy6PIc4IVlyWlkO7XOPGvmhk1C6w=; b=bnF8A30mYMeQ53UBjse7uBgv/8
	yAUJICA8M4xpq1mXR9jTG6y/EOifgk09u4cGjJ1NJU4qwvG9vSJQOrXcxoHJXK92SSXek7Yex9yL2
	NE0Ip3Rvsr34J31aHA4voiO2NT+xqZo+V6LsAIrYSFCinDE7YUMAuhbdDRGxRsoB70QfZGYpmVw/N
	ATde6e/eBWCY2XpiH+SLzJa735IqElOTnUz7aPF9k6Kn42/FAUCEbA9oJgSXQ73wfnT1hiIjuteg+
	kiR3PoWf7PkySt5hlXzOJ0iaoh3X9iRpBqOyHVM+NIvImCSGoM68k2eYa9B4vxc5J+m1AqUsm13+9
	WllZ3lsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2Mq-00000003kmS-1Zc3;
	Mon, 16 Nov 2026 19:27:52 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2Mn-00000003kly-3YYd
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 19:27:51 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so252249e87.0
        for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2026 11:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794857267; x=1795462067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=69B1V6c92uxkOVI/GSaEx8ffeFLnYru6WXWWNBickDw=;
        b=rHGp5FbMhlvAZ6VBhUG6uLA2RDZkWFAJKVwHLiz1ffCWzUt4wtyE8OVz+32HFr2aGD
         saujOSur6hsckWzskO5YXxbsEpwecvQ5L2K9RaBQZq9+uVMiVRLOsWeOavcJP7eQYykS
         aA2+JLu7Dur7JaxLNsbJ0vN7Za//vwN68jZv7/UebymZJbRyXJLYjZ80pHkwKiM+UJ8H
         4DuBFtoAu1Ln3j5f+gYVc5wd33gbvGQT7naCrC8v5R9haxaJmZrTWEXDGWJjp53QWbxS
         pO9k5eAht4j3q4fBBBACnNHu5WCu6xDn6Ljo0BkDhxGM2iS0Q4tI3D6xaDnwqbIuEdgQ
         GiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857267; x=1795462067;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69B1V6c92uxkOVI/GSaEx8ffeFLnYru6WXWWNBickDw=;
        b=cmjio8apJJV4sJxp+7kjhxMJFJ4nDYxAupX/piDMmiLnalJntmgblszdoNeX5ue/DQ
         RZUd8Ez17XbqqTGS04D8waDTvlXcDbsdMMM/Rd6x3d8nLyGYqjPPwD4f6Y03j1mwC4mp
         m9ITI6rdPsCr/B3QEla2o2stKt30ks3jde3PHvoCFcQKATyG2dwVY12qO2AZ5nshSrSH
         AwxLiIWQ9iKtA71MBX4AsdZ8mYb7dLi0ASf3xOZhVAId2fdhhNXGFq5HjqCjrry2zG3Q
         d4eyMdayioplozAmoZlWJ4OjUBmHLdv569Hh3v6R0sA5FtCcX/o49YttlYrWREO2jJRe
         aJVg==
X-Forwarded-Encrypted: i=1; AL+hErE4T9cdUUiO5Yk0jpkLOADBv+XcViEOpfYudZiY1iCxDzN5oJgskAd9hYSnGWqf9LNIKoeYfzQP1f8=@lists.infradead.org
X-Gm-Message-State: APuU4Z8rovXTuYT7EKRaLm5pc1B6kI4s0ROTuskY0l2hy4k+sQObdxRM
	aSBPA+K4x1EIyel5TFp+EfJcTC2BD596Q7Hjs2onm8Xy0vjKBYjxpFM=
X-Gm-Gg: AYBFou3NrHm6i0Pv1w18wSLgMSM2IhJ9Yas9FtnK4ysznF4WZjMCacTJJ7wCBOBPRsn
	7N7sLBLkd95arSioO4NFXpav3EJfQkC752gOX5/E1UXJaZf4SCFpozzDsWHMlBrMAMUNuDQCOyO
	NtZnguP684kvo9VVtaUsrcIlnCPQoEJxNZQMnd/q3tAq5BQk74lHCO1MtAQoqhhB0pYLpYsyuEF
	FonEF4RiAU9kuhtV/cdmVlVk8l4iv62mFlBW56VZLAvoWw0w+uJZZKUXfhrKs+3he2FewCg0HzY
	vVMO8ctuDvhjTSnqcuS7f2C6/Zpzk69xYTt6kPhCB4d97P7sLAoh/HsFIQgjO3CsJF2oexbr13F
	eHGE7dcmdQnVN3Q9Yl4/cgotHuX85ZvNS645uhUjqcGh7RnVEvun8fAt+SNMSsRCiNEYRQg0V9V
	bSOLF7RW0x7N3fBybFzphCVjT6KcqY/rp5R77ZT94foCmxE4hivtE+aI3TPGVgo6dNwTXlg8v8N
	4OpLtM33wvQGoVrpHUifHUuKrxpKv5CEfQ5kM5UuruwS7ayVMgXqGgQhMqzeY19te0oQwI8wUDF
	2rIjYguHPvocF/w8pLc=
X-Received: by 2002:a05:6512:23a0:b0:5bf:ec95:41c7 with SMTP id 2adb3069b0e04-5c1a0dcba0cmr126555e87.1.1794857267093;
        Mon, 16 Nov 2026 11:27:47 -0800 (PST)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171357289sm3414749e87.71.2026.11.16.11.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:27:46 -0800 (PST)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: miquel.raynal@bootlin.com
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Zhilkin <csharper2005@gmail.com>
Subject: Re: [PATCH] mtd: spinand: confirm ready state on SkyHigh S35ML chips
Date: Mon, 16 Nov 2026 21:27:14 +0200
Message-ID: <20261116192714.320454-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <87eccksvwn.fsf@bootlin.com>
References: <20261030203342.91172-1-sochnev.v.74@gmail.com> <87eccksvwn.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_112749_903960_8AE6CC11 
X-CRM114-Status: GOOD (  10.63  )
X-Spam-Score: 1.5 (+)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWlxdcOobCwKCkkgaW5zdHJ1bWVudGVkIHRoZSBTa3lIaWdoIFNQSS1OQU5EIHBhdGggb24g
YSBOb2tpYSBYRy0wNDBHLU1EIHdpdGgga3RpbWVfZ2V0X25zKCkgYW5kIGJvdW5kZWQga2VybmVs
IGxvZyBtZXNzYWdlcywgd2l0aG91dCB0cmFjaW5nLiBXaXRoIElORk8gbWVzc2FnZXMgc3VwcHJl
c3NlZCBvbiB0aGUgc2VyaWFsIGNvbnNvbGUsIDUxMiBwYWdlLWxvYWQgd2FpdHMsIDUxMCBwcm9n
cmFtIHdhaXRzIGFuZCA4IGVyYXNlIHdhaXRzIHJldHVybmVkIFJFQURZIG9uIGJvdGggdGhlIHBv
bGxlZCByZXN1bHQgYW5kIHRoZSBzdWJzZXF1ZW50IHN0YXR1cyByZWFkLiBUaGUgcGFpcnMgd2Vy
ZSAweDAwLzB4MDAsIGV4Y2VwdCBmb3IgbmluZSAweDEwLzB4MTAgcmVhZCBwYWlycyAoMeKAkzIg
Y29ycmVjdGVkIGJpdC1mbGlwcyBhY2NvcmRpbmcgdG8gdGhlIFNreUhpZ2ggZHJpdmVyOyBTVEFU
VVNfQlVTWSBjbGVhcikuIEkgZGlkIG5vdCBjYXB0dXJlIGEgUkVBRFktdG8tQlVTWSB0cmFuc2l0
aW9uIGluIHRoZXNlIGF0dGVtcHRzLgoKRm9yIDEyOCByZWFkIHdhaXRzLCBJIGFsc28gcmVjb3Jk
ZWQgdGhlIGluZGl2aWR1YWwgR0VUX0ZFQVRVUkUgdHJhbnNhY3Rpb25zOiBlYWNoIGhhZCBCVVNZ
ICgweDAxIG9yIDB4MTEpLCB0aGVuIFJFQURZICgweDAwIG9yIDB4MTApLCBmb2xsb3dlZCBieSBh
IFJFQURZIGNvbmZpcm1hdGlvbi4gVGhlIHBvbGwgdHJhbnNhY3Rpb25zIHRvb2sgMTAuODDigJMx
Ny4wOCB1cy4gVGhlIGludGVydmFsIGZyb20gY29tcGxldGlvbiBvZiB0aGUgUkVBRFkgcG9sbCB0
byB0aGUgc3RhcnQgb2YgY29uZmlybWF0aW9uIHdhcyA2Ljg04oCTMTEuNTIgdXMgKG1lZGlhbiA3
LjIyIHVzKTsgY29uZmlybWF0aW9uIHRvb2sgMTEuMTLigJMxNS4yNCB1cy4gT25lIHNlcXVlbmNl
IG9mIGt0aW1lX2dldF9ucygpIHN0YXJ0L2VuZCB0aW1lc3RhbXBzIGluIG5zIHdhcyBCVVNZIDB4
MDEgYXQgMzg4MTAwOTYxMjAvMzg4MTAxMDc4NDAsIFJFQURZIDB4MDAgYXQgMzg4MTAxNTg2NDAv
Mzg4MTAxNzA1MjAsIGFuZCBjb25maXJtYXRpb24gMHgwMCBhdCAzODgxMDE3ODMyMC8zODgxMDE4
OTg0MC4gTG9nZ2luZyBpbiB0aGUgcG9sbCBwYXRoIGFkZHMgbGF0ZW5jeSwgc28gdGhlc2UgaW50
ZXJ2YWxzIGRvIG5vdCByZXByZXNlbnQgdW5pbnN0cnVtZW50ZWQgdGltaW5ncyBvciBleGNsdWRl
IGEgc2hvcnRlciB0cmFuc2llbnQuCgpGb3IgU1BJTkFORF9SRVNFVF9JTklUSUFMX0RFTEFZX1VT
LCBJIG1lYXN1cmVkIHRocmVlIGJvb3RzIGVhY2ggYXQgNSwgOSBhbmQgMjAgdXMuIFRoZSByZXNl
dCB3YWl0IHJldHVybmVkIFJFQURZIDE5LjY44oCTMTkuODAsIDIzLjU24oCTMjQuMTIgYW5kIDEw
NS43NuKAkzM1OC42OCB1cyBhZnRlciB0aGUgcmVzZXQgY29tbWFuZCwgcmVzcGVjdGl2ZWx5OyBh
biBhZGRpdGlvbmFsIHN0YXR1cyByZWFkIHJldHVybmVkIDB4MDAgZWFjaCB0aW1lLiBBdCBib290
LCByZXNldCBydW5zIGJlZm9yZSB0aGUgY2hpcCdzIHF1aXJrIGZsYWcgaXMgYXNzaWduZWQuIHNw
aV9tZW1fcG9sbF9zdGF0dXMoKSB1c2VzIHVkZWxheSgpIGJlbG93IDEwIHVzIGFuZCB1c2xlZXBf
cmFuZ2UoKSBhdCAxMCB1cyBhbmQgYWJvdmUsIGFjY291bnRpbmcgZm9yIHRoZSBsYXJnZXIgYW5k
IG1vcmUgdmFyaWFibGUgMjAgdXMgcmVzdWx0LiBJbmNyZWFzaW5nIHRoZSBSRVNFVCBkZWxheSBj
aGFuZ2VzIHRoaXMgd2FpdCwgYnV0IGRvZXMgbm90IGFkZCBhIHNlY29uZCBzdGF0dXMgc2FtcGxl
IHRvIHRoZSBwYWdlLXJlYWQsIHByb2dyYW0gb3IgZXJhc2Ugd2FpdHMuIFdoZXRoZXIgaXQgYWRk
cmVzc2VzIHRoZSByZXBvcnRlZCBldmVudHMgcmVtYWlucyB1bnZlcmlmaWVkLgoKVGhhbmtzLApW
aXRhbGl5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
