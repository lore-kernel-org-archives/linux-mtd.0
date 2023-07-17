Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07946EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:From
	:Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vDF4hxl3Q8YAzgNP6IPvR7IAD5w8hKAg1bQoPHyj+FA=; b=BFevBWNKykhBNg
	4S5EUhkKDHYLEr7ceTypbRjAZGDQyBV9IwBWnXoj0UMdzulNNwLQwwhqRr3b5ff6OcweuHTwCw/CR
	56HVI1n4YD+cUkVfLreXKia41u864eLc658ZByK5iwhWwKTjJfRzqVMWVrLiwYTRx0ylWT1WX7LNg
	O5J7nIeVL+lh+uholRm9LocXcUnIUITLbMz/Wyl6ZG6rVaNDvLuT/rl2xXHhs7Cyb2UU0OwQVclCD
	X6TSaPjdJEk4ZBbs0kGazeIpbJCbx8pntIAhRUgkxIbzNYty6c3edKBppTMrlrIU4XkSwRbZad0qx
	sWL07qSqqtcJxyrqwKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJ0m-003MZZ-1p;
	Mon, 17 Jul 2023 07:51:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJ0j-003MY0-1J
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 07:51:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso41218795e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580270; x=1692172270;
        h=content-disposition:mime-version:message-id:subject:cc:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jB21TKgLqLUivduUeAmZSmMmFlmKP474YJA/eKVbLmk=;
        b=edc2w00ZtlGTePKF5MQm3j29ZV/vtbWJOa9ZELbwFK5dJUVdQFTKKkZlRICSi6Sj5Q
         Ra0tfBaI+rDaWhICGbNDRDhQs7WwVqQtCROxvzN21SuvXgZlbTk0OrYty9BeiEeuMM+p
         Ux1f9hbz7RKD8APT2UI1ZIzQ3q05hU1U3U9kJRbwMjjMI4Ak2XBV+guRUBzRa9rbHXNn
         9UC9+FUxT+zzCdje6w2L/BvOflTHtQJXHPsz/8I/1vPgvwMi1v6oe+BEmkQjYAzLuIw2
         +keptlZuFNk9VPvnIQy+rET6qqHZuCzigg9YClXPxSpbP/wQO8pJKbQ2D31UivsyWdia
         kJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580270; x=1692172270;
        h=content-disposition:mime-version:message-id:subject:cc:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jB21TKgLqLUivduUeAmZSmMmFlmKP474YJA/eKVbLmk=;
        b=bO+NXMc+bd+kPpkexWlpfLeUKfPpt8HCuEzWoL3i072O5r8DvQjE/RUCpk8rk1nm32
         tkVOlYY8nCYbNdXMZfEKAGGVEyrXJMc4HZpuIvNHVqw2HYvcmXmvrZ9Yst8b32uJeBwS
         zDe9VaWDJYDoY9Ui9xPuTg1cjU8J4Qdo3Ol0JXA7YIp4i1av8IV1ZdfnX+c990QrhV3/
         Gmpv5M1U/sU+0h6Zc5Nc8z30vERyKxQsjyD4s6mKcOexS6+xkfm49iENsV/ZbJMR6M/c
         YyX5682XVNwVb3vzsJ1gyIlcqIgHSpC8kFuiZS9rLCDa90iV2wHAgR3+r08HeuAkEOZ1
         W8nA==
X-Gm-Message-State: ABy/qLb3oLErdzixAvDDT1EapD1W0Uz96xtbct4qmbvmNT1ewzJ8feWK
	dTZaePb13oy9EFZLSAWuZVDKRwUDOX0rdLBrDtQ=
X-Google-Smtp-Source: APBJJlE13YRahKFVtN0OPpv3I34t+aIs0EyhxldAjB80eG1jopyRS3r8T7GGuOfcstI2+mtG+7KWgw==
X-Received: by 2002:adf:fc4f:0:b0:314:2c7a:d100 with SMTP id e15-20020adffc4f000000b003142c7ad100mr11148563wrs.42.1689580270057;
        Mon, 17 Jul 2023 00:51:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w13-20020a5d4b4d000000b003143765e207sm18318383wrs.49.2023.07.17.00.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 00:51:08 -0700 (PDT)
Date: Mon, 17 Jul 2023 10:51:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] UBI: rename sv to av
Message-ID: <7c5452bc-54e3-4274-96b6-78ba0e4c0643@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_005113_474904_AACAAA45 
X-CRM114-Status: GOOD (  10.45  )
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

Hello MTD dev,

I don't know why this warning is suddenly showing up for ancient code.

	drivers/mtd/ubi/attach.c:1790 self_check_ai()
	warn: address of NULL pointer 'av'

drivers/mtd/ubi/attach.c
    1658 static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
    1659 {
    1660         struct ubi_vid_io_buf *vidb = ai->vidb;
    1661         struct ubi_vid_hdr *vidh = ubi_get_vid_hdr(vidb);
    1662         int pnum, err, vols_found = 0;
    1663         struct rb_node *rb1, *rb2;
    1664         struct ubi_ainf_volume *av;
    1665         struct ubi_ainf_peb *aeb, *last_aeb;
    1666         uint8_t *buf;
    1667 
    1668         if (!ubi_dbg_chk_gen(ubi))
    1669                 return 0;
    1670 
    1671         /*
    1672          * At first, check that attaching information is OK.
    1673          */
    1674         ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
    1675                 int leb_count = 0;
    1676 
    1677                 cond_resched();
    1678 
    1679                 vols_found += 1;
    1680 
    1681                 if (ai->is_empty) {
    1682                         ubi_err(ubi, "bad is_empty flag");
    1683                         goto bad_av;
    1684                 }
    1685 
    1686                 if (av->vol_id < 0 || av->highest_lnum < 0 ||
    1687                     av->leb_count < 0 || av->vol_type < 0 || av->used_ebs < 0 ||
    1688                     av->data_pad < 0 || av->last_data_size < 0) {
    1689                         ubi_err(ubi, "negative values");
    1690                         goto bad_av;
    1691                 }
    1692 
    1693                 if (av->vol_id >= UBI_MAX_VOLUMES &&
    1694                     av->vol_id < UBI_INTERNAL_VOL_START) {
    1695                         ubi_err(ubi, "bad vol_id");
    1696                         goto bad_av;
    1697                 }
    1698 
    1699                 if (av->vol_id > ai->highest_vol_id) {
    1700                         ubi_err(ubi, "highest_vol_id is %d, but vol_id %d is there",
    1701                                 ai->highest_vol_id, av->vol_id);
    1702                         goto out;
    1703                 }
    1704 
    1705                 if (av->vol_type != UBI_DYNAMIC_VOLUME &&
    1706                     av->vol_type != UBI_STATIC_VOLUME) {
    1707                         ubi_err(ubi, "bad vol_type");
    1708                         goto bad_av;
    1709                 }
    1710 
    1711                 if (av->data_pad > ubi->leb_size / 2) {
    1712                         ubi_err(ubi, "bad data_pad");
    1713                         goto bad_av;
    1714                 }
    1715 
    1716                 last_aeb = NULL;
    1717                 ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb) {
    1718                         cond_resched();
    1719 
    1720                         last_aeb = aeb;
    1721                         leb_count += 1;
    1722 
    1723                         if (aeb->pnum < 0 || aeb->ec < 0) {
    1724                                 ubi_err(ubi, "negative values");
    1725                                 goto bad_aeb;
    1726                         }
    1727 
    1728                         if (aeb->ec < ai->min_ec) {
    1729                                 ubi_err(ubi, "bad ai->min_ec (%d), %d found",
    1730                                         ai->min_ec, aeb->ec);
    1731                                 goto bad_aeb;
    1732                         }
    1733 
    1734                         if (aeb->ec > ai->max_ec) {
    1735                                 ubi_err(ubi, "bad ai->max_ec (%d), %d found",
    1736                                         ai->max_ec, aeb->ec);
    1737                                 goto bad_aeb;
    1738                         }
    1739 
    1740                         if (aeb->pnum >= ubi->peb_count) {
    1741                                 ubi_err(ubi, "too high PEB number %d, total PEBs %d",
    1742                                         aeb->pnum, ubi->peb_count);
    1743                                 goto bad_aeb;
    1744                         }
    1745 
    1746                         if (av->vol_type == UBI_STATIC_VOLUME) {
    1747                                 if (aeb->lnum >= av->used_ebs) {
    1748                                         ubi_err(ubi, "bad lnum or used_ebs");
    1749                                         goto bad_aeb;
    1750                                 }
    1751                         } else {
    1752                                 if (av->used_ebs != 0) {
    1753                                         ubi_err(ubi, "non-zero used_ebs");
    1754                                         goto bad_aeb;
    1755                                 }
    1756                         }
    1757 
    1758                         if (aeb->lnum > av->highest_lnum) {
    1759                                 ubi_err(ubi, "incorrect highest_lnum or lnum");
    1760                                 goto bad_aeb;
    1761                         }
    1762                 }
    1763 
    1764                 if (av->leb_count != leb_count) {
    1765                         ubi_err(ubi, "bad leb_count, %d objects in the tree",
    1766                                 leb_count);
    1767                         goto bad_av;
    1768                 }
    1769 
    1770                 if (!last_aeb)
    1771                         continue;
    1772 
    1773                 aeb = last_aeb;
    1774 
    1775                 if (aeb->lnum != av->highest_lnum) {
    1776                         ubi_err(ubi, "bad highest_lnum");
    1777                         goto bad_aeb;
    1778                 }
    1779         }
    1780 
    1781         if (vols_found != ai->vols_found) {
    1782                 ubi_err(ubi, "bad ai->vols_found %d, should be %d",
    1783                         ai->vols_found, vols_found);
    1784                 goto out;
    1785         }
    1786 
    1787         /* Check that attaching information is correct */
    1788         ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {

"av" points to the next entry in the loop.  It's NULL if we are on the
last entry.

    1789                 last_aeb = NULL;
--> 1790                 ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb) {
                                                         ^^^^^^^^^
So it's weird to talk about "&av->root" here.

    1791                         int vol_type;
    1792 
    1793                         cond_resched();
    1794 
    1795                         last_aeb = aeb;
    1796 
    1797                         err = ubi_io_read_vid_hdr(ubi, aeb->pnum, vidb, 1);
    1798                         if (err && err != UBI_IO_BITFLIPS) {
    1799                                 ubi_err(ubi, "VID header is not OK (%d)",
    1800                                         err);

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
