Return-Path: <SRS0=EbIY=4E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4332C3B1BF
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2020 22:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFE292086A
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2020 22:40:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IiVllHGT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Cc98pINV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFE292086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJ1AcrD/r1i61djy6imQocWphVqOqMH+ONnX2DLZvcE=; b=IiVllHGTbYRBwx
	hDFX3QjUnyuckol8cTDk33u+huGAOQRSTjyXcu/HTQ9f4kQdlKk8h5QNiaIn8k05FQ1LYPsAJFiOg
	ak5RnK36Vjvrl0IJYsZk1x5hcMc/MOXF7tDUvFsOHtNI5nk7KHy7FMiOGFQcExwFqTxiAU474c1mz
	Y5G9P+XBHFtpTKLFTzT4w9QY35HeY+c3kk1EbOwRnV7Shcn/FgRnXRFEYuKvSN5cWsvqJcl2DDfJZ
	gWsbl0PqSS3A6i9ZaGuphmJ1JEdTPnIaqFOuF5dbCUsGmst+yjsw13JnWcBvhe4ivljo2rJW+t6l2
	infvUOBMePxUf6luKJlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3SaX-0008Gx-9x; Sun, 16 Feb 2020 22:40:33 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3SaR-0008GR-NN
 for linux-mtd@lists.infradead.org; Sun, 16 Feb 2020 22:40:31 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: CaYCf9zCRlhkDUdlDyvHcrjYhPgQ0sws2tkjyJz80EqsCO45cudY1XrSXHpAQaQvWo03RR0TXh
 YudU8ySNSDiXYIPXwNQhoWyigWM8MWzFIGpiJq0tmCBAmAVKDZldmu8yfjKm1uXQ/eF7y4ta0C
 yPe3EBPZS38Qrmlj+iTcI8NgeZXA251gTHsPWMVJqTFpLpT3o9DrTQNUgKlK8yZhaqT62PW/wB
 5U7ZOcUjmQnjxRri1/NQLFf6BOumOtEvwOq681qcBrkmQnzfYFw0GQhewFC4wx6qMw6HXZkFL9
 j2k=
X-IronPort-AV: E=Sophos;i="5.70,450,1574146800"; d="scan'208";a="68695047"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Feb 2020 15:40:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 16 Feb 2020 15:40:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 16 Feb 2020 15:40:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXzSDNzGbxtY71fPUecrnIuDUk8uDW8xwY3ZSnFZtsKJM6994YNiTr8AdrvTaqI7g3oP1/07BNrnXgTBL6TjvSTcqEsBR9UYg8EJxNWdb2zSJjvA9iP83ghkpHZ8j5ALgOoYNgcawnee6eALAvTQdc/fRc/wU9YZOUBEOaZCiQtwB85+Fy4lekdF01qHFFr2GmEzCJrYjZxnMjp2No34gJ3+p5FUCNRAA5ZKtETHh04wlMMrX2T308CO1i/hg4Wmi0APpKJaWePiGTUIAni9BhNyQRreons2m6eqpZ92Fk7tCaqQm8SrnFkxoXxtbe6oP/y5QbPHigGGVLRgNRcQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qMYRk8CWBNZvQ4RQtmCJWFdFzHJOUq+CDwjdFlletc=;
 b=iRq82aVUZBTzswGQYhVRZmek60IX66/nbZg+Gd67jXlopSft5FhrDfnYToI+nP8WPD7HmGqFbcUQO61JVL2WfMcBiuiNG0gifXclcHIL9wk3/heS94f+IEFwEsWDtHPM/T0cXVcuINCXFHo7VlcZ8wHM9XjXQymqMXCQ453s5S+AN+ar+HiEdTXVB6cST+HP7ImVHik9KOxOFfn3Nefyyuzdr9ZHXkT2AVoPXU9dBVD1LDowMV3lSDX+slMY+Dz3g+/RpryZ7aL4p2YnMPIFSMJL1q6UMLo0r/clHf1tyxp4RhWoLb2mw8yG0x4KYyVRc/Z1nburwRQwz74z2Fffrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qMYRk8CWBNZvQ4RQtmCJWFdFzHJOUq+CDwjdFlletc=;
 b=Cc98pINVuZYXj+dGLKHEhA8w9FVI4KKIi/hAbdxaLkbg3iisRziFLoXDJ1lZTMLvmYtlmspA2FrOWo7CI/SV7zKm/3GsOZGWybG01VeDYhMcQwX2QFTeflGH8NnYWFp9Wl8wXN0XJp6bechJzRK8v5XTIfN1bA2prsvEgnhU+nM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3584.namprd11.prod.outlook.com (20.178.251.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.27; Sun, 16 Feb 2020 22:40:16 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2729.031; Sun, 16 Feb 2020
 22:40:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: split spi_nor_spimem_xfer_data()
Thread-Topic: [PATCH v4 1/2] mtd: spi-nor: split spi_nor_spimem_xfer_data()
Thread-Index: AQHV5RoO+dLVObWxSUm6qyhiD07YcQ==
Date: Sun, 16 Feb 2020 22:40:15 +0000
Message-ID: <3610712.kb1cmGeq4y@192.168.1.3>
References: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
 <002acfc3-39d7-68e7-aa00-fbb449c3bc71@cogentembedded.com>
In-Reply-To: <002acfc3-39d7-68e7-aa00-fbb449c3bc71@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d158458-a7ae-4b71-0a54-08d7b3313187
x-ms-traffictypediagnostic: MN2PR11MB3584:
x-microsoft-antispam-prvs: <MN2PR11MB35841192085DDC8FB7AD5EE3F0170@MN2PR11MB3584.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03152A99FF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39850400004)(189003)(199004)(8936002)(91956017)(478600001)(53546011)(6916009)(316002)(8676002)(6512007)(9686003)(6486002)(76116006)(66946007)(66556008)(64756008)(66446008)(6506007)(66476007)(2906002)(4326008)(71200400001)(14286002)(86362001)(54906003)(26005)(186003)(81166006)(5660300002)(81156014)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3584;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p4SqPbHNWkO6hp2tm3jrm5bS43tZjpjYEmXtu68xhgYWD5EQ1pKY0umoHVchSgYJZsrjiS8cgO//9brI0ArSeazEPhYYKL7hqZoIpKIAuhaHVw5KqbGSzj5skruct8MMyjTeZVSpnggn1uuYF4kJXiYg9O4MmYCupIHMDyuSWRSrztpacBRz+w8jv4TpJ8DjLJrRqDpTcMlq/RjLDCxBM7UfHqY4uzEpJZrWBmQtRbwPdkHtGe5xz5zapqsy3q+jpzmSCOBqsUqXep/l/MdejIYLasWCdbrQQLO5YUTiJPkSUFv+SQ45UecrRaKAdT7JFwKPrD8x+POYnRdsXMHDDXBt4YuxWKinMBDviaedN5mEqnrWwCk/4noz7c2ujCCxfuPKGp6lZJpwKGz9Qae3qdv75mMlIHFr3wsEDgsaiHlkakXGnLwzF9hn3APB8qMnAKJzx2hjlisNQTFubheAC5F/o0D4ul2qY56kV7kqIutw5WHWrTWgGzAjd+RA5W9n
x-ms-exchange-antispam-messagedata: EvctC+JNDryVkvKDko0ttg4GlClGJ/2N1CDoQosJfhjB8QYoiBTyh8EurAWk+xRCrvazbyWgyLV45gab316/dUIdQ5pyzQTyqjmE7CH8fLasiTql3FqgDIpsy2RZ+cXowv95jUKRiiZfNOXXi844aQ==
x-ms-exchange-transport-forked: True
Content-ID: <DBC69D2077E4A442B5F02BC0B77E6545@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d158458-a7ae-4b71-0a54-08d7b3313187
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2020 22:40:15.9918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GP9rkLUtF7Dq3yWpSegNs7FDXgNjlkCTvA2L2QKqI0uvC8b/5psY/KXRsdtbW/aB60pSYGk0Le5m/p5829uqsCdxWjoh6Py6aG9U8S6Qsd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_144027_773922_9A558761 
X-CRM114-Status: GOOD (  21.20  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Sergei,

Looks good. Just a nit below that I can fix it when applying. Let me know if 
you're ok with the change.

On Monday, January 27, 2020 10:28:05 PM EET Sergei Shtylyov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> spi_nor_spimem_xfer_data() being a helper function for the data reads/
> writes contains 3 fragments that depend on the data direction; and I'm
> going to add another one to call the SPI dirmap API...
> I think this function should be split so that the common fragments are
> put into 2 functions, spi_nor_spimem_bounce() and spi_nor_spimem_exec_op()
> called from spi_nor_spimem_{read|write}_data(), and the data direction
> dependent bits moved back into those read/write functions -- that way we
> would be able to avoid *goto*s otherwise needed in the next patch adding
> the  SPI dirmap support...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 4:
> - new patch.
> 
>  drivers/mtd/spi-nor/spi-nor.c |   91
> +++++++++++++++++++++++------------------- 1 file changed, 51
> insertions(+), 40 deletions(-)
> 
> Index: linux/drivers/mtd/spi-nor/spi-nor.c
> ===================================================================
> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux/drivers/mtd/spi-nor/spi-nor.c
> @@ -246,55 +246,45 @@ struct flash_info {
>  #define JEDEC_MFR(info)        ((info)->id[0])
> 
>  /**
> - * spi_nor_spimem_xfer_data() - helper function to read/write data to
> - *                              flash's memory region
> + * spi_nor_spimem_bounce() - check if a bounce buffer is needed for the
> data + *                           transfer
>   * @nor:        pointer to 'struct spi_nor'
>   * @op:         pointer to 'struct spi_mem_op' template for transfer
>   *
> - * Return: number of bytes transferred on success, -errno otherwise
> + * If we have to use the bounce buffer, the data field in @op will be
> updated. + *
> + * Return: true if the bounce buffer is needed, false if not
>   */
> -static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
> -                                       struct spi_mem_op *op)
> +static bool spi_nor_spimem_bounce(struct spi_nor *nor, struct spi_mem_op
> *op) {
> -       bool usebouncebuf = false;
> -       void *rdbuf = NULL;
> -       const void *buf;
> -       int ret;
> -
> -       if (op->data.dir == SPI_MEM_DATA_IN)
> -               buf = op->data.buf.in;
> -       else
> -               buf = op->data.buf.out;
> -
> -       if (object_is_on_stack(buf) || !virt_addr_valid(buf))
> -               usebouncebuf = true;
> -
> -       if (usebouncebuf) {
> +       /* op->data.buf.in occupies the same memory as op->data.buf.out */
> +       if (object_is_on_stack(op->data.buf.in) ||
> +           !virt_addr_valid(op->data.buf.in)) {
>                 if (op->data.nbytes > nor->bouncebuf_size)
>                         op->data.nbytes = nor->bouncebuf_size;
> -
> -               if (op->data.dir == SPI_MEM_DATA_IN) {
> -                       rdbuf = op->data.buf.in;
> -                       op->data.buf.in = nor->bouncebuf;
> -               } else {
> -                       op->data.buf.out = nor->bouncebuf;
> -                       memcpy(nor->bouncebuf, buf,
> -                              op->data.nbytes);
> -               }
> +               op->data.buf.in = nor->bouncebuf;
> +               return true;
>         }
> 
> -       ret = spi_mem_adjust_op_size(nor->spimem, op);
> -       if (ret)
> -               return ret;
> -
> -       ret = spi_mem_exec_op(nor->spimem, op);
> -       if (ret)
> -               return ret;
> +       return false;
> +}
> +
> +/**
> + * spi_nor_spimem_exec_op() - execute a memory operation
> + * @nor:        pointer to 'struct spi_nor'
> + * @op:         pointer to 'struct spi_mem_op' template for transfer
> + *
> + * Return: 0 on success, -error otherwise.
> + */
> +static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op
> *op) +{
> +       int error;
> 
> -       if (usebouncebuf && op->data.dir == SPI_MEM_DATA_IN)
> -               memcpy(rdbuf, nor->bouncebuf, op->data.nbytes);
> +       error = spi_mem_adjust_op_size(nor->spimem, op);
> +       if (error)
> +               return error;
> 
> -       return op->data.nbytes;
> +       return spi_mem_exec_op(nor->spimem, op);
>  }
> 
>  /**
> @@ -315,6 +305,8 @@ static ssize_t spi_nor_spimem_read_data(
>                            SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
>                            SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
>                            SPI_MEM_OP_DATA_IN(len, buf, 1));
> +       bool usebouncebuf;
> +       int error;
> 
>         /* get transfer protocols. */
>         op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
> @@ -325,7 +317,16 @@ static ssize_t spi_nor_spimem_read_data(
>         /* convert the dummy cycles to the number of bytes */
>         op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> 
> -       return spi_nor_spimem_xfer_data(nor, &op);
> +       usebouncebuf = spi_nor_spimem_bounce(nor, &op);
> +
> +       error = spi_nor_spimem_exec_op(nor, &op);
> +       if (error)
> +               return error;
> +
> +       if (usebouncebuf)
> +               memcpy(buf, op.data.buf.in, op.data.nbytes);
> +
> +       return op.data.nbytes;
>  }
> 
>  /**
> @@ -364,6 +365,8 @@ static ssize_t spi_nor_spimem_write_data
>                            SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
>                            SPI_MEM_OP_NO_DUMMY,
>                            SPI_MEM_OP_DATA_OUT(len, buf, 1));
> +       bool usebouncebuf;
> +       int error;
> 
>         op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
> op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto); @@
> -372,7 +375,15 @@ static ssize_t spi_nor_spimem_write_data
>         if (nor->program_opcode == SPINOR_OP_AAI_WP &&
> nor->sst_write_second) op.addr.nbytes = 0;
> 
> -       return spi_nor_spimem_xfer_data(nor, &op);
> +       usebouncebuf = spi_nor_spimem_bounce(nor, &op);
> +       if (usebouncebuf)
> +               memcpy(nor->bouncebuf, buf, op.data.nbytes);

How about memcpy(nor->bouncebuf, buf, len); instead?

spi_nor_spimem_bounce() does not modify op.data.nbytes. Using len is more 
straight forward than op.data.bytes because the reader doesn't have to verify 
if length was updated in spi_nor_spimem_bounce() or not.

Cheers,
ta




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
