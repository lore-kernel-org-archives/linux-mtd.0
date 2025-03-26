Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068B0C3600B
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 17:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yg1qd5FEs19Fy7yy/ha3Dv5GbPGL/r26t9DKI1MzgrU=; b=D1Y+1/t3UjT6LA
	ATOLi0rn46/odNLX5G1Ll+DuAGEJ0ugnW89BC8Tfxrq5I0IW1i08RlpXFMOvSlbVXvtvkE38j33qg
	MaCse2MXhBfDPfxri2Irts9alr2HA4JNqVC13fh6J66n/ekzQrJVhwHNR9Bpn9KMQnj9i5T5ngiwx
	vi4KPOUV7m0a6DdmOAycSENp8OQx1Bdmke6sUkvN0iJJkpJgnCvH3MLrd3MvZurJNqacDrzKkDjWo
	ncJYjbn79v1ZEt3V+4TyAaUjL+yLMmNQyFcJFbnQO3rwpz/K5zGWmt64rneowHq947humngpMPS68
	ucwg1ir5sbfMm7yWxFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUVf-00000009AU7-28q9;
	Wed, 26 Mar 2025 17:25:47 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txU7v-000000096BH-1psD
	for linux-mtd@lists.infradead.org;
	Wed, 26 Mar 2025 17:01:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4666B4432A;
	Wed, 26 Mar 2025 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743008472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkqdHxejE4RNeWR67c3lTm9KGMYmqW1shkcHtK2E6s8=;
	b=lgqRgkHTmtpNYgtl/iDkqtmtjqYQXFzTBRJmbsJpW17TakFV59SJNcpc1t/296dHZeEO48
	9znieKSp1xoCWWwfzblTNE3rmtVJ2mhEqQHLrf5y9zPbJymtRYzQnDmME9IhU224LlxVX1
	PA05NCP6Ku3mOIMKAJNNuzKay47E3myazGaCA9IjF+CEo8qehnKdFWK5ZkGH+RqV3h70nI
	vexldSsYE1nC2RG2MdegegmbrCUyiQDM1XrvRJwKo0v/1qu1UbE3TPcTliT4bt508NkWm5
	uFW07QRiDN/TYofjLEycD+02nE2HrhrwadpWxmcP91HDgvRpzFrU3lZ1tMf+JA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Michael Walle <michael@walle.cc>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.15
In-Reply-To: <87iknvoi0u.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 26
	Mar 2025 17:48:01 +0100")
References: <87iknvoi0u.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 26 Mar 2025 18:01:09 +0100
Message-ID: <87msd7n2ui.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeitdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfelkedvveffleeuhfeigfdvvefhgfejgffghfeiteegteeiudegfedtjeehkeefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopefvuhguohhrrdetmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepfhhrihgvuggvrhdrshgthhhrvghmphhfsehkohhnthhrohhnrdguvgdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehprhgrthihuhhsh
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_100115_625672_5CF88809 
X-CRM114-Status: UNSURE (   4.60  )
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

On 26/03/2025 at 17:48:01 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
>
> This is the NAND PR for 6.15.

Merged into mtd/next.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
