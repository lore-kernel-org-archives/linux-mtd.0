Return-Path: <SRS0=p/wV=5W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37E1C2BA1E
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 12:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE29215A4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 12:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bVvt1cxN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwQ7UE3u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AE29215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bVZE+QHn4eK7MYOmPDJogbaHK7gq9eWz+AKEJsCrLKk=; b=bVvt1cxNbbmh+TDBgd6VOoo9c
	1D2izjfP+toqjWcx68DGRFxWC8N0wwD956nu34ZJOgDUq1KXouwOj8uNh9F60AZrxaMf3a88KIP0q
	kiRiJa/cjFRkcWrtdzXqnTyH/iShNwYIGcvF/5ambSPHcFznTDYPAgUnTEFSMTEBXgd5Mi9I2/+dx
	ao6a3nJoy/fwA3+D6CivpWT6eYHYq/0jC4v48zRwUujA6Sjl9TG+yXzi4uOZtAXedqP316FApsDj0
	KF0MW38Q5gK6YpRjJWEglGHI0ZaOxmHEcUmfIX32mqcS8g3HbFICsD02hTi3vJfadhm5TXpBXcYHT
	JW27CmySQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLQnK-0002l5-KZ; Mon, 06 Apr 2020 12:24:02 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLQnF-0002kU-NP
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2020 12:23:59 +0000
Received: by mail-qt1-x843.google.com with SMTP id y25so12574367qtv.7
 for <linux-mtd@lists.infradead.org>; Mon, 06 Apr 2020 05:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/1a6IzRWH3Bp68ngpAFzn1GZxWmPuagYB/FM5XN8n8=;
 b=RwQ7UE3uKijyujaf1aHIBMT9zcsnYDp3aFA5Ilz4KH5WRW+qe8Ultq3NBcpANjyMar
 UDafw0FlEdplC8iUOPgTXtYLCik3h7K+bVBWQowgWX8f4JTQzmwFoBEYpdomU4L7t4+M
 AearwnEsHnUsZ46nh6PIcToTgzMXLgW+hd8smlk6ds7seRIqW25N7AGMC1RQrGLKj9ZN
 a3mkeLR+XyA9A4bKRSxLQLe+lOJmZAlqXBU4gMqyh698hlizcJUV+Z9ucEq1Pofc9OL0
 YTjILpiwYcEJvDRLALWkryL2XOTCZ3Ruae/FyEvvfKTW2FvSiD8uC/5CNwDIO5inafDT
 1sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/1a6IzRWH3Bp68ngpAFzn1GZxWmPuagYB/FM5XN8n8=;
 b=Xh6CiO80L20yWb/4V8+GaP7Xc/gz4fdYOC88PPi+PCypqZcGz2BwxQwUdsbyAUfDLO
 +PpEN3IDB9QZ0Njxw6kwbm6H9DR1B5NxNHbZWZjZelS7e74vzY6M26+rjx0LX5rvo/JB
 grh7uSbQfaS+krkpduTCCDstSUCB1lGgNrK4Zii5hCoYgr6/sgLhBDFCIFaepYTnx6oe
 RdpNyKef3KscvU7nfVY6TPVJy/VxkDgpgdajlWIKcmLinb6jHqvr/01sWquQDDbLJzil
 1M/NJf8tXwGLNXWED9dDAS/33YJXs8rMIFyOYioj8lsYUL1xnn9Ms6BQClVJlJxm9MVi
 7iRg==
X-Gm-Message-State: AGi0PubOnwQaSc5CrtaxChwAggvIREzThOjwm529mRShzlS0jwoMk1oj
 jt6GOq1MNWh5usln7IxzUgmVoRmU8BA+zgYO5sE=
X-Google-Smtp-Source: APiQypLzs60Chii58DCEWwOXFmsiFc2iWi42Ai0IK4/jCiWYM1+2tzvL5fYGv+a12HFPLgrHONMbwMT0vD5mRmG/qCo=
X-Received: by 2002:ac8:6051:: with SMTP id k17mr20812938qtm.163.1586175836291; 
 Mon, 06 Apr 2020 05:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200404125845.1381080-1-gch981213@gmail.com>
 <CAJsYDVLA3fgjBGdStkiZeqEv8q2j2sUdDzgj3QdahB=tvyYJWg@mail.gmail.com>
In-Reply-To: <CAJsYDVLA3fgjBGdStkiZeqEv8q2j2sUdDzgj3QdahB=tvyYJWg@mail.gmail.com>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 6 Apr 2020 14:23:44 +0200
Message-ID: <CAOX2RU7ZU0Jj71YCAoP=qaqUomaHKTi=XMV8wGvwRg_fYpfoMg@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: spi-nor: Add 4B_OPCODES flag to w25q256"
To: Chuanhong Guo <gch981213@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000004629d405a29e57db"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_052357_763383_4B3FF08D 
X-CRM114-Status: GOOD (  25.04  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--0000000000004629d405a29e57db
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Apr 2020 at 07:18, Chuanhong Guo <gch981213@gmail.com> wrote:
>
> Hi Robert!
>
> On Sat, Apr 4, 2020 at 9:01 PM Chuanhong Guo <gch981213@gmail.com> wrote:
> > "line over 80 characters" warning produced by checkpatch.pl isn't
> > fixed because I think a revert commit should bring a file back to
> > what it was before.
> > I don't have a w25q256jv available and can't compare SFDP table
> > to create a fix similar to mx25l25635 one.
>
> I just tried and unable to dump SFDP on my W25Q256FV,
> probably because my chip is too old to have one.
> Could you check if your W25Q256JV has this and dump it?
> Just add some prints in spi_nor_read_sfdp.
> If a 4-byte address instruction table is present, current kernel
> should be able to discover 4B_OPCODES support automatically.
> Even if that's not the case we may still be able to distinguish
> W25Q256FV and W25Q256JV using SFDP table.

It appears that W25Q256JV has an SFDP table and in it advertises 3B or 4B modes.
>
> [    1.957903] spi_qup 78b5000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
> [    1.962185] SFDP advertises 3B or 4B
> [    1.977393] spi-nor spi0.0: w25q256 (32768 Kbytes)
>
I have used the attached patch to check what does the SFDP DWORD 1 advertises.
If FV version has or does not advertise 4B support than that can be
used to differentiate them.
Can you apply this patch and check what the FV version advertises as I
don't have a device using that revision.
FV version also should have SFDP as datasheet for it clearly advertises is.

Best regards
Robert
>
> --
> Regards,
> Chuanhong Guo

--0000000000004629d405a29e57db
Content-Type: text/x-patch; charset="US-ASCII"; name="999-spi-nor-w25q256-sfdp.patch"
Content-Disposition: attachment; filename="999-spi-nor-w25q256-sfdp.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8og0x190>
X-Attachment-Id: f_k8og0x190

RnJvbSBiMjk5MmI4ZWM2MDdkYzY3MDRlYjliOGRhOWE5Mzc4OTRhNDA2ZDg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb2JlcnQgTWFya28gPHJvYmVydC5tYXJrb0BzYXJ0dXJhLmhy
PgpEYXRlOiBNb24sIDYgQXByIDIwMjAgMTM6NTI6MDcgKzAyMDAKU3ViamVjdDogW1BBVENIXSBz
cGktbm9yOiB3MjVxMjU2IHNmZHAKClNpZ25lZC1vZmYtYnk6IFJvYmVydCBNYXJrbyA8cm9iZXJ0
Lm1hcmtvQHNhcnR1cmEuaHI+Ci0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAz
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDM2
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9z
cGktbm9yL3NwaS1ub3IuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCmluZGV4IGY0
MTdmYjY4MGNkOC4uMDlhNGE4YmNlMDdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9y
L3NwaS1ub3IuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwpAQCAtMjE0Myw2
ICsyMTQzLDQwIEBAIHN0YXRpYyBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgZ2QyNXEyNTZfZml4dXBz
ID0gewogCS5kZWZhdWx0X2luaXQgPSBnZDI1cTI1Nl9kZWZhdWx0X2luaXQsCiB9OwogCitzdGF0
aWMgaW50Cit3MjVxMjU2X3Bvc3RfYmZwdF9maXh1cHMoc3RydWN0IHNwaV9ub3IgKm5vciwKKwkJ
CSAgICBjb25zdCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwKKwkJ
CSAgICBjb25zdCBzdHJ1Y3Qgc2ZkcF9iZnB0ICpiZnB0LAorCQkJICAgIHN0cnVjdCBzcGlfbm9y
X2ZsYXNoX3BhcmFtZXRlciAqcGFyYW1zKQoreworCS8qCisJICogVzI1UTI1NkpWIGZ1bGx5IHN1
cHBvcnRzIDRCIG9wY29kZXMgYnV0IFcyNVEyNTZGViA0QiBwYWdlIHByb2dyYW0KKwkgKiBpbnN0
cnVjdGlvbiwgY2F1c2luZyB0aGUgZW50aXJlIGZsYXNoIHRvIGJlIHJlYWQtb25seS4KKwkgKiBV
bmZvcnR1bmF0ZWx5LCBXaW5ib25kIGhhcyByZS11c2VkIHRoZSBzYW1lIEpFREVDIElEIGZvciBi
b3RoCisJICogdmFyaWFudHMgd2hpY2ggcHJldmVudHMgdXMgZnJvbSBkZWZpbmluZyBhIG5ldyBl
bnRyeSBpbiB0aGUgcGFydHMKKwkgKiB0YWJsZS4KKwkgKiBXZSBuZWVkIGEgd2F5IHRvIGRpZmZl
cmVudGlhdGUgVzI1UTI1NkpWIGFuZCBXMjVRMjU2RlYuCisJICovCisKKwlpZiAoKGJmcHQtPmR3
b3Jkc1tCRlBUX0RXT1JEKDEpXSAmIEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfTUFTSykgPT0K
KwkJQkZQVF9EV09SRDFfQUREUkVTU19CWVRFU18zX09OTFkpCisJCXByX3dhcm4oIlNGRFAgYWR2
ZXJ0aXNlcyAzQiBvbmx5XG4iKTsKKworCWlmICgoYmZwdC0+ZHdvcmRzW0JGUFRfRFdPUkQoMSld
ICYgQkZQVF9EV09SRDFfQUREUkVTU19CWVRFU19NQVNLKSA9PQorCQlCRlBUX0RXT1JEMV9BRERS
RVNTX0JZVEVTXzNfT1JfNCkKKwkJcHJfd2FybigiU0ZEUCBhZHZlcnRpc2VzIDNCIG9yIDRCXG4i
KTsKKworCWlmICgoYmZwdC0+ZHdvcmRzW0JGUFRfRFdPUkQoMSldICYgQkZQVF9EV09SRDFfQURE
UkVTU19CWVRFU19NQVNLKSA9PQorCQlCRlBUX0RXT1JEMV9BRERSRVNTX0JZVEVTXzRfT05MWSkK
KwkJcHJfd2FybigiU0ZEUCBhZHZlcnRpc2VzIDRCIG9ubHlcbiIpOworCisJcmV0dXJuIDA7Cit9
CisKK3N0YXRpYyBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgdzI1cTI1Nl9maXh1cHMgPSB7CisJLnBv
c3RfYmZwdCA9IHcyNXEyNTZfcG9zdF9iZnB0X2ZpeHVwcywKK307CisKIC8qIE5PVEU6IGRvdWJs
ZSBjaGVjayBjb21tYW5kIHNldHMgYW5kIG1lbW9yeSBvcmdhbml6YXRpb24gd2hlbiB5b3UgYWRk
CiAgKiBtb3JlIG5vciBjaGlwcy4gIFRoaXMgY3VycmVudCBsaXN0IGZvY3Vzc2VzIG9uIG5ld2Vy
IGNoaXBzLCB3aGljaAogICogaGF2ZSBiZWVuIGNvbnZlcmdpbmcgb24gY29tbWFuZCBzZXRzIHdo
aWNoIGluY2x1ZGluZyBKRURFQyBJRC4KQEAgLTI0ODAsNyArMjUxNCw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlfbm9yX2lkc1tdID0gewogCXsgIncyNXE4MCIsIElORk8o
MHhlZjUwMTQsIDAsIDY0ICogMTAyNCwgIDE2LCBTRUNUXzRLKSB9LAogCXsgIncyNXE4MGJsIiwg
SU5GTygweGVmNDAxNCwgMCwgNjQgKiAxMDI0LCAgMTYsIFNFQ1RfNEspIH0sCiAJeyAidzI1cTEy
OCIsIElORk8oMHhlZjQwMTgsIDAsIDY0ICogMTAyNCwgMjU2LCBTRUNUXzRLKSB9LAotCXsgIncy
NXEyNTYiLCBJTkZPKDB4ZWY0MDE5LCAwLCA2NCAqIDEwMjQsIDUxMiwgU0VDVF80SyB8IFNQSV9O
T1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sCisJeyAidzI1cTI1NiIsIElORk8o
MHhlZjQwMTksIDAsIDY0ICogMTAyNCwgNTEyLCBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQg
fCBTUElfTk9SX1FVQURfUkVBRCkKKwkJCQkuZml4dXBzID0gJncyNXEyNTZfZml4dXBzLCB9LAog
CXsgIncyNXEyNTZqdm0iLCBJTkZPKDB4ZWY3MDE5LCAwLCA2NCAqIDEwMjQsIDUxMiwKIAkJCSAg
ICAgU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0sCiAJ
eyAidzI1bTUxMmp2IiwgSU5GTygweGVmNzExOSwgMCwgNjQgKiAxMDI0LCAxMDI0LAotLSAKMi4y
Ni4wCgo=
--0000000000004629d405a29e57db
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--0000000000004629d405a29e57db--

