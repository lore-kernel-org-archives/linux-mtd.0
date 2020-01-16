Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2F2C33CAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE8F2064C
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 23:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ukLd+Vio";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpy0k+VD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE8F2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MTHHD0sQON8F9X4wB2ZofbEhMZL5P/LKFSwXx21m3A=; b=ukLd+VioqL5J2t
	cMiJ6snf530sVqYUDTw+OsVaRjqJ+tjSxfsMxVJs6h+b3TjlVtm72ej7JNry5ZVeY0j5DmRnNl9iG
	ctlG1qOSC3cE8SFKx1zBudiiTlj4Tfv9ZMlNXlOy4wcPqzfIG6zhDAa5Y3Fhz4lOW+3k7MpyRCDce
	50hN2BmE8Eweppw4riys7DJqLjLMbKl5DVfQ2TWjIu6J4sbO+ctkGNCUH0kNXuaN0N7GfNj4Gjs8c
	SiJH9L0C38XySCJXLLiuvWB0szAwGslGOpfoixe8OeDprYc9CDNdUr1PZlAUvujg++y/BIRoeGXkh
	74kokTBtwOZQTzbyMZlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isEuK-0004p4-1W; Thu, 16 Jan 2020 23:50:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isEuC-0004mG-3S
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 23:50:33 +0000
Received: by mail-wr1-x443.google.com with SMTP id z3so20973972wru.3
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2020 15:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2lbAeEf1Yfxb0DJw9/N9gwdCq7G191eIts14KOq3L+Q=;
 b=hpy0k+VDHzuaeRxDYJuMBs4ThERabafVqSuX9SaVtXcArs5U0b8Ooa+/xRuwNyWgzG
 x2iilgSnBwMaZf9m7w7myErwx7iyxZNWB1TWTG4Kc2U7FqPjUr3gDHcRXkA+J5N3cYm0
 E+vRW8io7CIHnao/TWcmSEADad9mO6H1xUb1O6O5HfdMfZD+ZlX5QLJm3ERmA4pRO2yp
 YM9RrS5V7fL32NeLU067Ac2VjDOsTxHrlt4YLhkLtGhlqaBlsk4WBpDWCN5EVpeP+K0K
 4c9pmVjLF97LmD+CH/WJ4BaQkrXco1rJhEJ+3TmEsDKw6XzMBN1TcJXB0Ku4Qn4kMLsa
 orTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2lbAeEf1Yfxb0DJw9/N9gwdCq7G191eIts14KOq3L+Q=;
 b=tWKk6/vPzl1SwKyofn/lGDcsxr2Irdp1p5uiOf5081tRkcVwCKM/mX19SHkEmg3mpC
 k6LugwGKzjW86S9BNwyGoWSSmwdPx7IWvFJhtkU5JTmnK6SfEaTFv2T7VLGd7QHVg1VS
 xQfgvdHhq9EoJOV/Yx8JOUxOMxi2BMFyr+eDEexGeq7IQSQ1w0hLkJgszr2f59kF8r2A
 sQpXaVNKLfcURnRL/ybSvbtabJwAJwuYVuirg1MW7BbjsppLt9Sk24KindNE6aGiJx3r
 Mi8j619HVDUZj+gx84LnxxVBYYWTEArU4IbwQzZHiIFhG2Zhb5vluIQGiBP8nVq/2oXB
 w4iw==
X-Gm-Message-State: APjAAAUWi+fcWZiTfKXHE7owISl8fbauY+pxhrd9nu1M22bcWTKLcm1q
 DxuPWFvCXWbzfvQOT6xVWM9cAkC0N5RCRYd9rZ4=
X-Google-Smtp-Source: APXvYqz3NjHnKZS/uIG7B6I5ItCxyAj0uAxLYgWl/p41bwSYkpABFCg9erzLI0PjhmCIPeRUO3U2/15sl+ZY4Lh55rk=
X-Received: by 2002:a5d:6441:: with SMTP id d1mr5811589wrw.93.1579218625760;
 Thu, 16 Jan 2020 15:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
In-Reply-To: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 17 Jan 2020 00:50:14 +0100
Message-ID: <CAFLxGvyBO=_4-f+HQPZSaAL=aJouok3y=MxEKjup3Q=Cj0KKZg@mail.gmail.com>
Subject: Re: [PATCH] ubi: Fix an error pointer dereference in error handling
 code
To: Dan Carpenter <dan.carpenter@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_155028_365162_A9D34B0D 
X-CRM114-Status: GOOD (  20.17  )
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2020 at 2:24 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If "seen_pebs = init_seen(ubi);" fails then "seen_pebs" is an error pointer
> and we try to kfree() it which results in an Oops.
>
> This patch re-arranges the error handling so now it only frees things
> which have been allocated successfully.
>
> Fixes: daef3dd1f0ae ("UBI: Fastmap: Add self check to detect absent PEBs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/ubi/fastmap.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> ---
>  drivers/mtd/ubi/fastmap.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)

This patch seems badly formatted.
Copy&paste error?

> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 1c7be4eb3ba6..6b544665318a 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -1137,7 +1137,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         struct rb_node *tmp_rb;
>         int ret, i, j, free_peb_count, used_peb_count, vol_count;
>         int scrub_peb_count, erase_peb_count;
> -       unsigned long *seen_pebs = NULL;
> +       unsigned long *seen_pebs;
>
>         fm_raw = ubi->fm_buf;
>         memset(ubi->fm_buf, 0, ubi->fm_size);
> @@ -1151,7 +1151,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         dvbuf = new_fm_vbuf(ubi, UBI_FM_DATA_VOLUME_ID);
>         if (!dvbuf) {
>                 ret = -ENOMEM;
> -               goto out_kfree;
> +               goto out_free_avbuf;
>         }
>
>         avhdr = ubi_get_vid_hdr(avbuf);
> @@ -1160,7 +1160,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         seen_pebs = init_seen(ubi);
>         if (IS_ERR(seen_pebs)) {
>                 ret = PTR_ERR(seen_pebs);
> -               goto out_kfree;
> +               goto out_free_dvbuf;
>         }
>
>         spin_lock(&ubi->volumes_lock);
> @@ -1328,7 +1328,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         ret = ubi_io_write_vid_hdr(ubi, new_fm->e[0]->pnum, avbuf);
>         if (ret) {
>                 ubi_err(ubi, "unable to write vid_hdr to fastmap SB!");
> -               goto out_kfree;
> +               goto out_free_seen;
>         }
>
>         for (i = 0; i < new_fm->used_blocks; i++) {
> @@ -1350,7 +1350,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>                 if (ret) {
>                         ubi_err(ubi, "unable to write vid_hdr to PEB %i!",
>                                 new_fm->e[i]->pnum);
> -                       goto out_kfree;
> +                       goto out_free_seen;
>                 }
>         }
>
> @@ -1360,7 +1360,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>                 if (ret) {
>                         ubi_err(ubi, "unable to write fastmap to PEB %i!",
>                                 new_fm->e[i]->pnum);
> -                       goto out_kfree;
> +                       goto out_free_seen;
>                 }
>         }
>
> @@ -1370,10 +1370,13 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
>         ret = self_check_seen(ubi, seen_pebs);
>         dbg_bld("fastmap written!");
>
> -out_kfree:
> -       ubi_free_vid_buf(avbuf);
> -       ubi_free_vid_buf(dvbuf);
> +out_free_seen:
>         free_seen(seen_pebs);
> +out_free_dvbuf:
> +       ubi_free_vid_buf(dvbuf);
> +out_free_avbuf:
> +       ubi_free_vid_buf(avbuf);
> +
>  out:
>         return ret;
>  }
> --
> 2.11.0
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
