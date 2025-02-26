Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26DCC021BE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 01:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wu4ckGduncoUeoQpj07/DSyzwxQbL5f+iyZ1gSQ2vU=; b=RkEM/CS9hRlMRU
	QzkWujVmsyzbTmfaenCLLGlcQMdrMRPOcceKWSDGImqs20Nfcm6lDobz5DlbpQxGeRch5TdHZxShR
	nbgLnvDmylJSQ/0sgBecV3VyNPBzSeHg5MQGLOq2mZJmSr6xN/7+JVzP/3o2QFbCKiwyKO2N+HGx7
	AMC5Bdhnd7/TTdDd0aE1rmjOqWqefpb2dQbv25oNrmPkNaCQl+di+2/vlsSg0207kT3PF6ok77SYS
	LXi0/PAyuwSfZRU42S2uHJGFzbuVE4uoT/kvy7F7IIvrESgOqNAubRH5ZRZEL6HrUViM+PU1iQG1R
	9q4XNWZq47X5qFJxyOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6Ls-000000021gx-0X7D;
	Wed, 26 Feb 2025 01:36:44 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6Lp-000000021gZ-21cO
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 01:36:42 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51Q1ZSdu1502812
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 25 Feb 2025 17:35:29 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51Q1ZSdu1502812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1740533740;
	bh=T0pKCclIvHKyDRUHCJs7P4mfoEs4SIcJGp6SSmwXCZc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DSr0p5U6PuFacB2sJlJBShpK+caegDMEmn8OYplTp/ukKNtEFfrkn97ga+OT2dXpz
	 K/n5OJZ9p7wF026A4N5Ms8I4Ha7wXxIE31o+eevCv66LWleUk5egaKa/T1wzR+OiP5
	 pBftNRMbRUke7ubIKWI6Trw88YIoPJ//UlgWSqbBalJrMQ6XLeWdsBqjIBFJ2BqBTU
	 NxN3soIqU4psmCdpeI68cUVCZ/T8YSni/GX+FUYtyTt8DqQzRz5FBJx8rRSkQsq+0n
	 LFOV9xO0DwzRQLOdgcR413cBdNqea/GHzmtBr2NpUvBJ8KgVfK7MCUU4fZDlrEdXny
	 PWA/+ls6AlysA==
Date: Tue, 25 Feb 2025 17:35:26 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
        akpm@linux-foundation.org, alistair@popple.id.au,
        andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
        arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
        bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
        brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
        davem@davemloft.net, david.laight.linux@gmail.com,
        dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
        eajames@linux.ibm.com, edumazet@google.com, eleanor15x@gmail.com,
        gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
        jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
        joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
        jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux@rasmusvillemoes.dk, louis.peens@corigine.com,
        maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
        mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
        neil.armstrong@linaro.org, netdev@vger.kernel.org,
        oss-drivers@corigine.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
        simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de,
        vigneshr@ti.com, visitorckw@gmail.com, x86@kernel.org,
        yury.norov@gmail.com
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
User-Agent: K-9 Mail for Android
In-Reply-To: <8052b316-9f72-42c7-9e11-e23e690d80c4@citrix.com>
References: <3BC57C78-1DFF-4B83-85AA-A908DBF2B958@zytor.com> <8052b316-9f72-42c7-9e11-e23e690d80c4@citrix.com>
Message-ID: <4259A207-7B5F-4D25-A8AE-144D24554201@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_173641_628650_BB52D375 
X-CRM114-Status: UNSURE (   6.43  )
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

T24gRmVicnVhcnkgMjUsIDIwMjUgMTo0MzoyNyBQTSBQU1QsIEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBJbmNpZGVudGFsbHksIGluIGFsbCBvZiB0
aGlzLCBkaWRuJ3QgYW55b25lIG5vdGljZSBfX2J1aWx0aW5fcGFyaXR5KCk/Cj4KPlllcy7CoCBJ
dCBpdCBoYXMgZG9uZSBzYW5lIGZvciBhIGRlY2FkZSBvbiB4ODYsIHlldCBkb2VzIHRoaW5ncyBz
dWNoIGFzCj5lbWl0dGluZyBhIGxpYnJhcnkgY2FsbCBvbiBvdGhlciBhcmNoaXRlY3R1cmVzLgo+
Cj5odHRwczovL2dvZGJvbHQub3JnL3ovNnFHM25vZWJxCj4KPn5BbmRyZXcKCkFuZCBub3QgZXZl
biBhIHNtYXJ0IG9uZSBhdCB0aGF0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
