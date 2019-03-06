Return-Path: <SRS0=kH4D=RJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1143C43381
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 14:08:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9177A206DD
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 14:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="do89TizB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB8SnwCc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9177A206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=IwUSd+Vhq5gCD0qitB6GgFKU40e6EFuw5iJwOWVlvMg=; b=do8
	9TizBK/y3J2h4hhBfaeQ5Ob1N/10r10b6nO/oSwUtbb1dVPvu9kP8hrZfLeWykJWeOMHKjqVoMf2A
	QIuOoTG7SkfD6ZXYLeg18fklWpYCNPVCjTHa2WPPYosN/pKOEuR0alHCgpw6VlsTH8lPsyooYKGSv
	lV/4l5MFATHHvL1+5HpJG3vybO6xeI97TADOM1Jjic276E4+zc6Ih0PqfkKOpOJFhgaOjeBJqQwUf
	qt1L7wVbX+0Fq2pm/9mofs8bDXq2mregwOyftyth7c7NcE6SF/TQY9HhJgjjC6MQMs501K5t5YaLC
	NRdlC9yCaiSbl5z4YjWn8C7RP9xvGKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1XDd-0006zW-Ed; Wed, 06 Mar 2019 14:08:25 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1XDa-0006z7-Ep
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2019 14:08:24 +0000
Received: by mail-ot1-x344.google.com with SMTP id n71so10799236ota.10
 for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2019 06:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=P2lE/VfgoJg1Jq8ZGRhUNszH8kRBipWe35bkHhwScDU=;
 b=NB8SnwCcaoG7rMm6KR54Ckj6P3mMa8QzMpmxOongRDgyCuhJKuFVh053TEdxQ+2oxi
 X6s3Lt9ysEAxNsvLsJ7hA2RErEpF1EbYoIdITgAZyWGtpG3SPYUZy9iIe5UojXxsb1RD
 RaMnVdsMQ0v+aBonBxdphQVWHYeq6HF5isqgHmLtUA2ATj+o61vOIUunBbVefY95duxp
 Rq6ffD9MErESGu5qYPsePmCb2oOc6YOAJH2x/tOWYabfWaU5X+egi+7rD/YJxgRCPQOk
 i3DJdPGbpTpcuAfvtAMSGIna56TuMi7mCRTDsscwf8ezxtdfMuN8nGTmthPXxPkxFr5E
 SnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=P2lE/VfgoJg1Jq8ZGRhUNszH8kRBipWe35bkHhwScDU=;
 b=MOVzaBoQLA8/bGMu3jWY0FZ2fP+sUGE18VC3ZZ02cWDzUAoo+xBxSwO7fJ/haiI5WT
 ATh5oMKf2u8MncFd/7Rh/zBw3Eo9GutZuJJyxisRm8pLXnvR9lSBmd2HFTLtxfhtTDvv
 nsVXkFInpPM8VnsZIGx9ZZ4wtop9QuCNhu2epcpbSv3aYgZzL35dMkU3+kZH/3R1CX+1
 C8pNiaKFEHS7tOkZrx3Zan84fqqT23xA2IvpLltL2Korm/ZSMVk//RdNYyjXYINotJcP
 A5f67vA4GVLUqfBWOaEGbQb6ip+mM7UGu5Uvzp9EYu1tyMrW0+w83PaIRWOun3OhnXSZ
 Wn9Q==
X-Gm-Message-State: APjAAAX9Y2wLWi/5I2DLn3M7X8LgJdXjgSD7Z0cBix9Ib8tLgBrkSYlo
 1lSnZHF3trJiqejaIJAGsSnFGq3rDBPP9RkzeK7wT6I=
X-Google-Smtp-Source: APXvYqzWsz4sbLjYcQAvfVNXqgomdAP8ZzmRu88bnz6QkazUTdn+nrQzTiALDHQM3fJA89aT66Xvi+zyEpSOvbCx64E=
X-Received: by 2002:a9d:803:: with SMTP id 3mr4805723oty.4.1551881300333; Wed,
 06 Mar 2019 06:08:20 -0800 (PST)
MIME-Version: 1.0
From: Sebastian Falbesoner <sebastian.falbesoner@gmail.com>
Date: Wed, 6 Mar 2019 15:08:11 +0100
Message-ID: <CACi0ghs0q1B14mpZOjZB0shm65fDydzYxnaYza4LMZ-cZqZZsA@mail.gmail.com>
Subject: mtd: fsl-quadspi: kernel panic in fsl_qspi_nor_write() due to access
 across page boundary
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_060822_511443_FBC96183 
X-CRM114-Status: GOOD (  11.33  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hi,

we noticed that whenever we copy large files (several MB) within a JFFS2
partition for a flash memory using the fsl-quadspi driver, sporadic kernel
panics happen, e.g.:

--------------------------------------------------------------------------------
Unable to handle kernel paging request at virtual address 7fe54000
pgd = 88ce4000
[7fe54000] *pgd=9fd5b811, *pte=00000000, *ppte=00000000
Internal error: Oops: 7 1 PREEMPT SMP ARM
Modules linked in: [...]
CPU: 0 PID: 621 Comm: _SVM Tainted: G O 4.1.15-1.2.0+g77f6154 #1
Hardware name: Freescale i.MX7 Dual (Device Tree)
task: 88468000 ti: 88d60000 task.ti: 88d60000
PC is at fsl_qspi_nor_write+0x74/0x13c
LR is at fsl_qspi_write+0x34/0xa8
[...]
[<80362314>] (fsl_qspi_nor_write) from [<80362410>] (fsl_qspi_write+0x34/0xa8)
[<80362410>] (fsl_qspi_write) from [<80360c04>] (spi_nor_write+0x134/0x178)
[<80360c04>] (spi_nor_write) from [<80358c78>] (mtd_writev+0xa4/0xec)
[<80358c78>] (mtd_writev) from [<8020b5d0>] (jffs2_flash_writev+0x3f0/0x480)
[<8020b5d0>] (jffs2_flash_writev) from [<802047b8>]
(jffs2_write_dnode+0xc8/0x320)
[<802047b8>] (jffs2_write_dnode) from [<80204f74>]
(jffs2_write_inode_range+0x21c/0x2c0)
[<80204f74>] (jffs2_write_inode_range) from [<801ffc8c>]
(jffs2_write_end+0xe0/0x1fc)
[<801ffc8c>] (jffs2_write_end) from [<800a3ec0>]
(generic_perform_write+0x114/0x1ac)
[<800a3ec0>] (generic_perform_write) from [<800a58bc>]
(__generic_file_write_iter+0x178/0x1c8)
[<800a58bc>] (__generic_file_write_iter) from [<800a5a48>]
(generic_file_write_iter+0x13c/0x258)
[<800a5a48>] (generic_file_write_iter) from [<800e05dc>] (__vfs_write+0xa8/0xd8)
[<800e05dc>] (__vfs_write) from [<800e0d84>] (vfs_write+0x90/0x16c)
[<800e0d84>] (vfs_write) from [<800e159c>] (SyS_write+0x44/0x9c)
[<800e159c>] (SyS_write) from [<8000f400>] (ret_fast_syscall+0x0/0x3c)
[...]
--------------------------------------------------------------------------------

After analyzing the backtrace of several panic incidents we came to the
following conclusions:

- the panic happens in drivers/mtd/spi-nor/fsl-quadspi.c:fsl_qspi_nor_write() in
the following loop filling the TX data into the FIFO in 4-byte-chunks, when
the txbuf pointer is dereferenced:

static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
                u8 opcode, unsigned int to, u32 *txbuf,
                unsigned count, size_t *retlen)
{
    int ret, i, j;
    u32 tmp;
    ...
    /* fill the TX data to the FIFO */
    for (j = 0, i = ((count + 3) / 4); j < i; j++) {
        tmp = fsl_qspi_endian_xchg(q, *txbuf); // <<<<< BOOM!
        qspi_writel(q, tmp, q->iobase + QUADSPI_TBDR);
        txbuf++;
    }
    ...
}

- the virtual address where the access causes trouble is always in the form
  .....000, i.e. at the beginning of a page
- the parameters "txbuf" and "count" are set such that the very last byte has
  the virtual address in the form .....fff, i.e. at the end of a page

Obviously the bad case happens whenever we have the TX data pointer is unaligned
and the data is at the end of a page -- this causes the last iteration of the
filling loop to have an access across page boundaries, for example:

       txbuf (count=2)
         |
         v
...-+---+---+---+ || +---+---+---+-...
... |   | X | X | || | X | X |   | ...
...-+---+---+---+ || +---+---+---+-...
                  ^^
                   \\ page boundary

The one iteration would dereference the txbuf pointer, which accesses two bytes
within the valid page, but another bytes in the next page which we are not
guaranteed to have access to, which in turn can cause the kernel panic.

The obvious solution would be to guarantee that txbuf is aligned, but since
the calling function of fsl_qspi_nor_write() simply casts an incoming u_char
pointer to an u32 pointer, it is not obvious for me where to fix this:

static void fsl_qspi_write(struct spi_nor *nor, loff_t to,
        size_t len, size_t *retlen, const u_char *buf)
{
    struct fsl_qspi *q = nor->priv;

    fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
                (u32 *)buf, len, retlen);
    ..... //    ^^^ this cast creates and unaligned memory pointer
}

Any recommendation on how to fix this problem?
Isn't unaligned memory access generally considered a bad practice in linux
kernel (according to Documentation/unaligned-memory-access.txt) and should be
avoided?

Best regards,
Sebastian Falbesoner

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
