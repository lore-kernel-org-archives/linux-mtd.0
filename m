Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB8AC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTSA/mB/Rruqw8RDv55034+HyyCAI9byHfzJBw1xufA=; b=iHlQ6+EJqxW4PllcPNWWh5PP9p
	T38u/RU2Dl2m9xVqut19VoC7sWPlGJMklmD8F6rHExtVriQA+nqhRv94l2EvtC49tsIrC4t6AaIEt
	YsLBv5wy6++P48Eg1hGu9kAjLdz9m0nZVZCAxGgxs8djR+E5LVhODTDvzt6wb619trpvT6rf8EOU7
	jet59+h1MGwVi4Enhg3+cT0bRvtiqRxJ0586jTT8YWj3pdjlLVzw5yO+pPrQ/elmiwmGKBLZ9Q2BU
	LpuBVAzmASjKz89LdpvicCykzmVEPvMSMLDKNyU2OPXOh8cLMjMGhNb9+fS64GOFbu6iE1CTsUuu1
	tmsup3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDYf-007mJj-0D;
	Wed, 01 Nov 2023 15:55:05 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDYY-007mIK-1G;
	Wed, 01 Nov 2023 15:55:02 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 95A5787BA5;
	Wed,  1 Nov 2023 16:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698854096;
	bh=iyw8zwsY5ijQvmD5k0nV3O39/pY983e+DyJ2CvldgGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FthR2FNszaz/2kwepSmHyEiod5ekKR5z9U6lCrwZRKdAPzC4ZU6ryHaiX7iPSZuwf
	 gCjrkVw2vQJYXFMydYAs/wUw7cSJ9vLmG7DqjoZW8Z4VoeRduoK9paG7Jk2mv55taY
	 PBlPxtM1pcsIMkNAszCip0vlaKou4JTiFXNo+H889uF5meU5aFxhrOmVKxGwxRqQrk
	 z+PfoBb3dsGmkSNvuw5HsBu3B/tyarwjfA+bdH+IGJ0YpDy2BV8nY/Hg2W0NL2NIcu
	 hxt6c/QU/CWsmnBjzyumQhdRKYZIRNNl+qRp75v2hKXIZpKHUmeqmfU6uC/RRYhcOR
	 4sY2HlN20j7oQ==
MIME-Version: 1.0
Date: Wed, 01 Nov 2023 12:54:56 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 0/6] mtd: spi-nor: introduce die erase
In-Reply-To: <20231101145853.524045-1-tudor.ambarus@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
Message-ID: <e8304f6ece89a00242611f65122fc4a2@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_085458_811002_9286167A 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 01/11/2023 11:58, Tudor Ambarus wrote:
> The patch set is just compiled tested as I don't have a multi die flash
> at hand. Takahiro and Fabio, please test the series and let me know if
> it works on your side.
> 
> This will be followed by the removal of SNOR_F_NO_OP_CHIP_ERASE and
> implicitly of the old xilinx SPI NOR driver, but let's take it all in
> small bites.

I tested v2, but erase did not work:

~# time flash_erase /dev/mtd0 0 0
Erasing 131072 Kibyte @ 0 -- 100 % complete

real	0m0.007s
user	0m0.001s
sys	0m0.006s

~# hexdump -C /dev/mtd0
00000000  d4 a1 8c 16 ad 4d b2 df  3d 2a af c2 ae 0a 8a c1  
|.....M..=*......|
00000010  5f 2d 7a 17 9f c3 a4 46  cd f9 80 b8 1e 33 43 25  
|_-z....F.....3C%|
00000020  47 dd 81 89 aa 1e b4 aa  26 96 6c 33 74 4f 22 2b  
|G.......&.l3tO"+|
....

If you have some debug patch, I can apply it so we can understand the 
issue.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
