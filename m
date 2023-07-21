Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4FEEB64DA
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 02:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=M+2KtC3Y+q0hFbXpzo+dI/1TyNQwiOKUyztd0Lsssik=; b=c4W
	NwRUjxbbB7OJkKLq+39y8d2fpUemq0/HXOlHDYaVRlbSZs0BC02GQvOAOoiOqQwLG61QBx4aS5MLd
	5EA5Z+29+6TN21I7zpzkCUP2dhAVMo7pgeguShy3gSOBnBXgpXvHEdCirH2L8sf9caBbw0gBCl060
	3kjmc0XROZsX6JkmTiki4llpanzfMCbX6uo75kIocKTF/LRg7hToXu6JlxnOjXDRx8YBJNLaEplpz
	/A4eO8PUAgqFjTJbWRGJ4KvLe6H8ibsZ9WxgPnRQcObn6q+wEFxv9bQZqFKcS6Y3hsI3lR/f/PBV2
	5gIdStzZH8FzqngUBLdOCFnD7m5JU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfS7-00Cal6-30;
	Fri, 21 Jul 2023 02:01:07 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfS5-00CajV-1s
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 02:01:06 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-565a8d9d832so992576eaf.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 19:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689904861; x=1690509661;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LeDxDDKdgQw/ugEwsXlKtEEomRVOFZ/psqNeYd2zCCM=;
        b=ro2bV+L+nF07wEJb4uUgRv//J8hL2tfSSNWdE1zE/b7N71QJ5NIzTFThOsFNzRXfu4
         2rPQRlqktGkZvaY9YqDbCvbX1mwJFxs9zyRUjy9r5nYqnh5piCM0qd41IDs3Nb1ZjReJ
         WAf7dyHMLzsBrS2TPZxbwqwFkoyFuYBVvb3p8Tlz0/ABz3wyVL2p+7gloqnCaf2CKFC5
         AoPFQYxhgZ3Em/U5gACQM6se321ZEoimrvUJW4O9pBciRh+9T/ewOz9+ECO/paoNlrVu
         YkxdJZZl1MFa57tUc9sO4Ja9LX30rqjsHAMxqbLww/t4wi+Fx5JOJV2fMy1LYqdBWIbN
         vJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689904861; x=1690509661;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LeDxDDKdgQw/ugEwsXlKtEEomRVOFZ/psqNeYd2zCCM=;
        b=F5/InuPDLGtWe/5Q4cAu0lPGAw/IWminqwZs7P6h2LGXESP3tmYk+WgAxLh1NG+0R6
         BE3/IByQ/UPOrAua5UZaP/YegV21QocAvD2bBfylTZyiwjnwn/HGJjb3G0pIQ/YxTRBF
         OPR2wiWHdqFOK0PWFuClO1d0yCWI3TuSggPfI7MQw8/GhE17QwG3GefejtnaRfmuxPzO
         dOUHP4XLiC+1lss0AxmbtrQiuAD/ZmafHOJ4TLtGj88tncZ3wNCGqZjKe3UGzF6OOQ9E
         bWm+rdVZ5j5QddwV//8P2xQYsptio3cV0friBk8C70Idntha/cjNpnw3U13XL4X/49st
         p5wA==
X-Gm-Message-State: ABy/qLaxonoFyMaacmLmsDXPpwF/bMgxEgb+YjtHxuso9mX2Ohiw5eTa
	K9PCFPEYQWSBUY2L4nBC7KJr99PjU5a1PG6V16MwnIj+zRo=
X-Google-Smtp-Source: APBJJlHBrMB+n/naKpeF0lCXr+pIN8QIhgt7lWIZBwe3Mx0/b75pNp68xAdM+W7styQmfR3E3Rxhep3p0RYd5iIpLG8=
X-Received: by 2002:a4a:830a:0:b0:566:fb49:ba57 with SMTP id
 f10-20020a4a830a000000b00566fb49ba57mr474225oog.9.1689904861011; Thu, 20 Jul
 2023 19:01:01 -0700 (PDT)
MIME-Version: 1.0
From: David Gideon <gideonda32@gmail.com>
Date: Fri, 21 Jul 2023 11:55:40 +1000
Message-ID: <CAOLMD=zkVT=OOMeGG-hrT=BQqog=YDDHdyfhPi_ELwDjEOoBoQ@mail.gmail.com>
Subject: Question about scrubbing and ECC errors (in UBI)
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_190105_657591_C72393D9 
X-CRM114-Status: GOOD (  11.21  )
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

Hi,

I have a general question about how ECC errors are handled in
drivers/mtd/ubi/eba.c.  I am using a Micron raw NAND part with on-die
ECC and an ECC strength of 4 bits.

I simulated an ECC error via some error injection code, to see whether
or not the UBI layer would mark it for scrubbing.  But I saw that UBI
didn't want to mark it for scrubbing, due to it being a UBI dynamic
volume.  Here's the relevant code (which seems to have been around
since 2006, and still exists on 6.x-series kernels).

I'm just wondering; what is the motivation/reasoning behind only
setting 'scrub = 1' (and scrubbing) if it is _not_ a dynamic volume?
Why only scrub if it's a static volume?  I would have thought that
scrubbing a PEB would be beneficial in all cases that an ECC error
occurred.

err = ubi_io_read_data(ubi, buf, pnum, offset, len);
if (err) {
    if (err == UBI_IO_BITFLIPS)
        scrub = 1;
    else if (mtd_is_eccerr(err)) {
        if (vol->vol_type == UBI_DYNAMIC_VOLUME)
            goto out_unlock;
        scrub = 1;
        if (!check) {
            ubi_msg(ubi, "force data checking");
            check = 1;
            goto retry;
        }
    } else
        goto out_unlock;
}

Thanks!
- DG

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
