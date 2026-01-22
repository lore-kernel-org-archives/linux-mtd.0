Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266C1D3EE84
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZE4hK9ol+kN5FJ1gcmvopvsclHy13atK8hNrONkZMmU=; b=QwZupaDdGZuQdc
	Jw4JAx/gDWuqgWwOVdz7dl2BhedDkGcD/PV6kyIxHZzk0x79QDsbgk6rIHrtpZBp1teqsSrytRwPK
	YuA3gfwNVyqWL0ernqrMlW4csd9jsnNfe0R8kcEGnKHW/rDtEqc0Dha/H4dcAes46eHsACtEujtar
	JbC0nvFOYE1ymVu7oyRkplgrNROBPYI7aP0pqgiXRO6SDad75bcD8wksIiWpKocIhQ2q5F0luKbU9
	YJOoJtpwg9Z4WEIl18qQdr/QouBs7HZlAKKJgM8qh2hQH6x7ew9AnioDdut/cyPVdicfu/LYu8HOQ
	EGyMnv8zEkTpbPOdPFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixlh-00000007SiE-1JT6;
	Thu, 22 Jan 2026 16:42:49 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixlf-00000007ShS-06sc
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 16:42:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vixlK-000000001Tb-1Okc;
	Thu, 22 Jan 2026 16:42:26 +0000
Date: Thu, 22 Jan 2026 16:42:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Chad Monroe <chad.monroe@adtran.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	William Zhang <william.zhang@broadcom.com>,
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/10] dt-bindings: mtd: partitions: Drop
 partitions.yaml
Message-ID: <aXJTb0-YMu9gf5SB@makrotopia.org>
References: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
 <20260121-dt-mtd-partitions-v3-6-ec3af93c8f93@kernel.org>
 <aXFCws0XUToQ03UH@makrotopia.org>
 <87tsweos4l.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tsweos4l.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_084247_066886_E83ABB52 
X-CRM114-Status: GOOD (  19.95  )
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

On Thu, Jan 22, 2026 at 11:31:54AM +0100, Miquel Raynal wrote:
> On 21/01/2026 at 21:18:58 GMT, Daniel Golle <daniel@makrotopia.org> wrote:
> 
> > On Wed, Jan 21, 2026 at 01:56:39PM -0600, Rob Herring (Arm) wrote:
> >> The partitions.yaml schema is an unusual structure in that it includes
> >> all possible partition types, and it disables the normal matching by
> >> compatible strings. As partitions.yaml has nothing to match on, it is
> >> only applied when explicitly referenced. The use of "oneOf" also results
> >> in misleading warnings which are difficult to understand. Drop
> >> partitions.yaml and rely on the standard compatible matching instead.
> >> 
> >> The "mmc-card" case previously allowed any partition type, but now only
> >> allows "fixed-partitions". There aren't any users and the original
> >> intent appeared to be only for "fixed-partitions".
> >
> > It would actually be great to also allow 'gpt-partitions' as compatible
> > type with #address-cells = <0> and #size-cells = <0> and allow matching
> > on partition UUID, name or index. This has previously been discussed and
> > would avoid having to extract MAC addresses and WiFi EEPROM data in
> > userspace on many devices which rely on such conventions.
> 
> Out of curiosity, why not exposing this data through an NVMEM cell
> instead? Anyway, this (re?)addition can probably be part of a follow-up
> series and is almost orthogonal to this cleanup IMO.

Exposing this data via NVMEM cell is exactly what I'd like to see.
However, for that the location of the data to be exposed as NVMEM cell
needs to be identified in the same way as done by the stock firmware,
which uses a GPT partition name in case of Adtran, for example.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
