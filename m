Return-Path: <SRS0=69qN=CA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345CEC433E1
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Aug 2020 18:12:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6FC2075E
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Aug 2020 18:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q18NYnEq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="o/v38s59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD6FC2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yZIQo8gYpOM5KhAbzGE2YNBdGfF5b48YwTDg8N4ohMc=; b=Q18NYnEqhw93qFCmAmXaaPh3B
	TUk9NiI83HWAWSb07FrXaxQKPbj6KrzY4uk6yQeEUVf5z2oXZ0OAVuhwL++u1TETHs0xWjOPAUpDB
	2YHfenyAdiV5yh+4qWe4ZpTkKGtAeAHstX9BiO+C7CRbxMZH72X+2yYDtPtt3pk9DNoK/WRivvqDf
	vzoRqWQ9o/HLJAoUKjquDqlAArKrqYjzhWSx+Ip9Q+r48PEFqoN9t1ztXilkoIjMF1UhVwAbFR+Nn
	WAUuw4E8SAQCItgzAd9DwKHPQqAUNejX4qqrISFw7asz+nNkV3exnOjiMp/dSipnbtgUQdtc0ZQFh
	kMD8QGChA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9XzF-00083M-Jm; Sat, 22 Aug 2020 18:11:29 +0000
Received: from mout.web.de ([217.72.192.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9XzC-000830-Se
 for linux-mtd@lists.infradead.org; Sat, 22 Aug 2020 18:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1598119882;
 bh=vqmZKLUdXbY5nwzVsXWwpkYlcF0MgWyETqIDMvEK2ww=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=o/v38s59wwtFXjFqnfJAVM+2l+9bZwOWqucb25mrNA98jEqWij2TW0OFmrJd6O35t
 zEBwD4C7Z6BTpeTYItK/KqSjXoSM5ckprKR+/Ik7q7WbpVlR4YS0nK97nUeQmc2al+
 thCMHUlPvVvUcJ2IGoXlug2k3OxGDVJuN9QFfiYc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LzsKN-1kehgj0lTn-0150pp; Sat, 22
 Aug 2020 20:05:42 +0200
Subject: Re: [RESEND PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle probe
 deferral while requesting DMA channel
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown <broonie@kernel.org>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200601070444.16923-6-vigneshr@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Autocrypt: addr=jan.kiszka@web.de; prefer-encrypt=mutual; keydata=
 xsDhBEq0i8QRBAD2wOxlC9m/8t/vqjm1U9yQCT6OJ2Wbv/qys9DYM0CvcOTDMWQwmV1/VsZj
 KR5YgB5NPt+To7X6x5cjz15AGnx5Fb8Wnrq8EF9ZfHMwb7YMx1LdPYPDnXr37wE3XupFmkHB
 Mes4htyX7Dz8LvKDLnli4IsAmWG+kV1JI6LWKXLpSwCg8JRq4SWoB4VCQxbH3GjntgvwNc8D
 /2q5Dj0urJ7s7sdXhrH0hcFkpSFRmU5Yd6MCwcbFHm2paL5gqVjNNUUwDBKAL9eZaQVIHKwC
 44BvNGO2gcQ26R3AuCHUQ+pZHg34tok1JCNZ6IEZccb+33Qq0qbcDMJJiDYp7ppp6ozifvc4
 YaqJECX48IydxfE9+41oV7T5vNAzA/QL/UMJyTnu5jiOXcyn5iFQw535lXkwKsqeXzCowLho
 HICZ2jITJPdTT/+9pGWwMQqST/SS35Tx4EnS3z2BWsNMCLuXCPkxF1elaMJqMfMJxFD8rAgS
 9GK6zP6fJlsA1wq/UvKSL8v4QPOnTNCVOsyqJVasGV0ZPcDfcj+ClNO4zR5KYW4gS2lzemth
 IDxqYW4ua2lzemthQHdlYi5kZT7CYwQTEQIAIwIbIwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
 BQJOpoNtAhkBAAoJEIrUrG965ecUOPUAoK+Rh12KgCjplHAS0AoiGKwGOuq7AKDEVnBtRAoy
 VRvp3lOlOx+P2Ay56M7BTQRKtIvEEAgA2/PlX6oyi7dToH0CJCHq0eKmZaa7CmGaVnxyeepK
 vIfiM8n8Td76AbG64fjREMwgSpb4F/UytF3z/03tj4e49W/zKjbBRB2/wmFRlZBC9crg22Q+
 bgvMOsxnC6uHXaWN8fL+jVei/5OoHOoFqaMsX8EvploitlI/BPj+VgW26jksf3YZyk1hncls
 Z/IYhXzgRmVJo4RiTW/YLQAkwndwc+fKPa/IYLEDW1Jc4kNLoK0P90b45zju0hpl0C00pVOR
 TOtzFK9G5Ha7qOAWJfAVJORHKAkkvwftf3hkpPdLyvZUWRHXvUexmA61fLvDBAFhRxYGD8t5
 gz88SF5Tzq+0ywADBQf/YSkaYrEslPWiCA2wU6EW0yaqBQAobFsOMvsufJ6o2ntq5Ncq37VI
 3KCT67eHPE9x+zPcENoZWsRrC9S9PCf1LOsi7ybZsR13AJqDFlRzJZ4klh9QwgwFZxUBzOdI
 vttwzG1QkzHx06RKZluFYpPF3DRduSMukdIJ2wmWCU+ohB+mYefe65JGjYQfHVs8mgYVFOPx
 bRea9VJACCMuspoZWpj43UdR1lLLyIUFYz+jqcPW7Hd/GTIw4N67pYl0dwPDmFd4ohJ5g4Zp
 q61toNysBGEuEm5GCcn0VmGtQpSYnR5cVm5b2yPz4bIuFOSuZUo/l7vitdY0iy0/wvKbBC+N
 K8JJBBgRAgAJBQJKtIvEAhsMAAoJEIrUrG965ecULvAAoKGvxs5T3IhyQT8I8sMsyAvCE4wH
 AJ46S16yab+OxNkvOeoOEX0EnHVHaA==
Message-ID: <6c8d9bff-3a67-0e6c-d4d1-36b7ed5007b9@web.de>
Date: Sat, 22 Aug 2020 20:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200601070444.16923-6-vigneshr@ti.com>
Content-Language: en-US
X-Provags-ID: V03:K1:hCenLna7MCOUeAI4+VL4obs74pBpCBkM2pUpeokFBIpNPqVJ7qy
 llQeNekQUK5OXczTRJBvmPs+UzMi/4pD4Y8FHsK9HHHskJNM2nyQaQ4tq5ELxNSRqes+ZAT
 ltdjbF7sO1HoTFPg/P17RBEDc4KPdMa7mltzRyFlDIxT6PDcf5/fmxi7Zd205yYgTA+MmDo
 y9UZr3F9IxKy+Eb5kaZ7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8uMwgJtm+B0=:4cqhnihDvuz3UGykIwIJFG
 FsD7HFzJvwwqR2AVoqumiJkYgWYzyNLI/qDGlmZWpueiZ7VBO/jbj3q6pSjx+zEaZNmZmXzgL
 M51cszy/OOj5TqpJzfv9fmGD7CuUFM3fKouK5vKV90rF0pFM4Dr8oUANOu5xzB1fI37XdNt21
 8g12s0oX8SOUGKdKTMmF51mDZxiIdUXkeWc4VDu92B9BXzpuCcMVgksZoDxTP1DgMm9TFEq9D
 kQV4Lba7j0Y2U2rrxft05uuc1L+ELjQrorbwVBYPaqY9gUt5QWnwG6kJfvmw06zecy+6jZiVp
 DfNVps6CgAI1fzq40nnbyDBqDUb9ddlO3dWRkpm1oaP8EF1Hfj9JLXQE31iJ8ZrUQCdgTo7e/
 thJfK0yuclXktEZEHAB3J04dz6xMeAZy2Yk0WOP3gEqFQ2wj+bz65e7Qr84HzXb8554FVS6m/
 hmfwvoZPizXcBMj3AS33waLy6D4EVJc5nlGkI9SY3kiimdLWpckLfImNBNLHejETscbDd1CwJ
 +R7IME19PRe8U6nPvw0oVXHc7H+fI2L7BLwetNV6h1DoNOa3hVgVfzR7dz2PaR47bqcPVlRX0
 7ZWnwER593F/YxIXw5rCRjR+tTh47J4bpVljBKVULvAYHM/yBTRLXpCNMJ0tS3p1FiKcBn/t5
 lLjFKrztfYk/7sq4n+z0QVGqpPS2C7tU03xbuz+kSYQgn9lKltto0CIvgePRgCGHqsSUdB0yY
 yDazy/mLpfbU3JTcQtQCpS9SBCLdXavZJCRGvo7rzrZAkW9C9wgWjzke8610admSBvIve/47Z
 elyXwb0TgGurz/pgKwPJiZfC4v2N93Ke+sTnN9J4gDEZ3mDXv0oBK5yNKyD7B0xUxfTRpnhqh
 O2Dqv7fX0fyyvw1suVV6v2Coh0ToyoOrTNCXOYfUQLMOCdbML4IDvymRJ857wUy/qaiXvaxRj
 oGqMoseT7+iSCA/9VNZiUrT8VYQspq+yX5EWXbbpPMIfWxuErYrP7V1Dm/mIDVpKtgaYXmiBt
 i/IaCa0pB6J76j1D7vH3dmn09ZMjMn3Kgt3M2DQnE41ufwgtZAc2I0RvT2Ipcaka4WZw4geuw
 KwvrAR16jYDEiRxSF2u3Wd9AVektw4sY1BU+c2gAtlUeNJlGeGYyY5rEpra6I3X6Q++xLCTNc
 IMJbIPNSSYfI1/0nbrVT5VZHmBgEoZFLfPil/fUNQ2qlohM4haUhkKRr1nfIgiIhtIaD2gPX8
 VmVvuNQnHt73bsqJ4N2cvf3v7Uj8Vpf1yv0cQcQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200822_141127_137332_DC4B431E 
X-CRM114-Status: GOOD (  20.83  )
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
Cc: marex@denx.de, Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01.06.20 09:04, Vignesh Raghavendra wrote:
> dma_request_chan_by_mask() can throw EPROBE_DEFER if DMA provider
> is not yet probed. Currently driver just falls back to using PIO mode
> (which is less efficient) in this case. Instead return probe deferral
> error as is so that driver will be re probed once DMA provider is
> available.
>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  .../mtd/spi-nor/controllers/cadence-quadspi.c  | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
> index 608ca657ff7f5..0570ebca135a9 100644
> --- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
> @@ -1169,7 +1169,7 @@ static void cqspi_controller_init(struct cqspi_st *cqspi)
>  	cqspi_controller_enable(cqspi, 1);
>  }
>
> -static void cqspi_request_mmap_dma(struct cqspi_st *cqspi)
> +static int cqspi_request_mmap_dma(struct cqspi_st *cqspi)
>  {
>  	dma_cap_mask_t mask;
>
> @@ -1178,11 +1178,16 @@ static void cqspi_request_mmap_dma(struct cqspi_st *cqspi)
>
>  	cqspi->rx_chan = dma_request_chan_by_mask(&mask);
>  	if (IS_ERR(cqspi->rx_chan)) {
> -		dev_err(&cqspi->pdev->dev, "No Rx DMA available\n");
> +		int ret = PTR_ERR(cqspi->rx_chan);
> +
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&cqspi->pdev->dev, "No Rx DMA available\n");
>  		cqspi->rx_chan = NULL;
> -		return;
> +		return ret;
>  	}
>  	init_completion(&cqspi->rx_dma_complete);
> +
> +	return 0;
>  }
>
>  static const struct spi_nor_controller_ops cqspi_controller_ops = {
> @@ -1269,8 +1274,11 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  			dev_dbg(nor->dev, "using direct mode for %s\n",
>  				mtd->name);
>
> -			if (!cqspi->rx_chan)
> -				cqspi_request_mmap_dma(cqspi);
> +			if (!cqspi->rx_chan) {
> +				ret = cqspi_request_mmap_dma(cqspi);
> +				if (ret == -EPROBE_DEFER)
> +					goto err;
> +			}
>  		}
>  	}
>
>

This seem to break reading the SPI flash on our IOT2050 [1] (didn't test
the eval board yet).

Without that commit, read happens via PIO, and that works. With the
commit, the pattern

with open("out.bin", "wb") as out:
    pos = 0
    while pos < 2:
        with open("/dev/mtd0", "rb") as mtd:
           mtd.seek(pos * 0x10000)
           out.write(mtd.read(0x10000))
        pos += 1

gives the wrong result for the second block while

with open("out2.bin", "wb") as out:
    with open("/dev/mtd0", "rb") as mtd:
        out.write(mtd.read(0x20000))

(or "mtd_debug read") is fine.

What could be the reason? Our DTBs and k3-am654-base-board.dtb had some
deviations /wrt the ospi node, but aligning ours to the base board made
no difference.

Jan

[1] https://github.com/siemens/linux/commits/jan/iot2050

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
