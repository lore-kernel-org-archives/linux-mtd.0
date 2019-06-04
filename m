Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9F1C282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 20:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26062075B
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 20:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m3ttSxzC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeNX258o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26062075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ipfo6McDlTL/L9yNYqjR+fEK8irPJh2zcD/7LRVRgHo=; b=m3ttSxzCmVqXkB
	C8CuNnxmHS3BPzXH70PWC05Rn+P8B7/l70k3O4Twst/2R9O/5pWUkrLFsgy6rXZ0nHjeUM/hNOt6L
	VvdCW1boZFix71picMF1KUatO7k/4O0klZj504HyK03ecl0VArTMww5fW1B+rE3axDAXypxdljFsp
	dis0EGxgwnc0oAE0ch+DwtgHaRAQQg27XAIHXBtuQ48hlBdzDFNgeV1HZVKzDgrPq9E8asjOEozDk
	ZYhxzt4Md9WB8tuBSSDEWQydvR7dXkcFAfp7ovnNj1FIsY3kwnWO/0UtnkklnoVu4UfGUvYm0YFbA
	kp5PyoDIIK/oBYC4rTNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYGWb-0006D3-Mb; Tue, 04 Jun 2019 20:59:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYGWZ-0006Cf-BF
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 20:59:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id w13so17226397wru.11
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2019 13:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i7DJkCpc+NCztTgSGqpcZ9Sj+girbLfijoCBYXJ3vyg=;
 b=VeNX258oGO2OmvGgZodOtDaaNcnePKSr8IqM72AUOMmrRxX7cUrn4pWdvgzB9l8GK0
 +byXkia2p8Wklg2oqY0Ha6iEj3c8Oi2uwjDzTGTdWqJx0vdN2cjuhDhDd9vSZ5GBjNSc
 AgA6vc8l/w+bPzK2ll9R9EDQxMEfZtzERHvoaJ7P5x9KdAdGTRI/+xKejOTOZuQsl35l
 HLnMTpBHD5shnhgXnv2pjSXs2FOHX/rF3ZpCXO9eSg9hBFexzgbZfJPXBndTgLYW1PmZ
 btXexQIBTwv30YY5wLyzeuEiGkiHmVwDgDTLff1ZzWY9OKPWdymoqgbIQvl/lng2hgRB
 rPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i7DJkCpc+NCztTgSGqpcZ9Sj+girbLfijoCBYXJ3vyg=;
 b=C7ptSEKFFCnVkmU72AHx8sXQRkLgRoe9Iy3FlkJT3Jta2KEZ/yucVPdkldJwf/PKHA
 KzkIU9MaC+qfbSSSK/eqHuXLVSP++ClRqzDiMiKJ3DjUKj9J7zjPJveBZwepB6intM0e
 FcQWgpKRIMLgJCVs3YcBiGTAb2hIIEGP5toFUNs19xck0igbEU84deq1zMrCgbwfIY0g
 oOGXYLOo1Xp3LFGCkTxTza/r0bFvC6ynYUABcOWgQJXsjRkfihDKxSnVUs7tzNAxYzIS
 ToWi7y0DVRk4ej3YpEoBN7YNKDaRirLqRoNlneW28Yy1hZtgD7UeYMyjTqWWe4L3u0Yt
 qbRg==
X-Gm-Message-State: APjAAAVR8HGKUHX9TOVGcMzusbg58jfurJy5QaWLX0WVmwSfBj7AntTZ
 +Jk+V/L2REY+SgDTjxEmQLjqTdY//XibCXRIU3Y=
X-Google-Smtp-Source: APXvYqyhkos/WNR16RlvxnmplO9wgdsWlzpkokkLe42h4zOJUfggq7saBOmYHVAMnbF2RQsZf77ys3osTNz6CMmyIDQ=
X-Received: by 2002:a5d:4086:: with SMTP id o6mr1674232wrp.185.1559681953207; 
 Tue, 04 Jun 2019 13:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR04MB496741DA4839DC07450F3E3997150@AM6PR04MB4967.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB496741DA4839DC07450F3E3997150@AM6PR04MB4967.eurprd04.prod.outlook.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 4 Jun 2019 22:59:02 +0200
Message-ID: <CAFLxGvwZ_85eR5Qkjka4CyDOAP_jw-hpk7WwttbAzjLFS4MavQ@mail.gmail.com>
Subject: Re: 5.2.0-rc1 UBIFS bad unlock balance
To: Han Xu <han.xu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_135915_388531_437FD1FE 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 4, 2019 at 10:21 PM Han Xu <han.xu@nxp.com> wrote:
>
> Hi Richard,
>
> Found such issue with lock debugging. Running bonnie++ on QSPI with UBIFS.
>
> Erasing 64 Kibyte @ 1ff0000 -- 100 % complete
> [  129.575631] ubi0: attaching mtd0
> [  129.620067] ubi0: scanning is finished
> [  129.623888] ubi0: empty MTD device detected
> [  129.723031] ubi0: attached mtd0 (name "30bb0000.spi", size 32 MiB)
> [  129.729289] ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
> [  129.735994] ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
> [  129.742267] ubi0: VID header offset: 64 (aligned 64), data offset: 128
> [  129.748915] ubi0: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0
> [  129.755026] ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
> [  129.762365] ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 445061296
> [  129.771508] ubi0: available PEBs: 508, total reserved PEBs: 4, PEBs reserved for bad PEB handling: 0
> [  129.781182] ubi0: background thread "ubi_bgt0d" started, PID 516
> UBI device number 0, total 512 LEBs (33488896 bytes, 31.9 MiB), available 508 LEBs (33227264 bytes, 31.6 MiB), LEB size 65408 bytes (63.8 KiB)
> Set volume size to 33227264
> Volume ID 0, size 508 LEBs (33227264 bytes, 31.6 MiB), LEB size 65408 bytes (63.8 KiB), dynamic, name "test", alignment 1
> [  132.036227] UBIFS (ubi0:0): default file-system created
> [  132.046036] UBIFS (ubi0:0): Mounting in unauthenticated mode
> [  132.052526] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 524
> [  132.095082] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "test"
> [  132.102377] UBIFS (ubi0:0): LEB size: 65408 bytes (63 KiB), min./max. I/O unit sizes: 8 bytes/256 bytes
> [  132.111870] UBIFS (ubi0:0): FS size: 32573184 bytes (31 MiB, 498 LEBs), journal size 1635200 bytes (1 MiB, 25 LEBs)
> [  132.122423] UBIFS (ubi0:0): reserved for root: 1538511 bytes (1502 KiB)
> [  132.129123] UBIFS (ubi0:0): media format: w5/r0 (latest is w5/r0), UUID 2866BEC7-B74D-4793-8A66-E113C824711F, small LPT model
> Using uid:0, gid:0.
> Writing with putc()...done
> Writing intelligently...done
> Rewriting...done
> Reading with getc()...done
> Reading intelligently...done
> start 'em...done...done...done...
> Create files in sequential order...done.
> Stat files in sequential order...done.
> Delete files in sequential order...[  162.282301]
> [  162.283809] =====================================
> [  162.288514] WARNING: bad unlock balance detected!
> [  162.293221] 5.2.0-rc1-next-20190524-45490-g89d8c504132e-dirty #24 Not tainted
> [  162.300356] -------------------------------------
> [  162.305061] bonnie++/525 is trying to release lock (&(&c->orphan_lock)->rlock) at:
> [  162.312643] [<ffff0000104a0774>] ubifs_delete_orphan+0xec/0xfc
> [  162.318476] but there are no more locks to release!
> [  162.323353]
> [  162.323353] other info that might help us debug this:
> [  162.329881] 2 locks held by bonnie++/525:
> [  162.333890]  #0: 00000000a21aa66e (sb_writers#10){.+.+}, at: mnt_want_write+0x20/0x4c
> [  162.341734]  #1: 000000002fe597e5 (&c->commit_sem){++++}, at: make_reservation+0x84/0x3b4
> [  162.349919]
> [  162.349919] stack backtrace:
> [  162.354281] CPU: 1 PID: 525 Comm: bonnie++ Not tainted 5.2.0-rc1-next-20190524-45490-g89d8c504132e-dirty #24

I see the bug, thanks a lot for reporting!
But it is not in 5.2-rc1, the bad commit is so far only in linux-next.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
