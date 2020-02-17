Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1F1C34022
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 17:48:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1561F20725
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 17:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xda8sm16";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="PLs78hce"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1561F20725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brwcvfl4tJoDg+4lTenZvrFn6qDjs8CoeIORpHq4TUs=; b=Xda8sm16ql+I1i
	t8zXOmZmQRJo97BSQe8NHdIWFrtmeUpn3fPsPXbjiEgXo6ZIPI3ZZly3QqmaFxlCjsimcnBpP7DU1
	kfW3grXns/cgA8xgIy9q0AanQjEsvovBq2tWIFp36jbt4IQPrpvGmINVbhuajRXMSuIfA+WVrhHp3
	z6hA6CME2WXVPRBmBfCx11MFT2oYzxFgWEQbfDSWJj8Idvh0KIl4ODPscJs28VfiubT28uuE7sCA1
	FQfZ+YbkKSicyM+lxNR2DKPydd6vSv/pJD9uaUqCgkOnvKsFHkCmL+txXcvniwgro++rVKlIJ8+DH
	vnrzdjT9n0dX/NAPFa7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3kV0-0005Fh-90; Mon, 17 Feb 2020 17:48:02 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3kUw-0005FN-NZ
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 17:48:00 +0000
Received: by mail-lj1-x241.google.com with SMTP id y6so19835935lji.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2020 09:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rqN5o6dmmXhV4ehVHQNVaCE6tfDNQOKT+IwXmVUCqGE=;
 b=PLs78hcepQ8F9QoAGwkOXvdULHEEkWDPpn471m+hhaWRN7Wl5wAHH+kls/OzIDjbTt
 SgBJEPKUnNH5VFkDvXa1pUFLjOOBCUb9jkgVqbA2o16+38454daWGOK06CTB/dWgok+9
 g1H0n9OiyUAjuBqLhZrA9kA+n1Wji5eS4wQvRiB8+g6/LTupqCLVNBv5gOoj8r+f/3lI
 hazVnbcsJ00xZsXevNTFFDAiD7qhwPn1m3eCGVAnJ39VsMwqZ0/OLSlmUuGZNxYK7inx
 Ao/h9tCM9WEZFVmg8wyxaGlfEdi1Y3ao4j1EmLbvWkFiwdPUfb7EByXvTAkEDcG5Fr6C
 BSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rqN5o6dmmXhV4ehVHQNVaCE6tfDNQOKT+IwXmVUCqGE=;
 b=Imr6U16TFAudtr8tokT0BUVdah9lU1opCfOJE+Lg88QGocaLr6IoVHGpJzblXSBBon
 fnno3WetPvgi0G2n0QIGlgcrG9VhRgOD55BfFPBx8F7c4ZeSzC4c6A8UliPxmLk6B2bu
 E4jE1nz6L5jlNKMvVWEPZXj/sisa1ACOF74wn659K6Co+UvhMw1jlZJFDHaLy01vfRo4
 3B0fKCw+WKAbQO85ay/N34JcPa1RU+w7yytN4dTG4csANPWadgUL+1ggyCXHH4qTqJYp
 gr/zzgTTD+O+WoSudElkwyJFkzsUGTlJFOyS6DHIkWGFDMhkfv7+pRSIGZZlRtDHaYRr
 eHiA==
X-Gm-Message-State: APjAAAW4DoUrRcV74sSKwosmkhLQS696bz3BqrEI9DF8MFiQWSar4YAz
 VeGZW8X3f3x2RTMOqaH3onL0yh9rAz0=
X-Google-Smtp-Source: APXvYqwrhPJfUrtwzV3xJ8Q8MQL+xPDVsnaXpe98F08eGoiFt/DiSUAopBpGMRqqCNjNybp1Kcq7Sg==
X-Received: by 2002:a2e:9705:: with SMTP id r5mr10574564lji.114.1581961675945; 
 Mon, 17 Feb 2020 09:47:55 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4657:d575:d9d1:b468:29b3:bdc4])
 by smtp.gmail.com with ESMTPSA id b17sm874579ljd.5.2020.02.17.09.47.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 09:47:55 -0800 (PST)
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: split spi_nor_spimem_xfer_data()
To: Tudor.Ambarus@microchip.com
References: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
 <002acfc3-39d7-68e7-aa00-fbb449c3bc71@cogentembedded.com>
 <3610712.kb1cmGeq4y@192.168.1.3>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8b64d022-ad84-6c1c-17b2-5d74a8bbc198@cogentembedded.com>
Date: Mon, 17 Feb 2020 20:47:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3610712.kb1cmGeq4y@192.168.1.3>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_094758_949730_1043C100 
X-CRM114-Status: GOOD (  25.18  )
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

On 02/17/2020 01:40 AM, Tudor.Ambarus@microchip.com wrote:

> Looks good. Just a nit below that I can fix it when applying. Let me know if 
> you're ok with the change.
> 
> On Monday, January 27, 2020 10:28:05 PM EET Sergei Shtylyov wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
>> content is safe
>>
>> spi_nor_spimem_xfer_data() being a helper function for the data reads/
>> writes contains 3 fragments that depend on the data direction; and I'm
>> going to add another one to call the SPI dirmap API...
>> I think this function should be split so that the common fragments are
>> put into 2 functions, spi_nor_spimem_bounce() and spi_nor_spimem_exec_op()
>> called from spi_nor_spimem_{read|write}_data(), and the data direction
>> dependent bits moved back into those read/write functions -- that way we
>> would be able to avoid *goto*s otherwise needed in the next patch adding
>> the  SPI dirmap support...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> Changes in version 4:
>> - new patch.
>>
>>  drivers/mtd/spi-nor/spi-nor.c |   91
>> +++++++++++++++++++++++------------------- 1 file changed, 51
>> insertions(+), 40 deletions(-)
>>
>> Index: linux/drivers/mtd/spi-nor/spi-nor.c
>> ===================================================================
>> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
>> +++ linux/drivers/mtd/spi-nor/spi-nor.c
>> @@ -246,55 +246,45 @@ struct flash_info {
>>  #define JEDEC_MFR(info)        ((info)->id[0])
>>
>>  /**
>> - * spi_nor_spimem_xfer_data() - helper function to read/write data to
>> - *                              flash's memory region
>> + * spi_nor_spimem_bounce() - check if a bounce buffer is needed for the
>> data + *                           transfer
>>   * @nor:        pointer to 'struct spi_nor'
>>   * @op:         pointer to 'struct spi_mem_op' template for transfer
>>   *
>> - * Return: number of bytes transferred on success, -errno otherwise
>> + * If we have to use the bounce buffer, the data field in @op will be
>> updated. + *
>> + * Return: true if the bounce buffer is needed, false if not
>>   */
>> -static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
>> -                                       struct spi_mem_op *op)
>> +static bool spi_nor_spimem_bounce(struct spi_nor *nor, struct spi_mem_op
>> *op) {
>> -       bool usebouncebuf = false;
>> -       void *rdbuf = NULL;
>> -       const void *buf;
>> -       int ret;
>> -
>> -       if (op->data.dir == SPI_MEM_DATA_IN)
>> -               buf = op->data.buf.in;
>> -       else
>> -               buf = op->data.buf.out;
>> -
>> -       if (object_is_on_stack(buf) || !virt_addr_valid(buf))
>> -               usebouncebuf = true;
>> -
>> -       if (usebouncebuf) {
>> +       /* op->data.buf.in occupies the same memory as op->data.buf.out */
>> +       if (object_is_on_stack(op->data.buf.in) ||
>> +           !virt_addr_valid(op->data.buf.in)) {
>>                 if (op->data.nbytes > nor->bouncebuf_size)
>>                         op->data.nbytes = nor->bouncebuf_size;
>> -
>> -               if (op->data.dir == SPI_MEM_DATA_IN) {
>> -                       rdbuf = op->data.buf.in;
>> -                       op->data.buf.in = nor->bouncebuf;
>> -               } else {
>> -                       op->data.buf.out = nor->bouncebuf;
>> -                       memcpy(nor->bouncebuf, buf,
>> -                              op->data.nbytes);
>> -               }
>> +               op->data.buf.in = nor->bouncebuf;
>> +               return true;
>>         }
>>
>> -       ret = spi_mem_adjust_op_size(nor->spimem, op);
>> -       if (ret)
>> -               return ret;
>> -
>> -       ret = spi_mem_exec_op(nor->spimem, op);
>> -       if (ret)
>> -               return ret;
>> +       return false;
>> +}
>> +
>> +/**
>> + * spi_nor_spimem_exec_op() - execute a memory operation
>> + * @nor:        pointer to 'struct spi_nor'
>> + * @op:         pointer to 'struct spi_mem_op' template for transfer
>> + *
>> + * Return: 0 on success, -error otherwise.
>> + */
>> +static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op
>> *op) +{
>> +       int error;
>>
>> -       if (usebouncebuf && op->data.dir == SPI_MEM_DATA_IN)
>> -               memcpy(rdbuf, nor->bouncebuf, op->data.nbytes);
>> +       error = spi_mem_adjust_op_size(nor->spimem, op);
>> +       if (error)
>> +               return error;
>>
>> -       return op->data.nbytes;
>> +       return spi_mem_exec_op(nor->spimem, op);
>>  }
>>
>>  /**
[...]
>> @@ -364,6 +365,8 @@ static ssize_t spi_nor_spimem_write_data
>>                            SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
>>                            SPI_MEM_OP_NO_DUMMY,
>>                            SPI_MEM_OP_DATA_OUT(len, buf, 1));
>> +       bool usebouncebuf;
>> +       int error;
>>
>>         op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
>> op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto); @@
>> -372,7 +375,15 @@ static ssize_t spi_nor_spimem_write_data
>>         if (nor->program_opcode == SPINOR_OP_AAI_WP &&
>> nor->sst_write_second) op.addr.nbytes = 0;
>>
>> -       return spi_nor_spimem_xfer_data(nor, &op);
>> +       usebouncebuf = spi_nor_spimem_bounce(nor, &op);
>> +       if (usebouncebuf)
>> +               memcpy(nor->bouncebuf, buf, op.data.nbytes);
> 
> How about memcpy(nor->bouncebuf, buf, len); instead?

   spi_nor_spimem_bounce() changes op.data.nbytes iff the original buffer is
larger than the bounce buffer. I don't want to copy the data which I'm unable
to write put anyway.

> spi_nor_spimem_bounce() does not modify op.data.nbytes.

   Surely it does!

> Using len is more 
> straight forward than op.data.bytes because the reader doesn't have to verify 
> if length was updated in spi_nor_spimem_bounce() or not.

   Sorry, I can't agree with your analysis...

> Cheers,
> ta

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
