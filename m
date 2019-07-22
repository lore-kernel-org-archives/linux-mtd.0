Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A319AC7618F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 21:27:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73BF421900
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 21:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ultMs+G3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXXstqpO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73BF421900
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gkajWSc/aPyBS8aUmh6D7AnwAdznWquw0wyb+GJlih0=; b=ult
	Ms+G34bzd7dPKFnHQSr5sQ2ObVJW4uqqGyfLHK+zUv6NAIHuT3u1CCFXjW3nOFhT0O0lCkaDjIrLh
	T5jyRjqPOvM83cZkT9Gr8CRtBZZ1ccXlrAaoU3LMjwy5ZQvps6innHeoTee5SzURttwkFLBEI6jfK
	xEEKXrGMPnNPNi8uqgZg4LHfmk3UIsQY6T4tOxARCcICmmlbJabnZWu3ed4yKl3cxmYUHof/7XGmj
	ed0eG7II0Lx4THx/x4chd0PQMryshxWrmcB4afU5D779GKHXuW8ZveAvP04CRq6R+JmHVC9DzgTmf
	s+qjAmuFy2s3Udx57AmWKPAfuUJqazQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpfpP-00027H-TE; Mon, 22 Jul 2019 21:26:39 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpfpI-00025P-H1
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 21:26:34 +0000
Received: by mail-ua1-x92a.google.com with SMTP id z13so16062065uaa.4
 for <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2019 14:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=l2Brdo1rNZvuSD22e+nqM8rJ22yxnkGA3xtPR6++HuY=;
 b=PXXstqpO2akfG1tt9r0mvd1b6o7bc7jrEhWUqvADxoc0RafTGjQkH5+9K0f1oFdmiJ
 AH00BQGlhqvhipZdN9W+pmzNCVb/A21u5xRA0BvxOk6AB1vrnGJJRGNMXBkFx3XlZ/2h
 jK6gceEjDK7lwSt8HnaDfEazhlkfy0P7/5FGyvuE7qBRBvk9RaU6EMcy4mo1RH4cRyji
 qpuPwrPfqujflJL7YXiKQYkxLUL4ihOpVTooXCcK8xS+OnxeVjIFDPspU3kQbOezERB6
 +ZAosIcPexxzMpgbHaUFurILKDR6PD4WdV52TvNbzX263MHorC9tfDjBYfFtLT5GSuFE
 /wfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=l2Brdo1rNZvuSD22e+nqM8rJ22yxnkGA3xtPR6++HuY=;
 b=P5sSN1NE+L97SRuvrpt0Tac8lr2jFV89SsE0kaZTPcXQLzyK/FWo6i2LwcBp2XLjtz
 oZjXZoXm7Nmg3/mtUA4Hji2192XqzBfRhQaW3Zd+CSCBrrqaLWr/WOrhCdI86h26laRD
 5tALM9MqhNpoMgU9VKDswR3eJLiGJOlcwlTcg+usmbT1nyps3mjLswI9e4xUeDjBfB2j
 mhqOvhOVXgXgp/qtlpWBAp6XkRc+xGuQKZDNKjepJ/xtyFYKBdupCWZ4+N/QsNuHAP3t
 IQAl2JiAyLd5/9b4Ru8tWBr0CiePZJAv/tG2GmZVTZzTe12I2n9TpoBtSw884AW2WtIy
 0zrg==
X-Gm-Message-State: APjAAAXv1ML4LtJbQTrs+adJ2Pf62lr7HUX//UD/25TnM2yyBEZjOv0z
 gJlAvNhZZt7xx4nTP1pWm5Fo5/8KK+u1OQRlHl2KTpr1
X-Google-Smtp-Source: APXvYqwmjHGtDNej+RYK73D9CHf/BB9DGZeiCOv2Vh6qfKqzULl6ANTizNZ0dLBnNFA6mPXn/kYxSuP54j5KoKFK2oA=
X-Received: by 2002:ab0:2789:: with SMTP id t9mr28440508uap.69.1563830790899; 
 Mon, 22 Jul 2019 14:26:30 -0700 (PDT)
MIME-Version: 1.0
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Mon, 22 Jul 2019 22:26:20 +0100
Message-ID: <CABatt_zVj_V6ms7NF_zGhtibkfVL7hK4a65NTFhhF6mN=ZAtUg@mail.gmail.com>
Subject: ubifs assert when creating a SMACK transmuting directory.
To: linux-mtd@lists.infradead.org, linux-integrity@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_142632_716392_16753177 
X-CRM114-Status: GOOD (  14.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

The following backtrack was reported by our dev team.

[<8010ea60>] (unwind_backtrace) from [<8010c4d8>] (show_stack+0x10/0x14)
[<8010c4d8>] (show_stack) from [<803b590c>] (ubifs_xattr_set+0x210/0x3ec)
[<803b590c>] (ubifs_xattr_set) from [<80272134>] (__vfs_setxattr+0x70/0x80)
[<80272134>] (__vfs_setxattr) from [<803ecd8c>]
(smack_d_instantiate+0x41c/0x430)
[<803ecd8c>] (smack_d_instantiate) from [<803e4ef0>]
(security_d_instantiate+0x34/0x54)
[<803e4ef0>] (security_d_instantiate) from [<80263edc>]
(d_instantiate+0x28/0x4c)
[<80263edc>] (d_instantiate) from [<80392858>] (ubifs_mkdir+0x1f8/0x200)
[<80392858>] (ubifs_mkdir) from [<80257124>] (vfs_mkdir+0x148/0x1dc)
[<80257124>] (vfs_mkdir) from [<8025add8>] (SyS_mkdirat+0x84/0xec)
[<8025add8>] (SyS_mkdirat) from [<80107dfc>] (__sys_trace_return+0x0/0x10)

Looking at the code for smack_d_instantiate it's going down the following path
/*
 * Transmuting directory
 */
if (S_ISDIR(inode->i_mode)) {
        /*
         * If this is a new directory and the label was
         * transmuted when the inode was initialized
         * set the transmute attribute on the directory
         * and mark the inode.
         *
         * If there is a transmute attribute on the
         * directory mark the inode.
         */
        if (isp->smk_flags & SMK_INODE_CHANGED) {
                isp->smk_flags &= ~SMK_INODE_CHANGED;
                rc = __vfs_setxattr(dp, inode,
                        XATTR_NAME_SMACKTRANSMUTE,
                        TRANS_TRUE, TRANS_TRUE_SIZE,
                        0);
        } else {
which ends up in ubifs_xattr_set which is expecting the inode
semaphore to be locked and hence the assert message.

I can reproduce this by creating a directory with SMACK64TRANSMUTE and
then adding a rule with 't' set and then creating a directory

mkdir test
chmod 777 test
chsmack -a update test
chsmack -t test

echo programmingapp > /proc/self/attr/current
echo programmingapp update rwxat > /sys/fs/smackfs/load2

Creating a directory in test which trigger the ubifs assert.

Looking at the code some more, don't we need to lock the inode when
calling __vfs_setxattr above as the inode will have already been
created (ubifs_init_security in ubifs_mkdir) and added to the inode
hash and another process could potentially set an extended attribute
on the directory whilst we are trying to add the transmute attribute
here?

I created a patch which put an inode_trylock around __vfs_setxattr and
the ubifs assert has now disappeared in the use case described.
Although this fixes things for a UBIFS I had a quick look at other
filesystems to see how they handle setting extended attributes and the
2 I looked at have a i_xattr_sem which is in some wrapper structure
around an inode so maybe this isn't the best solution but maybe the
inode_trylock should be moved into the ubifs_xattr_set function
instead of the

if (check_lock)
        ubifs_assert(c, inode_is_locked(host));

to be more in line with what the other filesystems do.  This is on a
4.9 vendor kernel for an i.MX system but looking at 5.2 I think the
problem would still exist but not entirely sure.  Either way is
replacing the above check with inode_trylock a valid solution or is
there a better way of solving this?

Many Thanks,
Martin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
