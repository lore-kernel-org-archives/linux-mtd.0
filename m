Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30251C7619D
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 08:34:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0291A20725
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 08:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q6P3A0kZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="SfXiTkBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0291A20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dRabb3zbb6+GWCnDudDVN+7fJXDOLKAk8TWkUo8GmnI=; b=q6P3A0kZBitObWdKOfviXU2ux
	F7v9GBNYS2HgKzAJ+FGaSAfml3TzCKq11hVjiZwyUahDGQMW4iHHqxYYontaV8k6kDKzoDylM3GE7
	VHfjSVZIkSJxNIeFJ76rti3AR+HKrN8buEnlH5AZ7Jhjgxxa8ZRR0/7rM8k98DnXI5h1IuLrsa/QI
	OJJOX1od6QotBtOLT0ZJSWiZXQoIITqT/PwRJT3JDO0QUCBU9WlsZuXYxvX5crVcLbiUZB6CgBVz/
	t7WzvdRT7wt5bBYS5lXtcJLC9Dw0WjX5/x5S6Pj3YSe5DCcxIGsvwK/UlNqktw4dKYrZJh5dOLNSJ
	fpgeP6iVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3brY-0006bU-EI; Mon, 17 Feb 2020 08:34:44 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3brU-0006b2-9G
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 08:34:42 +0000
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 01H8Y7fI027993
 for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2020 17:34:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 01H8Y7fI027993
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1581928448;
 bh=iFeL+FvfZwT8nZFlNEkV7vPr9X/DGzlKdy7hKYCgCAs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SfXiTkBHdDv7prHENuO9mjsmt6ec8YkZAdAni2UczQa1IXdqGOj7TETOctPJSsw0d
 3rhFAj/bS66uX1aax5Z8siFc5IAu13iMHvQplDdW1jCCHKW67LhGVWc0O3D75fVUyh
 7UetOPDBB9DHKCpKiN0RNxxwFQuGT46qkZzHPqssRhjoDEunkpO7L5EBj6BEhE3XXX
 lUQwq4TabqGQM2BVBjT5j7YCl0uggwWPKvEVEubZRKYybDpa9s+INhGAEE3LL8ZLOC
 zzCbk4ttdXcgYz+3s6XTlCacGi0Vi80rfy6RP2LfVEW9KzXRQgQWW2N8DhlSa4wWBD
 OjNDwFALaq7VQ==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id x18so10164604vsq.4
 for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2020 00:34:07 -0800 (PST)
X-Gm-Message-State: APjAAAXcjIZOyVKAN62WNkPB1VZqaf/H8JvMZrAW2xLiYXiZPvdDQf/2
 qdHeSW078ZRc/KWUQBViSQvt9PeF3rd3383eEcI=
X-Google-Smtp-Source: APXvYqzReC2WxLytXc8JTnhBThXdQ2NYJ7mG1WbLU5jq8ww13mEijqPmxiUEHdbIqFQtHbM3+idXSqQYhSAnl45Jt4w=
X-Received: by 2002:a67:6485:: with SMTP id y127mr7820527vsb.54.1581928446596; 
 Mon, 17 Feb 2020 00:34:06 -0800 (PST)
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
In-Reply-To: <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 17 Feb 2020 17:33:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
Message-ID: <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get ->setup_data_interface()
 working again"
To: Marek Vasut <marex@denx.de>
Content-Type: multipart/mixed; boundary="0000000000001f15c4059ec16b22"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_003440_662871_6EDC5294 
X-CRM114-Status: GOOD (  35.51  )
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

--0000000000001f15c4059ec16b22
Content-Type: text/plain; charset="UTF-8"

Hi,



On Thu, Feb 13, 2020 at 2:45 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/12/20 5:56 PM, Masahiro Yamada wrote:
> > Hi.
>
> Hi,
>
> [...]
>
> >>>>>>>>>>> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
> >>>>>>>>>>> hence the driver sets NAND_KEEP_TIMINGS flag.
> >>>
> >>>
> >>> Interesting.
> >>> I have never seen such clock rates before.
> >>>
> >>>
> >>> For all known upstream platforms
> >>> (Altera SOCFPGA, Socionext UniPhier, Intel MRST),
> >>> the NAND controller core clock is 50 MHz,
> >>> the NAND bus clock is 200MHz.
> >>
> >> You can configure whatever rate you want in the QSys HPS component.
> >
> > OK.
> >
> > The SOCFPGA maintainer, Dinh Nguyen, said this:
> > "From the clock controller, it provides a single 200MHz clock to the NAND
> > IP. Inside the NAND IP, there is a /4 for the clk. The 200MHz clock is
> > used for the clk_x and ecc_clk."
>
> That sounds like some root clock. You can read the entire documentation
> for the SoCFPGA CV/AV here:
> http://www.altera.com/literature/hb/cyclone-v/cv_5v4.pdf
> See section 3 , look for 'nand' there. Note that NAND can be supplied
> from at least two different PLLs -- main and peripheral.
>
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2018-July/592702.html
> >
> >
> >
> > Maybe, you are using a brand-new,
> > different type of SOCFPGA?
>
> Cyclone V and Arria V , so no.
>
> >>> What would happen if you hard-code:
> >>> denali->clk_rate = 50000000;
> >>> denali->clk_x_rate = 200000000;
> >>
> >> It will not work, because the IP would be using incorrect clock.
> >
> > I wanted to see the past tense here instead of
> > future tense + subjunctive mood.
> >
> > I wanted you to try it.
> >
> >
> >
> >>
> >>> like I had already suggested to Tim Sander:
> >>> https://lore.kernel.org/lkml/CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com/
> >>>
> >>> Unfortunately, he did not want to do it, but
> >>> I am still interested in this experiment because
> >>> I suspect this might be a bug of drivers/clk/socfpga/.
> >>
> >> No, this is a feature of the platform, you can configure any clock you
> >> want pretty much.
> >
> >
> > OK, but if you agree the 4.19.10 is working,
> >
> > denali->clk_rate = 50000000; denali->clk_x_rate = 200000000;
> >
> > is worth trying.
>
> Why would misconfiguring the IP be worth trying ?



There is no change around the ->setup_data_interface() hook
after v4.19
The only difference I could think of is the clock frequency.

But, it is OK if you do not want to test it.

And you are confident.

So, let's suspect the ->setup_data_interface() hook.


If possible, can you provide the dump of
the attached debug code?




>
> >>> 4.19.10 kernel (, which Tim Sander agreed the timing was working fine)
> >>> was hard-coding them in order to deal with the immature SOCFPGA clock driver.
> >>
> >> The 4.19 was working fine for Tim (and me as well), because it didn't
> >> have this bug which this patch removes.
> >
> >
> > d311e0c27b8fcc27f707f8ca did not exist in 4.19
> >
> > But, 7a08dbaedd36 did not exist either in 4.19
> >
> >
> > $ git describe  7a08dbae
> > v4.20-rc2-34-g7a08dbaedd36
> > $ git describe  d311e0c
> > v5.0-rc2-3-gd311e0c27b8f
> >
> >
> > So, your patch is getting it back to
> > v4.20-rc2-34-g7a08dbaedd36
> > where the condition for ->setup_data_interface() call
> > is accidentally inverted for the Denali driver.
> >
> >
> >
> > BTW, did you notice your code was doing the opposite
> > to your commit description?
>
> I think Boris / Miquel mentioned that above already.
>
> > Your commit description goes like this:
> >
> > "On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
> > hence the driver sets NAND_KEEP_TIMINGS flag. This did not happen before
> > and is actually incorrect, as on SoCFPGA we do not want to retain timings
> > from previous stage (the timings might be incorrect or outright invalid)."
> >
> >
> > You clearly state denali->clk_rate and denali->clk_x_rate
> > are non-zero values.
>
> They are non-zero, 31.25 MHz and 125 MHz respectively.
>
> > If this patch were applied, we would end up with NAND_KEEP_TIMINGS set.
> > Then ->setup_data_interface() hook would be skipped.
> > So, the timings from previous stage would be retained.
> >
> > Is this what you want to do?
>
> I don't know ? The calculated timings are apparently not working.
>
> > One more thing, if your patch were applied,
> > we would get back to the situation
> > where the back-trace happens due to zero-division:
> >
> >
> > When denali->clk_x_rate is zero,
> > NAND_KEEP_TIMINGS would not be set with your patch.
> > So, ->setup_data_interface() would be called.
> >
> > This would cause zero divion at line 781.
> >         t_x = DIV_ROUND_DOWN_ULL(1000000000000ULL, denali->clk_x_rate);
>
> If the clock are non-zero, how would this be a division by zero ?


You have a false assumption "If the clock are non-zero...".

clk_get_rate() may return zero if the clock driver
is not ready to provide the frequency information.



The current code:
  If clk_rate or clk_x_rate is zero,
   do not call denali_setup_data_interface().
  If neither clk_rate nor clk_x is zero,
   call denali_setup_data_interface().


With your patch:
  If clk_rate or clk_x_rate is zero,
   call denali_setup_data_interface(),
   which causes zero division.
  If neither clk_rate nor clk_x is zero,
   do not call denali_setup_data_interface().




-- 
Best Regards
Masahiro Yamada

--0000000000001f15c4059ec16b22
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-denali-dump-timing-parameters.patch"
Content-Disposition: attachment; 
	filename="0001-denali-dump-timing-parameters.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k6q776iy0>
X-Attachment-Id: f_k6q776iy0

RnJvbSA4NzM0YzVmZDNmNTkxN2I3NjViZDY0YjFkNzhkNTliYmJjMjIwMzllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBNb24sIDE3IEZlYiAyMDIwIDE2OjQ4OjA2ICswOTAwClN1YmplY3Q6IFtQQVRDSF0g
ZGVuYWxpOiBkdW1wIHRpbWluZyBwYXJhbWV0ZXJzCgpTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZ
YW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2Rl
bmFsaS5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2RlbmFsaS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKaW5kZXggZmFmZDBhMGFh
OGUyLi5jMzMyY2EzY2JhOTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFs
aS5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jCkBAIC03OTQsNiArNzk0LDgg
QEAgc3RhdGljIGludCBkZW5hbGlfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hp
cCAqY2hpcCwgaW50IGNoaXBuciwKIAlpZiAoY2hpcG5yID09IE5BTkRfREFUQV9JRkFDRV9DSEVD
S19PTkxZKQogCQlyZXR1cm4gMDsKIAorCXByaW50aygiRGVuYWxpOiBjbGtfcmF0ZT0lbGQsIGNs
a194X3JhdGU9JWxkXG4iLCBkZW5hbGktPmNsa19yYXRlLCBkZW5hbGktPmNsa194X3JhdGUpOwor
CiAJc2VsID0gJnRvX2RlbmFsaV9jaGlwKGNoaXApLT5zZWxzW2NoaXBucl07CiAKIAkvKiB0UkVB
IC0+IEFDQ19DTEtTICovCkBAIC04MDUsMTAgKzgwNywxNiBAQCBzdGF0aWMgaW50IGRlbmFsaV9z
ZXR1cF9kYXRhX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAog
CXRtcCB8PSBGSUVMRF9QUkVQKEFDQ19DTEtTX19WQUxVRSwgYWNjX2Nsa3MpOwogCXNlbC0+YWNj
X2Nsa3MgPSB0bXA7CiAKKwlwcmludGsoIkRlbmFsaTogdFJFQT0lZFxuIiwgdGltaW5ncy0+dFJF
QV9tYXgpOworCXByaW50aygiRGVuYWxpOiBhY2NfY2xrcz0lZFxuIiwgYWNjX2Nsa3MpOworCiAJ
LyogdFJXSCAtPiBSRV8yX1dFICovCiAJcmVfMl93ZSA9IERJVl9ST1VORF9VUCh0aW1pbmdzLT50
UkhXX21pbiwgdF94KTsKIAlyZV8yX3dlID0gbWluX3QoaW50LCByZV8yX3dlLCBSRV8yX1dFX19W
QUxVRSk7CiAKKwlwcmludGsoIkRlbmFsaTogdFJIVz0lZFxuIiwgdGltaW5ncy0+dFJIV19taW4p
OworCXByaW50aygiRGVuYWxpOiByZV8yX3dlPSVkXG4iLCByZV8yX3dlKTsKKwogCXRtcCA9IGlv
cmVhZDMyKGRlbmFsaS0+cmVnICsgUkVfMl9XRSk7CiAJdG1wICY9IH5SRV8yX1dFX19WQUxVRTsK
IAl0bXAgfD0gRklFTERfUFJFUChSRV8yX1dFX19WQUxVRSwgcmVfMl93ZSk7CkBAIC04MTgsNiAr
ODI2LDkgQEAgc3RhdGljIGludCBkZW5hbGlfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKIAlyZV8yX3JlID0gRElWX1JPVU5EX1VQKHRpbWlu
Z3MtPnRSSFpfbWF4LCB0X3gpOwogCXJlXzJfcmUgPSBtaW5fdChpbnQsIHJlXzJfcmUsIFJFXzJf
UkVfX1ZBTFVFKTsKIAorCXByaW50aygiRGVuYWxpOiB0UkhaPSVkXG4iLCB0aW1pbmdzLT50Ukha
X21heCk7CisJcHJpbnRrKCJEZW5hbGk6IHJlXzJfcmU9JWRcbiIsIHJlXzJfcmUpOworCiAJdG1w
ID0gaW9yZWFkMzIoZGVuYWxpLT5yZWcgKyBSRV8yX1JFKTsKIAl0bXAgJj0gflJFXzJfUkVfX1ZB
TFVFOwogCXRtcCB8PSBGSUVMRF9QUkVQKFJFXzJfUkVfX1ZBTFVFLCByZV8yX3JlKTsKQEAgLTgz
Miw2ICs4NDMsMTAgQEAgc3RhdGljIGludCBkZW5hbGlfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKIAl3ZV8yX3JlID0gRElWX1JPVU5EX1VQ
KG1heCh0aW1pbmdzLT50Q0NTX21pbiwgdGltaW5ncy0+dFdIUl9taW4pLCB0X3gpOwogCXdlXzJf
cmUgPSBtaW5fdChpbnQsIHdlXzJfcmUsIFRXSFIyX0FORF9XRV8yX1JFX19XRV8yX1JFKTsKIAor
CXByaW50aygiRGVuYWxpOiB0Q0NTPSVkXG4iLCB0aW1pbmdzLT50Q0NTX21pbik7CisJcHJpbnRr
KCJEZW5hbGk6IHRXSFI9JWRcbiIsIHRpbWluZ3MtPnRXSFJfbWluKTsKKwlwcmludGsoIkRlbmFs
aTogd2VfMl9yZT0lZFxuIiwgd2VfMl9yZSk7CisKIAl0bXAgPSBpb3JlYWQzMihkZW5hbGktPnJl
ZyArIFRXSFIyX0FORF9XRV8yX1JFKTsKIAl0bXAgJj0gflRXSFIyX0FORF9XRV8yX1JFX19XRV8y
X1JFOwogCXRtcCB8PSBGSUVMRF9QUkVQKFRXSFIyX0FORF9XRV8yX1JFX19XRV8yX1JFLCB3ZV8y
X3JlKTsKQEAgLTg0Nyw2ICs4NjIsOSBAQCBzdGF0aWMgaW50IGRlbmFsaV9zZXR1cF9kYXRhX2lu
dGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAogCWFkZHJfMl9kYXRh
ID0gRElWX1JPVU5EX1VQKHRpbWluZ3MtPnRBRExfbWluLCB0X3gpOwogCWFkZHJfMl9kYXRhID0g
bWluX3QoaW50LCBhZGRyXzJfZGF0YSwgYWRkcl8yX2RhdGFfbWFzayk7CiAKKwlwcmludGsoIkRl
bmFsaTogdEFETD0lZFxuIiwgdGltaW5ncy0+dEFETF9taW4pOworCXByaW50aygiRGVuYWxpOiBh
ZGRyXzJfZGF0YT0lZFxuIiwgYWRkcl8yX2RhdGEpOworCiAJdG1wID0gaW9yZWFkMzIoZGVuYWxp
LT5yZWcgKyBUQ1dBV19BTkRfQUREUl8yX0RBVEEpOwogCXRtcCAmPSB+VENXQVdfQU5EX0FERFJf
Ml9EQVRBX19BRERSXzJfREFUQTsKIAl0bXAgfD0gRklFTERfUFJFUChUQ1dBV19BTkRfQUREUl8y
X0RBVEFfX0FERFJfMl9EQVRBLCBhZGRyXzJfZGF0YSk7CkBAIC04NTcsNiArODc1LDEwIEBAIHN0
YXRpYyBpbnQgZGVuYWxpX3NldHVwX2RhdGFfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsIGludCBjaGlwbnIsCiAJCQkJICB0X3gpOwogCXJkd3JfZW5faGkgPSBtaW5fdChpbnQsIHJk
d3JfZW5faGksIFJEV1JfRU5fSElfQ05UX19WQUxVRSk7CiAKKwlwcmludGsoIkRlbmFsaTogdFJF
SD0lZFxuIiwgdGltaW5ncy0+dFJFSF9taW4pOworCXByaW50aygiRGVuYWxpOiB0V0g9JWRcbiIs
IHRpbWluZ3MtPnRXSF9taW4pOworCXByaW50aygiRGVuYWxpOiByZHdyX2VuX2hpPSVkXG4iLCBy
ZHdyX2VuX2hpKTsKKwogCXRtcCA9IGlvcmVhZDMyKGRlbmFsaS0+cmVnICsgUkRXUl9FTl9ISV9D
TlQpOwogCXRtcCAmPSB+UkRXUl9FTl9ISV9DTlRfX1ZBTFVFOwogCXRtcCB8PSBGSUVMRF9QUkVQ
KFJEV1JfRU5fSElfQ05UX19WQUxVRSwgcmR3cl9lbl9oaSk7CkBAIC04NzAsNiArODkyLDEzIEBA
IHN0YXRpYyBpbnQgZGVuYWxpX3NldHVwX2RhdGFfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsIGludCBjaGlwbnIsCiAJcmR3cl9lbl9sbyA9IG1heChyZHdyX2VuX2xvLCByZHdyX2Vu
X2xvX2hpIC0gcmR3cl9lbl9oaSk7CiAJcmR3cl9lbl9sbyA9IG1pbl90KGludCwgcmR3cl9lbl9s
bywgUkRXUl9FTl9MT19DTlRfX1ZBTFVFKTsKIAorCXByaW50aygiRGVuYWxpOiB0UlA9JWRcbiIs
IHRpbWluZ3MtPnRSUF9taW4pOworCXByaW50aygiRGVuYWxpOiB0V1A9JWRcbiIsIHRpbWluZ3Mt
PnRXUF9taW4pOworCXByaW50aygiRGVuYWxpOiB0UkM9JWRcbiIsIHRpbWluZ3MtPnRSQ19taW4p
OworCXByaW50aygiRGVuYWxpOiB0V0M9JWRcbiIsIHRpbWluZ3MtPnRXQ19taW4pOworCXByaW50
aygiRGVuYWxpOiByZHdyX2VuX2xvX2hpPSVkXG4iLCByZHdyX2VuX2xvX2hpKTsKKwlwcmludGso
IkRlbmFsaTogcmR3cl9lbl9sbz0lZFxuIiwgcmR3cl9lbl9sbyk7CisKIAl0bXAgPSBpb3JlYWQz
MihkZW5hbGktPnJlZyArIFJEV1JfRU5fTE9fQ05UKTsKIAl0bXAgJj0gflJEV1JfRU5fTE9fQ05U
X19WQUxVRTsKIAl0bXAgfD0gRklFTERfUFJFUChSRFdSX0VOX0xPX0NOVF9fVkFMVUUsIHJkd3Jf
ZW5fbG8pOwpAQCAtODgxLDYgKzkxMCwxMCBAQCBzdGF0aWMgaW50IGRlbmFsaV9zZXR1cF9kYXRh
X2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAogCQkJMCk7CiAJ
Y3Nfc2V0dXAgPSBtaW5fdChpbnQsIGNzX3NldHVwLCBDU19TRVRVUF9DTlRfX1ZBTFVFKTsKIAor
CXByaW50aygiRGVuYWxpOiB0Q1M9JWRcbiIsIHRpbWluZ3MtPnRDU19taW4pOworCXByaW50aygi
RGVuYWxpOiB0Q0VBPSVkXG4iLCB0aW1pbmdzLT50Q0VBX21heCk7CisJcHJpbnRrKCJEZW5hbGk6
IGNzX3NldHVwPSVkXG4iLCBjc19zZXR1cCk7CisKIAl0bXAgPSBpb3JlYWQzMihkZW5hbGktPnJl
ZyArIENTX1NFVFVQX0NOVCk7CiAJdG1wICY9IH5DU19TRVRVUF9DTlRfX1ZBTFVFOwogCXRtcCB8
PSBGSUVMRF9QUkVQKENTX1NFVFVQX0NOVF9fVkFMVUUsIGNzX3NldHVwKTsKLS0gCjIuMTcuMQoK
--0000000000001f15c4059ec16b22
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--0000000000001f15c4059ec16b22--

