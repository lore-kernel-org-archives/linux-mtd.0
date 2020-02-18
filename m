Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D1DC34034
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 05:57:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8386206EF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 05:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Erav01Du";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="R95m0+bh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8386206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KqOwhchTPVlYKq9gB5CS25qUdNdWdCAmQCv6DxtihSk=; b=Erav01DuPPTKohXJO9iF1lrnv
	5Sm7XMXRwnhKRU0PlSP78nku1zboftAI/JpOOeUPrRDQLvCdrGOPij4g0fgLie7qOyS3l1Y7JgF/+
	1R9l+Th4U3hit/NHFZmPyHnC/bvHMCpnJCkR8DIEiQMQ2BorBwuS78vMPsp8QV3Iy0uCxzKO066rI
	cap/EOmgjSCcn9RQ7I5YXUWeItrdmZpOleFpfV/n5y7zZEt14sRgXZEz9DOHJWYy83OGuD40F5YoR
	cesOKoBlMZjPQOFI6NKV0PrJurmUCBjGxFkFPEVgcIXWPOQFpLVw6fLmsL8j1WQ9HFvSS5A2T2/WG
	sL6Bkq/eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3vsS-0002II-Vd; Tue, 18 Feb 2020 05:57:00 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3vsO-0002Hc-NV
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 05:56:59 +0000
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 01I5uUtS029292
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2020 14:56:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01I5uUtS029292
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1582005391;
 bh=0jg+JUqFPfECJkWMW8DJ17r+9GWpEezhvx3gadP7krE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R95m0+bhwzPF8uHtTD923VrCaVA1I9JcXMm4YGNX9EKBUNbOERg2k2+9BCLKRLPgA
 DtW3qW2xzJsCIfYIAYFXzgupHiahAaw5TlVqmViYqcldc7Zg+NThGNke7+W6jklDWA
 D5PRMwrHsUJ3akJTeLDgP1hIi5CUQDjz+9WeHZzLghHB/vwU8R4cCVlcdytAB1fJYy
 TV6KGhRgTxCIVU5AYhoKe8iEtP6Ki6ZmKdmAfPSvmMKC51kh5g0NCUrGWoOeRRzCb/
 Hg80gW99behuwfaRmqOwQ64cq6GoS3p1J177GShxw43Fdtdxh3KKDtIN2RnaMRK8rn
 7Wu8jWeBnMf3A==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id l6so7016967uap.13
 for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2020 21:56:30 -0800 (PST)
X-Gm-Message-State: APjAAAXPdmO0g7vFVzIvVJr6OdQB07q56jZPfpOHLOGRzCNk0nKnDqsK
 PFsBhJniXgy+wI1K6JGLJqRaZxRhY7L4kL0jOl8=
X-Google-Smtp-Source: APXvYqxcZLvtGx99uEYsyYStXlnPfN2DK0H+xs+p5mfT31pSqnhePmKVyN83CeGAClSs2ASQFh/r1eV2GsLaI9Zqq0I=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr9714880uay.25.1582005389648;
 Mon, 17 Feb 2020 21:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de> <20200205105045.6877aca6@xps13>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
 <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
 <20200211170707.2183625e@xps13> <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
 <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
 <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
 <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
In-Reply-To: <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 18 Feb 2020 14:55:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
Message-ID: <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get ->setup_data_interface()
 working again"
To: Marek Vasut <marex@denx.de>
Content-Type: multipart/mixed; boundary="000000000000487ce7059ed355ee"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_215657_101446_4036D4A9 
X-CRM114-Status: GOOD (  31.50  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Tim Sander <tim@krieglstein.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--000000000000487ce7059ed355ee
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, Feb 17, 2020 at 5:33 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi,
>
>
>
> On Thu, Feb 13, 2020 at 2:45 AM Marek Vasut <marex@denx.de> wrote:
> >
> > On 2/12/20 5:56 PM, Masahiro Yamada wrote:
> > > Hi.
> >
> > Hi,
> >
> > [...]
> >
> > >>>>>>>>>>> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
> > >>>>>>>>>>> hence the driver sets NAND_KEEP_TIMINGS flag.
> > >>>
> > >>>
> > >>> Interesting.
> > >>> I have never seen such clock rates before.
> > >>>
> > >>>
> > >>> For all known upstream platforms
> > >>> (Altera SOCFPGA, Socionext UniPhier, Intel MRST),
> > >>> the NAND controller core clock is 50 MHz,
> > >>> the NAND bus clock is 200MHz.
> > >>
> > >> You can configure whatever rate you want in the QSys HPS component.
> > >
> > > OK.
> > >
> > > The SOCFPGA maintainer, Dinh Nguyen, said this:
> > > "From the clock controller, it provides a single 200MHz clock to the NAND
> > > IP. Inside the NAND IP, there is a /4 for the clk. The 200MHz clock is
> > > used for the clk_x and ecc_clk."
> >
> > That sounds like some root clock. You can read the entire documentation
> > for the SoCFPGA CV/AV here:
> > http://www.altera.com/literature/hb/cyclone-v/cv_5v4.pdf
> > See section 3 , look for 'nand' there. Note that NAND can be supplied
> > from at least two different PLLs -- main and peripheral.
> >
> > > http://lists.infradead.org/pipermail/linux-arm-kernel/2018-July/592702.html
> > >
> > >
> > >
> > > Maybe, you are using a brand-new,
> > > different type of SOCFPGA?
> >
> > Cyclone V and Arria V , so no.
> >
> > >>> What would happen if you hard-code:
> > >>> denali->clk_rate = 50000000;
> > >>> denali->clk_x_rate = 200000000;
> > >>
> > >> It will not work, because the IP would be using incorrect clock.
> > >
> > > I wanted to see the past tense here instead of
> > > future tense + subjunctive mood.
> > >
> > > I wanted you to try it.
> > >
> > >
> > >
> > >>
> > >>> like I had already suggested to Tim Sander:
> > >>> https://lore.kernel.org/lkml/CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com/
> > >>>
> > >>> Unfortunately, he did not want to do it, but
> > >>> I am still interested in this experiment because
> > >>> I suspect this might be a bug of drivers/clk/socfpga/.
> > >>
> > >> No, this is a feature of the platform, you can configure any clock you
> > >> want pretty much.
> > >
> > >
> > > OK, but if you agree the 4.19.10 is working,
> > >
> > > denali->clk_rate = 50000000; denali->clk_x_rate = 200000000;
> > >
> > > is worth trying.
> >
> > Why would misconfiguring the IP be worth trying ?
>
>
>
> There is no change around the ->setup_data_interface() hook
> after v4.19
> The only difference I could think of is the clock frequency.
>
> But, it is OK if you do not want to test it.
>
> And you are confident.
>
> So, let's suspect the ->setup_data_interface() hook.
>
>
> If possible, can you provide the dump of
> the attached debug code?
>


I attached two experimental patches.

I cannot test them because
the mainline code works fine for my boards.

Does either of them improve something
on your settings?


-- 
Best Regards
Masahiro Yamada

--000000000000487ce7059ed355ee
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-denali-more-complicated-calculation-for-timings.patch"
Content-Disposition: attachment; 
	filename="0001-denali-more-complicated-calculation-for-timings.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k6rh0rmq0>
X-Attachment-Id: f_k6rh0rmq0

RnJvbSA0MmMzZGMzYTNlNzkzNjViNmZiNDY3ZWRiZDQ5NjMwZTY5N2ZmZmM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Np
b25leHQuY29tPgpEYXRlOiBNb24sIDE3IEZlYiAyMDIwIDIxOjE2OjMzICswOTAwClN1YmplY3Q6
IFtQQVRDSF0gZGVuYWxpOiBtb3JlIGNvbXBsaWNhdGVkIGNhbGN1bGF0aW9uIGZvciB0aW1pbmdz
CgpTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25l
eHQuY29tPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jIHwgNjQgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9k
ZW5hbGkuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jCmluZGV4IGZhZmQwYTBhYThl
Mi4uYTE2YjJmMWY1MGI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGku
YworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYwpAQCAtNzk2LDE1ICs3OTYsNiBA
QCBzdGF0aWMgaW50IGRlbmFsaV9zZXR1cF9kYXRhX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCBpbnQgY2hpcG5yLAogCiAJc2VsID0gJnRvX2RlbmFsaV9jaGlwKGNoaXApLT5zZWxz
W2NoaXBucl07CiAKLQkvKiB0UkVBIC0+IEFDQ19DTEtTICovCi0JYWNjX2Nsa3MgPSBESVZfUk9V
TkRfVVAodGltaW5ncy0+dFJFQV9tYXgsIHRfeCk7Ci0JYWNjX2Nsa3MgPSBtaW5fdChpbnQsIGFj
Y19jbGtzLCBBQ0NfQ0xLU19fVkFMVUUpOwotCi0JdG1wID0gaW9yZWFkMzIoZGVuYWxpLT5yZWcg
KyBBQ0NfQ0xLUyk7Ci0JdG1wICY9IH5BQ0NfQ0xLU19fVkFMVUU7Ci0JdG1wIHw9IEZJRUxEX1BS
RVAoQUNDX0NMS1NfX1ZBTFVFLCBhY2NfY2xrcyk7Ci0Jc2VsLT5hY2NfY2xrcyA9IHRtcDsKLQog
CS8qIHRSV0ggLT4gUkVfMl9XRSAqLwogCXJlXzJfd2UgPSBESVZfUk9VTkRfVVAodGltaW5ncy0+
dFJIV19taW4sIHRfeCk7CiAJcmVfMl93ZSA9IG1pbl90KGludCwgcmVfMl93ZSwgUkVfMl9XRV9f
VkFMVUUpOwpAQCAtODYyLDE0ICs4NTMsMzkgQEAgc3RhdGljIGludCBkZW5hbGlfc2V0dXBfZGF0
YV9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKIAl0bXAgfD0g
RklFTERfUFJFUChSRFdSX0VOX0hJX0NOVF9fVkFMVUUsIHJkd3JfZW5faGkpOwogCXNlbC0+cmR3
cl9lbl9oaV9jbnQgPSB0bXA7CiAKLQkvKiB0UlAsIHRXUCAtPiBSRFdSX0VOX0xPX0NOVCAqLwor
CS8qCisJICogdFJFQSAtPiBBQ0NfQ0xPQ0tTCisJICogdFJQLCB0V1AsIHRSSE9ILCB0UkMsIHRX
QyAtPiBSRFdSX0VOX0xPX0NOVAorCSAqLworCisJLyoKKwkgKiBEZXRlcm1pbmUgdGhlIG1pbmlt
dW0gb2YgYWNjX2Nsa3MgdG8gbWVldCB0aGUgZGF0YSBzZXR1cCB0aW1pbmcuCisJICogKG9uZSBh
ZGRpdGlvbmFsIGNsb2NrIGN5Y2xlIGp1c3QgaW4gY2FzZSkKKwkgKi8KKwlhY2NfY2xrcyA9IERJ
Vl9ST1VORF9VUCh0aW1pbmdzLT50UkVBX21heCwgdF94KSArIDE7CisKKwkvKiBEZXRlcm1pbmUg
dGhlIG1pbmltdW0gb2YgcmR3cl9lbl9sb19jbnQgZnJvbSBSRSMvV0UjIHB1bHNlIHdpZHRoICov
CiAJcmR3cl9lbl9sbyA9IERJVl9ST1VORF9VUChtYXgodGltaW5ncy0+dFJQX21pbiwgdGltaW5n
cy0+dFdQX21pbiksIHRfeCk7CisKKwkvKiBFeHRlbmQgcmR3cl9lbl9sbyB0byBtZWV0IHRoZSBk
YXRhIGhvbGQgdGltaW5nICovCisJcmR3cl9lbl9sbyA9IG1heF90KGludCwgcmR3cl9lbl9sbywg
YWNjX2Nsa3MgLSB0aW1pbmdzLT50UkhPSF9taW4gLyB0X3gpOworCisJLyogRXh0ZW5kIHJkd3Jf
ZW5fbG8gdG8gbWVldCB0aGUgcmVxdWlyZW1lbnQgZm9yIFJFIy9XRSMgY3ljbGUgdGltZSAqLwog
CXJkd3JfZW5fbG9faGkgPSBESVZfUk9VTkRfVVAobWF4KHRpbWluZ3MtPnRSQ19taW4sIHRpbWlu
Z3MtPnRXQ19taW4pLAogCQkJCSAgICAgdF94KTsKLQlyZHdyX2VuX2xvX2hpID0gbWF4X3QoaW50
LCByZHdyX2VuX2xvX2hpLCBtdWx0X3gpOwogCXJkd3JfZW5fbG8gPSBtYXgocmR3cl9lbl9sbywg
cmR3cl9lbl9sb19oaSAtIHJkd3JfZW5faGkpOwogCXJkd3JfZW5fbG8gPSBtaW5fdChpbnQsIHJk
d3JfZW5fbG8sIFJEV1JfRU5fTE9fQ05UX19WQUxVRSk7CiAKKwkvKiBDZW50ZXIgdGhlIGRhdGEg
bGF0Y2ggdGltaW5nIGZvciBleHRyYSBzYWZldHkgKi8KKwlhY2NfY2xrcyA9IChhY2NfY2xrcyAr
IHJkd3JfZW5fbG8gKworCQkgICAgRElWX1JPVU5EX1VQKHRpbWluZ3MtPnRSSE9IX21pbiwgdF94
KSkgLyAyOworCWFjY19jbGtzID0gbWluX3QoaW50LCBhY2NfY2xrcywgQUNDX0NMS1NfX1ZBTFVF
KTsKKworCXRtcCA9IGlvcmVhZDMyKGRlbmFsaS0+cmVnICsgQUNDX0NMS1MpOworCXRtcCAmPSB+
QUNDX0NMS1NfX1ZBTFVFOworCXRtcCB8PSBGSUVMRF9QUkVQKEFDQ19DTEtTX19WQUxVRSwgYWNj
X2Nsa3MpOworCXNlbC0+YWNjX2Nsa3MgPSB0bXA7CisKIAl0bXAgPSBpb3JlYWQzMihkZW5hbGkt
PnJlZyArIFJEV1JfRU5fTE9fQ05UKTsKIAl0bXAgJj0gflJEV1JfRU5fTE9fQ05UX19WQUxVRTsK
IAl0bXAgfD0gRklFTERfUFJFUChSRFdSX0VOX0xPX0NOVF9fVkFMVUUsIHJkd3JfZW5fbG8pOwpA
QCAtODg2LDYgKzkwMiwzMiBAQCBzdGF0aWMgaW50IGRlbmFsaV9zZXR1cF9kYXRhX2ludGVyZmFj
ZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAogCXRtcCB8PSBGSUVMRF9QUkVQ
KENTX1NFVFVQX0NOVF9fVkFMVUUsIGNzX3NldHVwKTsKIAlzZWwtPmNzX3NldHVwX2NudCA9IHRt
cDsKIAorCS8qIGRlYnVnICovCisJcHJpbnRrKCJEZW5hbGk6IGNsa19yYXRlPSVsZCwgY2xrX3hf
cmF0ZT0lbGRcbiIsIGRlbmFsaS0+Y2xrX3JhdGUsIGRlbmFsaS0+Y2xrX3hfcmF0ZSk7CisJcHJp
bnRrKCJEZW5hbGk6IHRSRUE9JWRcbiIsIHRpbWluZ3MtPnRSRUFfbWF4KTsKKwlwcmludGsoIkRl
bmFsaTogdFJIVz0lZFxuIiwgdGltaW5ncy0+dFJIV19taW4pOworCXByaW50aygiRGVuYWxpOiB0
UkhaPSVkXG4iLCB0aW1pbmdzLT50UkhaX21heCk7CisJcHJpbnRrKCJEZW5hbGk6IHRDQ1M9JWRc
biIsIHRpbWluZ3MtPnRDQ1NfbWluKTsKKwlwcmludGsoIkRlbmFsaTogdFdIUj0lZFxuIiwgdGlt
aW5ncy0+dFdIUl9taW4pOworCXByaW50aygiRGVuYWxpOiB0QURMPSVkXG4iLCB0aW1pbmdzLT50
QURMX21pbik7CisJcHJpbnRrKCJEZW5hbGk6IHRSRUg9JWRcbiIsIHRpbWluZ3MtPnRSRUhfbWlu
KTsKKwlwcmludGsoIkRlbmFsaTogdFdIPSVkXG4iLCB0aW1pbmdzLT50V0hfbWluKTsKKwlwcmlu
dGsoIkRlbmFsaTogdFJQPSVkXG4iLCB0aW1pbmdzLT50UlBfbWluKTsKKwlwcmludGsoIkRlbmFs
aTogdFdQPSVkXG4iLCB0aW1pbmdzLT50V1BfbWluKTsKKwlwcmludGsoIkRlbmFsaTogdFJDPSVk
XG4iLCB0aW1pbmdzLT50UkNfbWluKTsKKwlwcmludGsoIkRlbmFsaTogdFdDPSVkXG4iLCB0aW1p
bmdzLT50V0NfbWluKTsKKwlwcmludGsoIkRlbmFsaTogdENTPSVkXG4iLCB0aW1pbmdzLT50Q1Nf
bWluKTsKKwlwcmludGsoIkRlbmFsaTogdENFQT0lZFxuIiwgdGltaW5ncy0+dENFQV9tYXgpOwor
CXByaW50aygiRGVuYWxpOiBhY2NfY2xrcz0lZFxuIiwgYWNjX2Nsa3MpOworCXByaW50aygiRGVu
YWxpOiByZV8yX3dlPSVkXG4iLCByZV8yX3dlKTsKKwlwcmludGsoIkRlbmFsaTogcmVfMl9yZT0l
ZFxuIiwgcmVfMl9yZSk7CisJcHJpbnRrKCJEZW5hbGk6IHdlXzJfcmU9JWRcbiIsIHdlXzJfcmUp
OworCXByaW50aygiRGVuYWxpOiBhZGRyXzJfZGF0YT0lZFxuIiwgYWRkcl8yX2RhdGEpOworCXBy
aW50aygiRGVuYWxpOiByZHdyX2VuX2hpPSVkXG4iLCByZHdyX2VuX2hpKTsKKwlwcmludGsoIkRl
bmFsaTogcmR3cl9lbl9sb19oaT0lZFxuIiwgcmR3cl9lbl9sb19oaSk7CisJcHJpbnRrKCJEZW5h
bGk6IHJkd3JfZW5fbG89JWRcbiIsIHJkd3JfZW5fbG8pOworCXByaW50aygiRGVuYWxpOiBjc19z
ZXR1cD0lZFxuIiwgY3Nfc2V0dXApOworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMTcuMQoK
--000000000000487ce7059ed355ee
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-denali-timing-hack-1.patch"
Content-Disposition: attachment; filename="0001-denali-timing-hack-1.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k6rh0rnq1>
X-Attachment-Id: f_k6rh0rnq1

RnJvbSBmZjhlZmY5NDIwMTdhNThlN2Y0ZGUzNmNiYjcxYjFkZTU5YTFkZmJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Np
b25leHQuY29tPgpEYXRlOiBNb24sIDE3IEZlYiAyMDIwIDIwOjIyOjQ4ICswOTAwClN1YmplY3Q6
IFtQQVRDSF0gZGVuYWxpOiB0aW1pbmcgaGFjayAxCgpJbmNyZWFzZSBzZXR1cCB0aW1lIG9mIGRh
dGEuCihidXQgbWF5IG5vdCBtZWV0IHRoZSBob2xkIHRpbWUgcmVxdWlyZW1lbnQpCgpTaWduZWQt
b2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgot
LS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jIHwgMjggKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2RlbmFsaS5jCmluZGV4IGZhZmQwYTBhYThlMi4uNzYyZmE4YmMzZTRjIDEw
MDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYworKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9kZW5hbGkuYwpAQCAtNzk4LDcgKzc5OCw3IEBAIHN0YXRpYyBpbnQgZGVuYWxp
X3NldHVwX2RhdGFfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBjaGlwbnIs
CiAKIAkvKiB0UkVBIC0+IEFDQ19DTEtTICovCiAJYWNjX2Nsa3MgPSBESVZfUk9VTkRfVVAodGlt
aW5ncy0+dFJFQV9tYXgsIHRfeCk7Ci0JYWNjX2Nsa3MgPSBtaW5fdChpbnQsIGFjY19jbGtzLCBB
Q0NfQ0xLU19fVkFMVUUpOworCWFjY19jbGtzID0gbWluX3QoaW50LCBhY2NfY2xrcywgQUNDX0NM
S1NfX1ZBTFVFKSArIDE7CiAKIAl0bXAgPSBpb3JlYWQzMihkZW5hbGktPnJlZyArIEFDQ19DTEtT
KTsKIAl0bXAgJj0gfkFDQ19DTEtTX19WQUxVRTsKQEAgLTg4Niw2ICs4ODYsMzIgQEAgc3RhdGlj
IGludCBkZW5hbGlfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
aW50IGNoaXBuciwKIAl0bXAgfD0gRklFTERfUFJFUChDU19TRVRVUF9DTlRfX1ZBTFVFLCBjc19z
ZXR1cCk7CiAJc2VsLT5jc19zZXR1cF9jbnQgPSB0bXA7CiAKKwkvKiBkZWJ1ZyAqLworCXByaW50
aygiRGVuYWxpOiBjbGtfcmF0ZT0lbGQsIGNsa194X3JhdGU9JWxkXG4iLCBkZW5hbGktPmNsa19y
YXRlLCBkZW5hbGktPmNsa194X3JhdGUpOworCXByaW50aygiRGVuYWxpOiB0UkVBPSVkXG4iLCB0
aW1pbmdzLT50UkVBX21heCk7CisJcHJpbnRrKCJEZW5hbGk6IHRSSFc9JWRcbiIsIHRpbWluZ3Mt
PnRSSFdfbWluKTsKKwlwcmludGsoIkRlbmFsaTogdFJIWj0lZFxuIiwgdGltaW5ncy0+dFJIWl9t
YXgpOworCXByaW50aygiRGVuYWxpOiB0Q0NTPSVkXG4iLCB0aW1pbmdzLT50Q0NTX21pbik7CisJ
cHJpbnRrKCJEZW5hbGk6IHRXSFI9JWRcbiIsIHRpbWluZ3MtPnRXSFJfbWluKTsKKwlwcmludGso
IkRlbmFsaTogdEFETD0lZFxuIiwgdGltaW5ncy0+dEFETF9taW4pOworCXByaW50aygiRGVuYWxp
OiB0UkVIPSVkXG4iLCB0aW1pbmdzLT50UkVIX21pbik7CisJcHJpbnRrKCJEZW5hbGk6IHRXSD0l
ZFxuIiwgdGltaW5ncy0+dFdIX21pbik7CisJcHJpbnRrKCJEZW5hbGk6IHRSUD0lZFxuIiwgdGlt
aW5ncy0+dFJQX21pbik7CisJcHJpbnRrKCJEZW5hbGk6IHRXUD0lZFxuIiwgdGltaW5ncy0+dFdQ
X21pbik7CisJcHJpbnRrKCJEZW5hbGk6IHRSQz0lZFxuIiwgdGltaW5ncy0+dFJDX21pbik7CisJ
cHJpbnRrKCJEZW5hbGk6IHRXQz0lZFxuIiwgdGltaW5ncy0+dFdDX21pbik7CisJcHJpbnRrKCJE
ZW5hbGk6IHRDUz0lZFxuIiwgdGltaW5ncy0+dENTX21pbik7CisJcHJpbnRrKCJEZW5hbGk6IHRD
RUE9JWRcbiIsIHRpbWluZ3MtPnRDRUFfbWF4KTsKKwlwcmludGsoIkRlbmFsaTogYWNjX2Nsa3M9
JWRcbiIsIGFjY19jbGtzKTsKKwlwcmludGsoIkRlbmFsaTogcmVfMl93ZT0lZFxuIiwgcmVfMl93
ZSk7CisJcHJpbnRrKCJEZW5hbGk6IHJlXzJfcmU9JWRcbiIsIHJlXzJfcmUpOworCXByaW50aygi
RGVuYWxpOiB3ZV8yX3JlPSVkXG4iLCB3ZV8yX3JlKTsKKwlwcmludGsoIkRlbmFsaTogYWRkcl8y
X2RhdGE9JWRcbiIsIGFkZHJfMl9kYXRhKTsKKwlwcmludGsoIkRlbmFsaTogcmR3cl9lbl9oaT0l
ZFxuIiwgcmR3cl9lbl9oaSk7CisJcHJpbnRrKCJEZW5hbGk6IHJkd3JfZW5fbG9faGk9JWRcbiIs
IHJkd3JfZW5fbG9faGkpOworCXByaW50aygiRGVuYWxpOiByZHdyX2VuX2xvPSVkXG4iLCByZHdy
X2VuX2xvKTsKKwlwcmludGsoIkRlbmFsaTogY3Nfc2V0dXA9JWRcbiIsIGNzX3NldHVwKTsKKwog
CXJldHVybiAwOwogfQogCi0tIAoyLjE3LjEKCg==
--000000000000487ce7059ed355ee
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--000000000000487ce7059ed355ee--

