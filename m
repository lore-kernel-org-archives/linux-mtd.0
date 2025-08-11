Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A55CA0ECD
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xEI5AzISEru9uaHADbb0078w2VKOqobDPybr7uW1stQ=; b=gMF8FOVYnDxo3v
	KJZtfuG+XOjfaqysBG3lZvz5Du5Q046XYor5lITHoWuXnJhWIgkRTSPTFWsZx3RBI/IASCL8DVMFr
	jrbieMtbeZklASV0rKmTsE5cyU6J6x/mOiQm+mku3YM51qyt7cqgZ6vUxsr4an72IYwgoFFpG1Hu5
	OQl4QW/FtmiB1gzvslaOR+NcwesbvAq5DCTcKq1TGumTww231ZnPbEPFmtouVD8PWC9qjfBt+3kU/
	3ydH7dphud7DlSz1Lw6lhVuiv0Uj2sk+0HoZYqbqoTuX7IKJ2sjRwxAuy8PrdDyFeWM9VL2nOfJyq
	syd5O70wxjXqIpITI6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUfj-00000008Eul-0887;
	Mon, 11 Aug 2025 15:42:51 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT3H-00000007v0z-1jOi
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 13:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754920738; x=1755525538;
	i=markus.stockhausen@gmx.de;
	bh=QKkQLq1m+vUnJ6jBofbEFz7yB6IELQQ9vuPfvjObDUE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lbqp4MVm4kvdJrFSn/HQV8CVr4o6P6x8oPKfaySOWJFKab60xRy9QrJStPocSfbB
	 K8vYkAT7F0s8/qv0xeGcIdpJWtp7Bm1vjdhbawsN0ZbL91oklFZ2NLvYOrfNNAhIM
	 sDdkckqdli67zVxn16xvAKX/zZhj2to8pQjI7NDdx3/cQBIwnyDCkxlNfvRk2rJqU
	 v4uXZ140yHH5VII97HISrgtJTVhlz421h7yLYUVYdlXQ4RZdzjE4ywjtJ0+4RxQNM
	 fSYAFnACHuKXNjdUMK/zYqmOyRxAR7fYLjkwRlry7kJ2WJ16kwwWIc2qzrh6hdom3
	 MLCggCFqA5/E/rOIIA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXpK-1vBlMQ3HkG-00ULri; Mon, 11
 Aug 2025 15:58:58 +0200
From: <markus.stockhausen@gmx.de>
To: "'Miquel Raynal'" <miquel.raynal@bootlin.com>
Cc: <vigneshr@ti.com>,
	<richard@nod.at>,
	<tudor.ambarus@linaro.org>,
	<linux-mtd@lists.infradead.org>,
	"'Chris Packham'" <Chris.Packham@alliedtelesis.co.nz>
Subject: Realtek ECC engine (was NAND errors)
Date: Mon, 11 Aug 2025 15:58:56 +0200
Message-ID: <667201dc0ac8$153da250$3fb8e6f0$@gmx.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: de
Thread-Index: AdwKwyg0ubsB6aOvSTuLZvqhqMWoNw==
X-Provags-ID: V03:K1:eM2Poi/Hg1AHx8/9gKxR+JhKBat3I6j/kFsgUKGnfasZhH3grwr
 kNjFRVnQdUKwzg/4pC0PfoIJLYqskCo1GqhXC3WQcl6kRjUlMS0iHtkUDgy1DyQdROYmj0O
 s3mLyYl6ACpXdxkDsZ76Xnn1sV8fX8hi/aIINlGtEthX6eJfO0e7sfe8yBfP5LRs/XkG2DU
 fbc4zzie9Z2HW6yQDnH9Q==
UI-OutboundReport: notjunk:1;M01:P0:xJf5SuvdbtM=;DS6GaFaLsnKpli0LDC756ook9e7
 YOAmtgZd+zdC1TKkARHD9m/4f/JnNategbc8eUlwW//3VpCD10bJSUiLpR7tmxsw2ShqgGTgg
 wK6ThfntC1KyFIW5gjWrjx7vojgSoHyB0vgnlT3iyXTr+zDrytlBUFnf5+yt0LR1iIhXWvdi2
 4iKsdwySyxu7IshXgDgep9UTmboV9fq2Ad5XIa8DQ2m5VrdbggkDJ3EXHwNkhoJH0WzWaB0p8
 hCdhqhoDGi3KxxxfB9TYi2TeySP1yKGxQwMG/oLmTsuUFX0V+mLFNrIfTuYaz6BohjBZwTpBW
 kqrJstEgj+zwPHTV+dlEtSaMWCpJOWBIQfgdribNFyMqRIBQLQiYkjgdakL9Hh5MSi5repLwR
 H/azNoIP1eWigRMvMsKuxw6WkZu10AIbpIXfU6YnJPkYEudVmITsSYqOh8CmEKIEfyWWGssxS
 rBWZ5SXFTPCqYaL+9imuvvmPuptTHtq5ZQYOSEsUsf68DSkZ7koxWLW5GQJpEamnoN2eSPCLo
 whQmCg1eOB9fz974BSgVe8XWL4Gy4m/qDJqNSrndQTTKiCl1rd+szTdXYcv/VGEt3VWOwyBda
 ujCsDvkDJ/HeJh58r8kR2xSrOQJ643wDAP6zNWJpsKrMFlhRMlpvIq1r/GQUsfWoLIYZGI0FP
 OdgX4uOs5SibEACJTeRvwrzlPWMUQ3cvzN/JwCJcplMUbpz6OB6RQLTbbmj4OTfY4dZHlqPAu
 hIa/jgM/4aGHSo84A7sY/R+EP6HeB8ykEnCAZ35VfzrjSuNVzCoZeBTLu6QbFDNhbItNysvbn
 hDmlxIKHgb6C3b5QjY8RU1zezYmMGhyVD7/YR+CS6c18ffT7hv6Ha3MEpmmOiZwDK84qzBSbu
 pWK9iLIiSQ8PV0KPYU/wDoz9WFT6EdPbgn0m+2unj8FxsB30vsbqwtCwiKbDZKQABw0U8L4hX
 +V4CIfWi9DLOlfq0fRHdGspZxQpNV4uZz1WHnX1jVby/yJiEj74fYrpFc19d3AAwLcPC+zXW3
 NhBiJ2Dtqjg6cKENIcigXzTlHqywEw9etdvp2dmquLQl1KQqs8reaqxmxNIsFzT/JdnuIAj5R
 jwO25IpTif4qX0OmB04xzTq0HHM0Ue0BRWMtwNflWzRWWKm0SI6yJY0pXjWQPJbF//lrc5L+p
 xZWVKbcf+ygHqL62NTvt6E79hlEEu9OnU4aZDYRUM2ljIAldhEs/4HuOybqGewZ6O2yjfOm1R
 iH1psrn7Z0RvMSX57OCewaU0ynw61VGJ9sG2eoNpzUaHbjDnZ/HMRY4sI264R/Kp8QkkG494V
 RL/TShwA59Vr3Do77LZ2+qDvYEEnadskSdSusEkHgWqASVif2MKCHe6lpS668wEZa61CKGDaB
 SP9t1AYxOUe1znbMT07QKsoP6NKhuA1COKIInA3gyI3aw01I7hnQZrki0VEJhmijeKyEdrgli
 ANPgRy2BtoGNVtacmxxNu4/UZLQXfUpWGiLOKED9W7PLX3MixHP9aLEtgcL3nZaVO0QJRXatn
 RBZjh09XoMvZvhMa6WlFpf5akLQKIAuMjN9DtoL41iwVbK3xhjR1uNW1qK2cYne2s94cgnizF
 JJGjF+vdMgNxOYhCWBc8O2GIC77WzCZPR4pcvsZHoXPOOq0TPoR0e2TKfE4cKZL1caCBvR/Ez
 CchqMIM4bk9oySzMEpWsUfXpcpSVKZPcgZ5e5WVQ3aNKUS4GdpTYnnCoYaCvlLRYMjkP/EjD5
 VNlWqTbnesAmMzNfRKpj/yjxQhX0gFZnobHhov0U97LC/3UDnceLx3cofPw+hNNt/7xgOqMMi
 kwjFCk3yvglgdVwgZHhstw1zQMQySK02evXftM6ALlJsLs61Rb/ujuTNbEsnIDJBwM77kECvc
 Wa3zHB9+kSZHresnEanNdThR+fQzwg4rfc1ofKDb1nNEFtcAR+BUrD7HTmcS8Rlofp7xOHgKb
 AVC+1P9b2oPIg5OWrMp0fJAdq3ejsHJgrckjpP8lpiaBauy5DS57DRwlAS2iBOmKzeZNKh7c2
 qbLivItG8Pqe3fOfu977RngH72RSwA54eGxWEIkM/Mt1XA3wsyHSUhpWcD23WH3PiNWPVt7nh
 QHmDxEPNfbR/AHgeb9PR5XKV/YbQ98pDemmq1nbwzLGbvgFaxEfYsTbssus+tdtun/JUEmYus
 kQ3g+X4qja4ZSmkr/OkNgHsLKUJCdnCEJ/vqC+NZzENYO8witVvRnxyYoPEYMS/5TWbZTVqvI
 qOvDg805mCIpsjoF/0AIQTKa25ybnaYqElLwufK1oukz1h4+RBGxbOlNCot3fCFHN98ytUiFr
 WiRuqo6Fo1VC1pow5dv1N9VTX74/+5+RtVGDNyO7Q0wIaZ/k+RtbI/cVjBNttenJdz3hn1aeL
 7EUBDS05aruSSfYMf/bas3+i63JjMpkG7cta1J6Yf1zQde+w2Mn+tFPRPamiCnqq5LzJio1s5
 5Vjw50Q8H3SugtRk38rxc1wr0G+mwpv/+PttLhZw4V4VUICJBl72lEmpnDyoNrZaLDCH88MNm
 fPzU3JvXDTSt/xwwOm4tFd6kzk7B/nA3B0Lu3pZYbq5StkcT5iINA4tl4B5aLshL+sohQmbXA
 m2AbeTpLCjBLIo4C0AxlCk+r7r/gWCmRlrja6weJ1rqJpskTaKdHc5a9kEBKqyQAQYX5XE1wo
 HkTep9a2bvY0SDoVmE4MZUpvKDwfZIdabdE0HuZfiohwv4KRbParlYncliezwNHCXr7puzIrh
 WDKYnUYatyr1Z/sH0d7lGbLwb9xSV6q9bDgf1TNDm05nvwgbCqfQou5gTjQCR96tKl47rB8CT
 uy2XI4D93AUyZHXurYyIYnaNp85PIek+WyPof6buH4bXpZafHRGSPhIzZb8CtpRWLUrElXx19
 eGQwPhavg44uw+ioAy5JMVCuWNz3UwwtuxMBap1rTECvWUftUIOiEh+gwQwK+BsuP5nydOvaQ
 Ze8p7yozUyw/2PXwGMmdfEN/cwakzvv5uoRZHWQFzzyfWFzRQTC7oYD0vbiO5ntP53CT/qMjd
 8JjYWCOwLU4FYvd574SVVRzXUPeyVKMjXBnfOBQ27qGrC49RMZeybfdhtoz/dbwbAYMv6S7Vr
 KLDdgvndg90jysOHSn0zLkSp9qqVnDD7GVY61LXOhB78due9GnavuQRenu20joBUUr+WHHS6C
 B6iyKBVhMo28d+BXYmwRIVlzgmZ0uxebYsQbZxTDXm87wgwi4Z6WForBXW2gI9DVmAORMMIRM
 IdTArP1BtZiQCF1MZa0CsF5UkS/URQ2+Y2yyYa8hoNsbNQ46HoTZ0OgDkKtsuECU2tAAhcuCr
 U1gcGADmyE7GCM7hXuw82w4mL+FN5h1wtZavUm4lTJ/PdLIzoJ6pYQEW3mnE8lIcHhhZaQfgk
 HWeokhNQG/buM9jo/fqQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065903_870081_59ABB954 
X-CRM114-Status: UNSURE (   8.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

on the weekend I was able to hack together a very basic working version of 
the Realtek ECC engine. See https://github.com/openwrt/openwrt/pull/19746
Until now I was only focused on the devices that are available for testing 
(Linksys LGS328C & LGS352C). Driver can now handle exactly the identified 
data layout:

- 2048 bytes data (4*512 bytes)
- 64 bytes OOB consisting of
  - 4*6 bytes tag
  - 4*10 bytes ECC

There are two things I do not yet understand:

1. Interaction between request handling and mtd_ooblayout_ops. For now I 
simply take the request data & oob buffers and put data where it "seems"
right.

2. The hardware does a lot of good things. It returns ok/errors/bitflips
and I can simply pass them back. But how do I tell the upper layers that
4 bitflips are getting close to the 6 bits the engine can handle. Is it
in the driver or DTS? That currently reads.

soc: soc {
	compatible = "simple-bus";
	#address-cells = <1>;
	#size-cells = <1>;
	ranges = <0x0 0x18000000 0x20000>;

	ecc0: ecc@1a600 {
		status = "okay";
		compatible = "realtek,nand-ecc-engine";
		reg = <0x1a600 0x54>;
	};	

	snand: spi@1a400 {
		compatible = "realtek,rtl9301-snand";
		reg = <0x1a400 0x44>;
		interrupt-parent = <&intc>;
		interrupts = <19 2>;
		clocks = <&lx_clk>;
		#address-cells = <1>;
		#size-cells = <0>;	
		status = "okay";

		flash@0 {
			compatible = "spi-nand";
			reg = <0>;
			nand-ecc-engine = <&ecc0>;
			partitions {
				compatible = "fixed-partitions";

Thanks in advance.

Markus


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
