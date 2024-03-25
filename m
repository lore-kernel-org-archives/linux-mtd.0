Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7E8C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGPeLmUhhLqknod+wRoBL9RD4XM0PVAuGt1Xe8rDC/A=; b=JC1yV6ku8YLLZ/
	eblY2FFEuWfaotRx/e3VjxxbLkYWKSmPvZzEoX3X4HXoaaTwLUiUByeORVBnIYgtZK2FGOtrHNRCG
	vWAgI4PAxnvnDQm9atW5lihdTklJFSYsLN0WaD2h1qu7b8bIGwTdyoJ3Tn4Wl36k/V8IYVUqtM++H
	WDz5MwD/TOhouqhJwg96otHwBN7NfgRvQSE2/BB9WqdtnDB44HCsTWXuC4ZodLMauJX36rjZngHja
	k+tc1o4ACaZS9AJLQF2nmzZLfx/jhwMF6caUHZl8Z/ladragWpiWQ3QEeA6wWX5Mue6K4C3H0371Y
	UybaDNmjmVhzPtgvwEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roduk-0000000FgIE-3Chw;
	Mon, 25 Mar 2024 06:34:34 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rodue-0000000FgGM-1Jfm
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 06:34:32 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56c0bd07e7bso591796a12.1
        for <linux-mtd@lists.infradead.org>; Sun, 24 Mar 2024 23:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711348465; x=1711953265; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ouuMvqhBWtKZeyRlQhg9ts7M2UrMAOzI4owdP6M8Xh8=;
        b=ahJJOBgPhZvEsgWM8NkNlw78Lf9TOnrC8Ut4CXcQvDbHHZpXSDGMyLtDijY5TLl3oZ
         dqFP8LYwBWhvMO2TJD4rhexlPWKdnkfb7xMXeqg53neeCwW1QHcmu9r5UzncqqR1PzIr
         JBXy75Gw0mzi4DBQRQ65xRiTq5W0U9P1a0l0SuPS+kc/PPCfQyTxw4Fd6CBmk2vm3hOZ
         +BxCeS5hAS1BI/y4uBNigvkg8PHromnTdjOtklaoStHbY4uKeCrDiKDXwB4a3+HC+dNx
         XvPNnaf0kD5BeZNYEaajP6DbIezdlwcjf6CHXZ8JI5MkZ3jP3IBm04o+QnpwQodiBQcb
         riNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711348465; x=1711953265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouuMvqhBWtKZeyRlQhg9ts7M2UrMAOzI4owdP6M8Xh8=;
        b=QwceuuW9y7bf4Xy4QPyHWGlvVPiDZxIi+zFjXkKM4ZZU0EvUi62vQoSjfTvzYyuRrU
         z1iDRv8BNtud9Iv8rK8RzU9jkjvYNGs8dc8+m2Nb0IG9Kc/NbwShQQwRopbqV1fHSVYv
         JbSsb20OiOcri7Q3QJQCogUBj/A6752tovvChHcKjsmXvIYTIz9qfDI3EkZHo2oXYidn
         1SlEP0tcxsHw5LMuxeAUbkx+OfjMNkf+DMY47FIF4ivVA7RVQSRgB7AFTyYcsd5FttQW
         Yu+erPXLza+jNqAcRZ4puX61kbUK0utoAj7yxwJLPyU1KbPKweShBqE/ljTUYAbMl7C6
         sXKA==
X-Forwarded-Encrypted: i=1; AJvYcCVREunJ0BqH73+slx2Sqjq0HHX1mrLz6EzSZKjCrZAYGd9begKh6qdyyD5ddGDDfFHd3DAe59ZNiSrDKKK/DxUnxHXYsRCGDYXrGNGLfA==
X-Gm-Message-State: AOJu0Yw+PGQjBdLp053bK/JQG8Lkd2MAVSFlWiRdzpk06kEz4MpM1/7X
	H5ADD381ZHQFhgCzrVu8UGNppXLkBq1qE3HT2tGgXErTDPQiuaiyZ3W+eB5h3O0=
X-Google-Smtp-Source: AGHT+IGAlH0YlD1ZMINxKLnBqO/4BL4KJ+8SGOGWb9j5yhc1ycqyskEiz3zuIxQM1wrctSzmWSUnaA==
X-Received: by 2002:a50:954c:0:b0:56b:94e3:856c with SMTP id v12-20020a50954c000000b0056b94e3856cmr3706894eda.36.1711348464694;
        Sun, 24 Mar 2024 23:34:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id en21-20020a056402529500b0056be25367absm2638555edb.40.2024.03.24.23.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 23:34:24 -0700 (PDT)
Date: Mon, 25 Mar 2024 09:34:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
	ada@thorsis.com, error27@gmail.com, Artem.Bityutskiy@nokia.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH] ubifs: fix incorrect UBIFS_DFS_DIR_LEN macro definition
Message-ID: <bade7524-2b8f-449a-a29e-cafd11359504@moroto.mountain>
References: <20240324120333.3837837-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240324120333.3837837-1-wangzhaolong1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_233430_238334_2989CC29 
X-CRM114-Status: GOOD (  23.48  )
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

On Sun, Mar 24, 2024 at 08:03:33PM +0800, ZhaoLong Wang wrote:
> The UBIFS_DFS_DIR_LEN macro, which defines the maximum length of the UBIFS
> debugfs directory name, is incorrectly calculated. The current formula is
> (3 + 1 + 2*2 + 1), which assumes that both UBI device number and volume ID
> are limited to 2 characters. However, UBI device number ranges from 0 to
> 37 (2 characters), and volume ID ranges from 0 to 127 (up to 3 characters).
> 
> This incorrect definition leads to a buffer overflow issue when the device
> number is 31 and volume ID is 127, causing the dbg_debugfs_init_fs() function
> to return prematurely without creating debugfs directory in the stable branch
> linux-5.10.y.

This commit message is very confusing because you are talking about
5.10 and the current kernel.  Only talk about the issues in the current
kernel.  Later when we're backporting patches then we can discuss
issues in the old kernels.  (You will need to re-write the commit
message and resend).

> 
> A previous attempt to fix this issue in commit be076fdf8369 ("ubifs: fix
> snprintf() checking") by modifying the snprintf return value check range is
> insufficient. It avoids the premature function return but does not address
> the root cause of the problem. If the buffer length is inadequate, snprintf
> will truncate the output string, resulting in incorrect directory names
> during filesystem debugging.

Heh, my commit message said that my patch did not affect runtime but I
don't know what I was thinking when I wrote that. :P  I guess I saw
UBI_DFS_DIR_NAME but didn't notice it had some %d format strings in it.

I think the calculations were wrong, yes, and the comments that explain
them were wrong, yes.  However, I think that the original code worked.

-	n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN + 1, UBI_DFS_DIR_NAME,
                                      ^^^^^^^^^^^^^^^^^^^
The + 1 was added by mistake, however, 9 + 1 = 10, so in the end the
math errors cancel each other out.

+	n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN, UBI_DFS_DIR_NAME,
                                      ^^^^^^^^^^^^^^^
This is also 10.

 		     ubi->ubi_num);
-	if (n > UBI_DFS_DIR_LEN) {
+	if (n >= UBI_DFS_DIR_LEN) {

n > 9 and n >= 10 are the same.

So I think this is a nice clean up, but I don't think it changes
runtime.  We should backport my patch to 5.10.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
