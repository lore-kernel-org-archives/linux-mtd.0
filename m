Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721CB606A327
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zL/Zor4q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pi6S18Dq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+HpzACGyjLM/hYe/6Lht3H8N+GRgW8EqlZABFxRrv+g=; b=zL/Zor4qYCxCBKL2PeLC+z/q92
	AB0quyb1J0g4XeNyg37p7tCJ+ZlUBqrjcrN+O9nYYrmSi4pI+yqEStX0NhuD7/lwdANRH6R0CX9pc
	CgLdas8TlWtB+IQVVVzPeHWhrR1qq3RZzPhlUpiMSYZv6YL/w2C7gJeTb2dhVOpcPCg2Y9HTOS/Zd
	XYrzPHZGsQ/BVzf1nwS9TFPKU6iCxpqZeAk3Gi8WwRtY+bxhB+ldkATxb+kr33C7voQ0RNABgVkpJ
	kWujfTnB+KGafZ9oWIQOiq25YpAEXIrUo8NSINJa6vv3MgYRO2/Nltr5X8wJnVNXrumhUPfIZUAx8
	jVSWfHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXqe-0000000D2Pa-0mph;
	Thu, 26 Nov 2026 11:41:08 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXqa-0000000D2OX-3bpy
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 11:41:06 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso67382201fa.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693261; x=1796298061; darn=lists.infradead.org;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxM1VmLjZ2nxPUWhti3qYeNXknEDXlY7brHt5kBUuxQ=;
        b=pi6S18DqcIoqpC3XrpLJoySv66UR+IeHYDUASWwzJ6AwggbeHmG01fpIk52YwCjDA3
         vfZ1Z3SgfHxwsB2WCuIrinLFyc2/XEHoKK6Kk+PxlEonRWsjXGbJmogJZBw0Bdb40jEQ
         MKr3rDxeU8tM46HCNLqMLjW/f9bojFnwe4BmDS7teLH/OlRlnhfxx0GMToJiUklTxYy7
         Ss7GHm2so9lL7FFDGyspca19QrnJkpbpf74GupfQFfQ5RX09tWtPD3FAsSLnTXQIMtDy
         KeXxnCI3rNesVWgnP3SozBiIcLUgJZER1O+3jQZgnKf17NwpACF8SEKGYq7od8L06kgX
         IA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693261; x=1796298061;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxM1VmLjZ2nxPUWhti3qYeNXknEDXlY7brHt5kBUuxQ=;
        b=m1oZAhLCQBSfJesC8cAm7hMAq8i3lxRQ/yUI6cEIUuzgJBocDu13d8klv6N2WJhNiM
         4lZaU6YQCM01PB84Nut/T0pz4GNxStXvLnDel0HWNsKKfXZx/h7bseDfVSgZhyCsJ3tL
         2il41Mm8NZdWF6o3EZ0uAx/Il7r2fx1Fl8gRF0sxgqssJpPuZamFJIzvKYnYtyj97CWC
         q+/hA1ZhMZRtjawE5UPihs6q9HYHd5xgZQVZpCsfIu1MW3iwctvjYaaQAIGWNCzFRR/M
         lGhjn8ZGjia4WA0wP6e7VIe5AWD7Z3fZM+U4PizCGlk1XxkAYzCAkrl09Efpt6PD5TIL
         RJWQ==
X-Forwarded-Encrypted: i=1; AL+hErGE4M3bX0gfx1OXtkTcjEBVAr0uClIIsKxYSZl6U5jwH/OhDWWEod0JX8J265StT9Jzm8dYlOgbPsM=@lists.infradead.org
X-Gm-Message-State: APuU4Z/zBk6Hg7ZtTlnzOeyypZWdJ+ORzc9czLisZ+7uAZ3GsdCmvBOl
	+MPk+NnPyECAJFz8LLnlnk4pRJTAH9fXZsmH14nMi/VdfgKNP41hcjpJ
X-Gm-Gg: AZFdTZeZDjrBCO5mpZ+NAbJqdCyqn6Bd+lGUCpD7SNMEjNds0HNB7C3/CvchAbr3cJv
	KcjElSrBrlv3LH3MCILkeEfRzSVg9E/5Mpe5MZzYhPLIpE0msHZb4JEZnDaZs2GY3G8RuuTGA/V
	fnUVYOcwquJbahFe/yCbfuDVZY+W2I0Y8N/zN/vDpxnXbFG460IZNZJ5qaVZPIVWG4oNJN21BKQ
	/42DSHOfB63GVVlO52l3FmwbLOsulVWYndgbPhaNuNG0Ng5IVg90xHxo8sn1FomrgT8qNe5Uqxc
	9JwA8Wx3hKA555Cua4XdCxdLn/bRjofQ0fuZoTxy3yjEauzWhuureY7awETJqKLJBTaiR+ddNBH
	7m/t6i/QeMi3al76QCW55gSDJGR1dpQOgdCC8HpjqZrCZKsshR176ad9Ca1x6IS1gn3F/vf7u4e
	Kv/9kI24luOd3+TTzl2HUdp9X2U90T659DDaJztPl1Cx/c7mQT5CPL4VgzyLhGbApGca4OityEE
	g0H8Kj5Hv3zxc3BqQalJ8G0SeBwIz3WA4iN8Ebpyb3D22iJqCqjK/+DropMN8D/yOZhkqQqxCqv
	2LXz0ns/g+23M6dpu7+fSFnfBJNr9J13fr8eGolvEEx5E1H1PoxpdqarOCgwXR7sRcpGlD6Z/2m
	6
X-Received: by 2002:a05:6512:2509:b0:5bf:ce43:979b with SMTP id 2adb3069b0e04-5c1b7c0725bmr5707863e87.21.1795693261054;
        Thu, 26 Nov 2026 03:41:01 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0419b7sm5153112e87.55.2026.11.26.03.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:41:00 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: Add Cortina CS7542 controller support
In-Reply-To: <87jylzyi5g.fsf@bootlin.com>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
 <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
 <87jylzyi5g.fsf@bootlin.com>
Date: Thu, 26 Nov 2026 14:37:51 +0300
Message-ID: <179569307151.4.4443063730583761343@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_034104_918360_CF00B37A 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="fixed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Miquel,

Thanks for reviewing both patches. You are right: I put restrictions of
the initial driver into the hardware binding. The SDK definitions have
two chip selects, 8/16-bit bus support, Hamming with 256/512-byte steps,
and BCH. I have removed the ECC restrictions and described both chip
selects in the local v4 candidate.

The 256-byte Hamming step is intentional for Almond+: it uses three ECC
bytes per step, or 24 bytes for a 2048-byte page, matching the stock
layout. The v3 hardware test read the existing flash and wrote/erased a
temporary UBI volume with that layout. This does not imply that the
controller is limited to that ECC configuration.

I also found the AXI bus attachment, flash IRQ at GIC SPI 18, and flash
reset at global reset bit 14 in the vendor sources. The updated binding
describes these and the banked data aperture. PIO does not claim the SSP
DMA engine shared with the network engine. The driver retains the
firmware bus timing and does not pulse the flash reset at probe.

For the driver, the local candidate now separates supports_op() from
execution and checks the sequencer format/capacity rather than an opcode
whitelist. The Hamming callbacks use nand_read_page_op() and
nand_prog_page_op(), with their commands and addresses passed through
exec_op(). Software ECC uses the core monolithic raw-page helpers.
I have also corrected the parameter alignment and run checkpatch.

v3 had already been posted before these replies arrived. I am collecting
both reviews into v4 rather than sending another partial revision. The
ARM build and tests against the real core operation builders pass; the
new Hamming register/data sequence also agrees with v3 in the host
model. I will check the changed path on Almond+ before posting v4.

Thanks,
Fil


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
