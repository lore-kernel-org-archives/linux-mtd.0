Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69287C61DFD
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 22:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7UZsvjFTNr0jyjf/MlmxIkllzCpKjfhnOiTKeh74img=; b=UO/
	ilr2F1JabK4hZr36YIvtk59zgqoYlLCVLwagVouM5dpma20SGB6LdPP2bNqnCersWmTK6Id/kIWXQ
	2HPHn/SXX7osFjE81K0CxVwHOHvPcLi/2R5qwuM1CINqQ9qCSuL7XUmwDevoCrgYa/3PVFwE/xKX/
	YshNK76sZin8kFWXCPoB/xyURNcoocKB4UCBMSWC4mz4dCxf3WMUhaBeq+BkUdkwSr7PWigpx4o9r
	Hgxs7o2kBkuIn93mOw8tdYeZ5g8g+B6nV+mw+RQJ4jgUD12WnGiw4cpuETgiRtx51mrGptL9D6ee8
	1BPjYvf91HgDvQg00gCsmzQpKgwKzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1A6L-0000000AZPP-0Fgm;
	Mon, 31 Aug 2026 22:03:37 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1A6I-0000000AZP3-1UcH
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 22:03:35 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so432599e87.1
        for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2026 15:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788213811; cv=none;
        d=google.com; s=arc-20260327;
        b=Fm6XFk1fpV68Xbo1/QNGTxzB03Nc1FpX4Er7pZHvF4WEGS+Zyn3uDaKpot/A6TcNfr
         Sw73zXRTrjN3tiwtzzNYY8L9bZw0pe1Ndki1gjODGCJZOBKk3EwkVe8JjkBIDmXm4PBr
         iNeZy3IuebgalCXJDlW81/4mYvcQbo8JIutxLoa6eP2YjoWo1kI/RvzjJeyxK5CC5YtS
         o31T5LYaJIQmiwQqlx99PaGPS5E0M+wPDPHnlBnFOsBkg7B086WkBvYI9iWZljhrOfYW
         4c7Ram7bjyTvI0wqjiTjxqkpSlvvpsdRZsu3Y5xZfYCH5sazmAz4fGe85q2V0tD7s7ki
         J6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=1b5E+SqFrK65m1AP3EJh+uCrb1XnomiFEEeKl3UH0rA=;
        fh=YgdBs7Gv8tgWMYPE88pQEl5IFeTKLrUiXEK4sin15XI=;
        b=KwWVL2FRS7qtze7w8Vuz2QSl4svIyqCQAMLCRzhMBhdaoy/5q1Nk7MLiNAQmfeaUaU
         94XzxE8k7xyAF5VwxpPYuz4hpMUltdIjyWv6GkXpfgfNYLCcHuftLwX65pF5yUBdS+l5
         kLPi3G5R1tG0DpzLN9cSxYpsE99P4Zjo5WbssPQM8jTBPnh43KeCzQwceXkMvQIgKgY4
         SMRF5IeJN8y7fseaz69S7J6nOPWcqUG+zVpi1zPbwIRSGOCuVjeCm/cvBwj3E/oq/vep
         IGDG7DxeSxVcxS/uvNOReFyr0sIl1jNmObJ2lbQdcOP4oaO1G0E3vhQ11vptkJjlMo4D
         PaBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213811; x=1788818611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b5E+SqFrK65m1AP3EJh+uCrb1XnomiFEEeKl3UH0rA=;
        b=E5oLYjjzgsVF3kI1IRTfUEyHaDsCr0GvZ1Gd0vVwRC92L/YVq+dD1JRJq0FhhZbDwz
         Fe04iU/1cuor7CCSLf2sJzz5OopFDbCijbGZUpgDK9XnuTmcj5GTKU9Ibek9aswH+wi0
         TaYbhnJ6qV3XfJoLyOHnOOxL6TqUDZcNwvjpm5A5L/1iDqQrpckUEuTmWxJ05RuKLa03
         h8QmrxanJXaabQCrxZSejNLfGvgOwEQOhloWcBSaI+/UvEYLt1IDD9ecLaZmYIodz18a
         tHLbQVaCMK5qgJ25Ol5F9rZT5EPCRDWp51Gw5yDRJDdaO58OgvoKgF/BHoAoIhvd4YOT
         IPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213811; x=1788818611;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1b5E+SqFrK65m1AP3EJh+uCrb1XnomiFEEeKl3UH0rA=;
        b=nxduMrLJ0r82C+WzV+7o7fl2fgi3Y6EhuwSFZ0FyDjkl2YwLi4U7MXvFKBaqxIUNM1
         Ee0a4lZOK/YHenXquS7sK7/J0HUAu7rtVXFpAfZUeAfYU2/NIt3OWwu7MBx+nJ4i5yOW
         KOnrhnVPpj2MXw+yXe9HFGiyXhu1vM74YdC9Njfy3im3SM5twpVGiDEiQMyK+xXPILmn
         CQdztf8NFKyBxjZO/3oT6YmvpU6sy3Ret3RPgX1FNdXrzsRVmeMG2cRI8izcc0Qzf3I0
         vmHJuoctJRpXRuzbyK2Ev3cpoKSBdlmN0bbtaF5YCbzWO2PNpi+knQ/ECEoqWtIDSHIo
         nQ8g==
X-Gm-Message-State: AFuF++k5Dce1BDRQai+nTV21mZR4E7uNwLmPSphw2C3ebnnF8exKHLHH
	7pm9xP3wZjMKYeDDn4851rkUB/wgEJUCweaT1cyp2eCoomY4K/dLnaE7i1x8YQXJRM4nWDw5pCb
	s28HO42ens50lg66O3BtBVS+ikH8OiJAhW9y6CkU=
X-Gm-Gg: AYBFou0WeUbleJN6BYbDwtAPO3POb9JrxfaKFG6GDLAZR2LRMmzq4Y8TAig0AYa10Is
	+L/cJvKFn37L/93zWS7xsAXxAL+KSfGITb6SZI+SQ2r4BBjGJjzSyY9ALr5SiP8t7/xszlI2bVW
	nxny0A0JHPSDMsX0LhFoKyskUnMCtfsA+NKDbXtTl+VlXzzM6E9S0SICENd86GmKIwMBFjirqXk
	dpsM7Nmxg3Ee7O1aKkFkya3DMlbNlG/4dX+0hCzu5UWr3P1IqfLCSvEYz3Nt+WeyA4InVF+ExWr
	EA8DuuFaK7Zb3CzYViEg8x3FgUCvac7mpQksqqr+lEiLEfIFskBjhObJqWp6A5uM3MEuh7ZqyPk
	=
X-Received: by 2002:a05:6512:3ba4:b0:5b4:7553:d017 with SMTP id
 2adb3069b0e04-5b5ff4637d0mr299770e87.10.1788213811139; Mon, 31 Aug 2026
 15:03:31 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 1 Sep 2026 00:03:17 +0200
X-Gm-Features: AcwNN1VHb8HrfDt8bEBK_ZIQrTTQlGxp2JbYXmYQlRlghgJcRfA22ueleMme-dw
Message-ID: <CACna6ryrfMcsuYmC4VvJw+6HcueV34_65jEp79FYRagwwP0gSg@mail.gmail.com>
Subject: ONFI parameters parser breaks reading S34ML04G200TF100 data from old kernels
To: MTD Maling List <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_150334_415376_CA8E7DF8 
X-CRM114-Status: UNSURE (   8.03  )
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

SGkhCgpJJ3ZlIEJyb2FkY29tIFNvQyB3aXRoIEJyb2FkY29tIE5BTkQgY29udHJvbGxlciB2Ny4x
LiBJdCBoYXMgTkFORApmbGFzaCBTMzRNTDA0RzIwMFRGMTAwIGF0dGFjaGVkLiBEYXRhc2hlZXQg
Zm9yIFMzNE1MMDRHMiB0aGF0IEkgZm91bmQKY2xhaW1zIHRoYXQgNCBHYml0ICg1MTIgTWlCKSB2
ZXJzaW9uIGhhcyAxMjggQiBzcGFyZSBzcGFjZS4KClUtQm9vdCBhbmQga2VybmVscyA1LjQsIDUu
MTUsIDYuNiBiZWxpZXZlIHRoYXQgYWJvdmUgY2hpcHMgaGFzIDY0IEIgT09COgpDb3VsZCBub3Qg
ZmluZCBhIHZhbGlkIE9ORkkgcGFyYW1ldGVyIHBhZ2UsIHRyeWluZyBiaXQtd2lzZSBtYWpvcml0
eQp0byByZWNvdmVyIGl0Ck9ORkkgcGFyYW1ldGVyIHJlY292ZXJ5IGZhaWxlZCwgYWJvcnRpbmcK
bmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MDEsIENoaXAgSUQ6IDB4ZGMK
bmFuZDogQU1EL1NwYW5zaW9uIE5BTkQgNTEyTWlCIDMsM1YgOC1iaXQKbmFuZDogNTEyIE1pQiwg
U0xDLCBlcmFzZSBzaXplOiAxMjggS2lCLCBwYWdlIHNpemU6IDIwNDgsIE9PQiBzaXplOiA2NAoK
S2VybmVsIDYuMTIgaG93ZXZlciBkb2Vzbid0IGVyciBhYm91dCBPTkZJIGFuZCBkZXRlY3RzIDEy
OCBNIE9PQjoKbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MDEsIENoaXAg
SUQ6IDB4ZGMKbmFuZDogQU1EL1NwYW5zaW9uIFMzNE1MMDRHMgpuYW5kOiA1MTIgTWlCLCBTTEMs
IGVyYXNlIHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpemU6IDEyOAp3aGlj
aCByZXN1bHRzIGluOgpbICAgIDAuNzcyMDAyXSBiY21iY2FfbmFuZCBmZjgwMTgwMC5uYW5kLWNv
bnRyb2xsZXI6IHVuY29ycmVjdGFibGUKZXJyb3IgYXQgMHgyMDAKWyAgICAwLjc4MDMzOV0gYmNt
YmNhX25hbmQgZmY4MDE4MDAubmFuZC1jb250cm9sbGVyOiB1bmNvcnJlY3RhYmxlCmVycm9yIGF0
IDB4YTAwClsgICAgMC43ODg2ODBdIGJjbWJjYV9uYW5kIGZmODAxODAwLm5hbmQtY29udHJvbGxl
cjogdW5jb3JyZWN0YWJsZQplcnJvciBhdCAweDFmODAwClsgICAgMC43OTcyMDFdIGJjbWJjYV9u
YW5kIGZmODAxODAwLm5hbmQtY29udHJvbGxlcjogdW5jb3JyZWN0YWJsZQplcnJvciBhdCAweDIw
MDAwCgpJIGd1ZXNzIG5ld2VyIGtlcm5lbHMgZG8gdGhlIHJpZ2h0IGRpc2NvdmVyeSB0aGluZyBi
dXQgYXQgdGhlIHNhbWUKdGltZSB0aGV5IGRvbid0IHdvcmsgd2l0aCBkYXRhIHdyaXR0ZW4gYnkg
VS1Cb290IG9yIG9sZGVyIGtlcm5lbHMuCgpJJ20gd29uZGVyaW5nIGlmIHRoZXJlIGlzIHNvbWUg
c2FuZSB3YXkgdG8gZGVhbCB3aXRoIHRoaXM/IEFzc3VtaW5nCnRoZXJlIGFyZSBkZXZpY2VzIGlu
IHByb2R1Y3Rpb24gd2l0aCBkYXRhIHdyaXR0ZW4gd2l0aCBvbGQgVS1Cb290IGFuZApMaW51eCBr
ZXJuZWxzPwoKLS0gClJhZmHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
