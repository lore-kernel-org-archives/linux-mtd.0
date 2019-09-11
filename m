Return-Path: <SRS0=ZCmB=XG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CE2C5ACAE
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 12:41:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB362082C
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 12:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qa8+hSHp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjF3Bb24"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EB362082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kynT77g+BeIw/9CbgKIE9cCNZ1zDQvemlrnlv5JAMUA=; b=Qa8+hSHpGiGge7
	Mv7yIWOyO1a79UFd3q38VnnCFDWxBq/n3G1xQtLXTXd/kqNkx1TPtp+aNndNvRZahByVlWc4029jw
	Rbyg6JO5uCDM39VSVtmF/UV2DK8MgDgOiTqzy46uxdDYIpnEyiJ0dMyRaeKGOB4bXTwvowTUEP05c
	sEAuXdhPNaF/TYpt8YJ8Ua/taGHw0LmgcOvfQlUbIovozNECXzXsWg9962wRkD9y0Kq27xNXr0B5U
	dyda+pFH4/BIjJQd27OTZgHnw7CasDBjdFhmAZe705ANweOdjuyyKRS5Xfp5GVbC68mtsij7WoIoc
	nufghsJfzkLnAQKKgPog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i81wU-0007Sn-FQ; Wed, 11 Sep 2019 12:41:50 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i81wR-0007SN-Jd
 for linux-mtd@lists.infradead.org; Wed, 11 Sep 2019 12:41:49 +0000
Received: by mail-lj1-x22c.google.com with SMTP id a4so19824622ljk.8
 for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2019 05:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tn44RiKgRdLoraU/X4X4xLXNZSwVrBlpRmYQ1rA6zl4=;
 b=pjF3Bb24TQJB2f9/EvMh5ZNoe6pL/ERD8JZTY0Upvu7frYrBd/d1VHczBlL6atCRb/
 pW2wMyG9JZRbds4dRxLFDumeRadxjbNQFXre+rjA1/n1IZKJ+BHwFp7b6h5lixbrEnR+
 rZtYZYlBc01uiDUG0JL5IJI7XzlMo03a2HB06Kxqkc0xX6et5VIgJx/NgGQS5xavEw/n
 cbxaCP8+Y8o3Wm856weWTurpn6zIOYj+vTBavdgzpG2Zxyk/p+qhnq1hk4Og3hKeL3II
 HgBt/RgLYEPxBzt/VIUqItIcKsaEVw30vxyb7Q2nTIVXwisFL6dC+C1YiOgFRyovwBmQ
 ktOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tn44RiKgRdLoraU/X4X4xLXNZSwVrBlpRmYQ1rA6zl4=;
 b=jqMKqz5XX8peKHm449Rm8e4JpCb/A0AQMEn7pf/+h5u/5A1e94fKwtmg2fV9Y6ABza
 TK7uAOkqu1QGvfH7J3TahlTrF7rf/qukAylXYz7q3/ov05tasi/TbHmCNR7z2tYvtEqP
 CAfuIMJpB8KcbwpJW/5eHBXs12ljHmLIUGjBjrmTu7/HF2SXws/uWBvRb0P0fyJhe82p
 JZByKDusTPcauKRtEvZh7+qiWVqgkw9tUsI+un9i26ue2yeu0e/F+LCfaW60/dhI7KrB
 +Mg6o31nui7B2CBstkplu6bZ7oqU/wAeGFZuHu7JKaR86NqH04tC9803tod676bgptGY
 RDwA==
X-Gm-Message-State: APjAAAVbSsFdpCRRpIGzWTnCCIvI2iowZIYiiJrOfH/AQ5tl77TgM/Ik
 WKNYUjkv2mnb07GStd9Kvc5+evS2Z9BiKIlups/S9w==
X-Google-Smtp-Source: APXvYqzFbYwVmix7R0q/Ofo/vF/MhSf4d6/o0hcapHqIwcMPFO4AoT2AH5kycbVq0ye84EO+v/6qfi+gXMS6BvLKrZI=
X-Received: by 2002:a2e:7f07:: with SMTP id a7mr15483525ljd.173.1568205705123; 
 Wed, 11 Sep 2019 05:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAFkQurKLwUdGSPNPLYLTrV7-fkWaL5RuP9up0nrN62L4pr-ivg@mail.gmail.com>
 <CAFLxGvz5JipAzu1x_0EPX6v-SZgxtu6n3-gZZ=DQS4FLMH0XSg@mail.gmail.com>
 <bddc36a0-647d-e0d8-e1ca-501fd6522315@sigma-star.at>
In-Reply-To: <bddc36a0-647d-e0d8-e1ca-501fd6522315@sigma-star.at>
From: Boris Stein <boris.stein@gmail.com>
Date: Wed, 11 Sep 2019 15:41:33 +0300
Message-ID: <CAFkQurLSN2XqRscBxONXyTYngbszRe3q8eFEtvB7qS+dtpG-YA@mail.gmail.com>
Subject: Re: cannot ubiupdatevol squashfs image
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_054147_671696_BBDD2429 
X-CRM114-Status: GOOD (  17.88  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Which tool should I use for dumping squashfs volume?

On Wed, Sep 11, 2019 at 2:55 AM David Oberhollenzer
<david.oberhollenzer@sigma-star.at> wrote:
>
> On 9/10/19 9:31 PM, Richard Weinberger wrote:
> > On Tue, Sep 10, 2019 at 3:11 PM Boris Stein <boris.stein@gmail.com> wrote:
> >
> > [...]
> >
> >> [    9.006327] SQUASHFS error: zlib decompression failed, data probably corrupt
> >> [    9.006359] SQUASHFS error: squashfs_read_data failed to read block 0x785a5a
> >
> > usually squashfs has a blocksize of 1k or 4k. So block 0x785a5a is out
> > of bounds.
> >
>
> SquashFS has a device block size that is either 1k or 4k that is only relevant
> for I/O transfers. The actual block size is between 4k to 1M (defaults to 128k).
> The data blocks also have no headers or checksums.
>
> Meta data (inodes, directory entries, tables) is chopped in 8k chunks and stored
> possibly compressed with a 2 byte header.
>
> Once compressed, blocks can have any size and there is absolutely no requirement
> for alignment. Inodes (or in this case the fragment table) can literally point
> just anywhere between the super block and the inode table.
>
> >> [    9.012677] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> >> [    9.019470] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
> >> [    9.026242] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> >> [    9.032876] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
> >> [    9.039529] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> >> [    9.046225] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
> >> [    9.052910] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> >> [    9.059573] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
> >> [    9.066281] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> >> [    9.072954] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
> >>
> >>
>
> SquashFS tries to read a fragment block located some ~7.5 MiB after the
> super block (0x785a5a) with a compressed size of 54964 bytes (0xd6b4).
> For a ~41 MiB SquashFS image this sounds plausible.
>
> Uncompressing fails, so the location that the fragment table points to does
> not contain a valid zlib stream.
>
>
> Interestingly, the inode, directory and fragment tables seem to be at least
> partially readable. Accessing the root inode and walking through the tree
> seems to work, since there are no other SquashFS error messages.
>
> *Assuming* that it is not the data that is broken, *if* there are no xattrs
> and NFS export tables, the fragment table is pretty much at the very end.
> Maybe the filesystem is partially chopped off at the end?
>
>
> Have you tried dumping the SquashFS image from the UBI volume and extracting it?
> (E.g. using unsquashfs, rdsquashfs or sqfs2tar which generate more useful error
> messages about what actually broke)
>
>
> Regards,
>
> David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
