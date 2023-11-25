Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269C5C4167B
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JQPfVIsw9Smx/ndd3HHwRMOtHvbp8iTByyIblWzR1ro=; b=SlTxLc96g/SrwP
	IlqVze6BR7mDD69/xCEt6K8fxhHnG8xtm+9XQnZ7eIgCW3uAj+I9TKQhqbg0dTSLERqY+u0XI9MJL
	aVsypSGZOlJn/C8IdrjvGrM2v6OjG2dBROXQMj8QuveHEqMRUzivxmch8MWen/tX+687mcFud9yXK
	Pi9JYX6EkcOqx+f4nAx31a+ykzw1t7UyUdhEdBqruSJ89HKjYw1jfPJ6Zkh34TI1TJcvBmoXstCq6
	IGLSZuXkFJghmYmk3QbFDW96J/77RsRhRIC4UxsCzaIqSDt4BDTSv0e5yHW8rEhoFloat6YU1gonx
	q+4JxZj5gMAnZ5p9RX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r72Fy-009xmq-0O;
	Sat, 25 Nov 2023 23:40:14 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r72Fv-009xmQ-1R
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 23:40:12 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50aabfa1b75so4364756e87.3
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 15:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700955608; x=1701560408; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KcUzLZeeYNZ+rUjIAZZAVniWF2JzAzwmGMoujxFXgxk=;
        b=duUqSOz+SALDpHpqugfmpgNvFh9Haqn7yVHGKod7nw3aRUuP38hv3QPXkCzDTUCa+J
         grNv0nq8BazrO7n3PqpJ1zHmxLT0C+UWOSXlyPChL1X9plTXZr6psfNF6c1grvouVLWI
         xsn0NzDyerosIofuMpZAjN3ZMW0G8eByt+09zFYJpn6XSg9Ti2bPq6wChfNK+mxguFp0
         B8N61Cnkd/5+TpCNyPWUx6xbU2eq2CE8kuII7XWoLFLoCQjmgLbCSLSBwiuJU8dkAPHS
         cQ378C5n5EIMrolGhcgdE3NNWdWfoItpKV58qDhzb+YOyVV0iEwxC23kSGA3++H8R+65
         VbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700955608; x=1701560408;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KcUzLZeeYNZ+rUjIAZZAVniWF2JzAzwmGMoujxFXgxk=;
        b=J5+EoJrsmo0XCAYndr+n+9FCbNMpg3sO8wYCl4HpFyT0qRvxN2LtSDQnf0z1expjdU
         mJCNT1p5jnnk86PAiGWJwkEmazz5QUd18OxxRTt+Wu+Mx5Gmb8aUUpm5+Xd6C4PoiX9H
         4nv6qg9efoVogM3hhMkrPyc/Ja7a42jksqCvPs3zQhzlnticSgsZxtbapM/DykRi5XZj
         xIhcduJoygt5H9aDIhRikfCPu2NMX1MBVv62PjZP6ULReL/yTNEDWrxc03v3D+EzghzJ
         U7Etgh2D9mW6yebe3j12dTY0lNAxgxG5QAqvcuWnRLAU+xE7yOKGHxj5FPziD5FCTvaH
         n2kg==
X-Gm-Message-State: AOJu0YyKezl4A6d+kvrSttKgWAqlAoeJ7ERflu2Yt2nVM1arm2CEiGY9
	ztK6aTR0SsbMeX8LMZgZv1ybST4WE+mS7DUUY7Q=
X-Google-Smtp-Source: AGHT+IHWMNaFCt58S+SG4kK6+lRpRfLrSehDteTsJwq0tcGdDZ/AydPYr7TlgMIDjBcqbmYvraTPKnLMcht/0xCNhMg=
X-Received: by 2002:a05:6512:3986:b0:50b:9c4b:4c0b with SMTP id
 j6-20020a056512398600b0050b9c4b4c0bmr2114691lfu.47.1700955608003; Sat, 25 Nov
 2023 15:40:08 -0800 (PST)
MIME-Version: 1.0
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 26 Nov 2023 00:39:56 +0100
Message-ID: <CAFLxGvxiy9ofrNkfGmu4TvZgdZhdTbZBiK4pDmL8=8kjcPWO2g@mail.gmail.com>
Subject: How to properly wait for udev?
To: systemd-devel@lists.freedesktop.org
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_154011_513783_606BA67D 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

Hello!

After upgrading my main test worker to a recent distribution, the UBI
test suite [0] fails at various places with -EBUSY.
The reason is that these tests create and remove UBI volumes rapidly.
A typical test sequence is as follows:
1. creation of /dev/ubi0_0
2. some exclusive operation, such as atomic update or volume resize on
/dev/ubi0_0
3. removal of /dev/ubi0_0

Both steps 2 and 3 can fail with -EBUSY because the udev worker still
holds a file descriptor to /dev/ubi0_0.

FWIW, the problem can also get triggered using UBI's shell utilities
if the system is fast enough, e.g.
# ubimkvol -N testv -S 50 -n 0 /dev/ubi0 && ubirmvol -n 0 /dev/ubi0
Volume ID 0, size 50 LEBs (793600 bytes, 775.0 KiB), LEB size 15872
bytes (15.5 KiB), dynamic, name "testv", alignment 1
ubirmvol: error!: cannot UBI remove volume
         error 16 (Device or resource busy)

Instead of adding a retry loop around -EBUSY, I believe the best
solution is to add code to wait for udev.
For example, having a udev barrier in ubi_mkvol() and ubi_rmvol() [1]
seems like a good idea to me.

What function from libsystemd do you suggest for waiting until udev is
done with rule processing?
My naive approach, using udev_queue_is_empty() and
sd_device_get_is_initialized(), does not resolve all failures so far.
Firstly, udev_queue_is_empty() doesn't seem to be exported by
libsystemd. I have open-coded it as:
static int udev_queue_is_empty(void) {
       return access("/run/udev/queue", F_OK) < 0 ?
               (errno == ENOENT ? true : -errno) : false;
}

Additionally, sd_device_get_is_initialized() seems to return sometimes
true even if the udev worker still has the volume open.
In short, which API do you recommend to ensure that the device my
thread has created is actually usable?

[0]: http://git.infradead.org/mtd-utils.git/tree/HEAD:/tests/ubi-tests
[1]: http://git.infradead.org/mtd-utils.git/blob/HEAD:/lib/libubi.c#l994

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
