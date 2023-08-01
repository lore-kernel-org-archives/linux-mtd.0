Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C97EC001E0
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Cc:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xc+kGT0S8ArJPWPHq4uBjIhVbcrGOg8IfyBEbIjxMY=; b=yq/x6s95mnqhQ9
	n1X9cNURWPIpONuE6pUHVdeRDc/YyTWT/ecX/WoJ6CAUWBdLcgFyhaO4szfEiEm3LuqksXrQnmv6p
	4m3ZHwm6BRXmIdt71ScmKg091bT4CJQsyYIPqmQks5Y9Vyh+7EQ2nK6vCQwqt5JfOAqDQ93MtCCnh
	ny+EcZJQFCcc7N/QYhfzgsTPfJJj+6tVzqzmgDhEsdH5RVPmeGsbJP/smoHSuRJq7CvjRb2ae/zil
	LeiGawXHfLiW+vkijYYt+9ClTEORKF/0Q4JsuwHe2HpS5huuInh14jhyNl1CWf7x1OULcS9eTJcY1
	MXwoPEc4x4VY1l7dexpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQrDl-002iWp-0t;
	Tue, 01 Aug 2023 15:23:37 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQrDi-002iW0-17
	for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2023 15:23:35 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bca3311b4fso1788203a34.0
        for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2023 08:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690903411; x=1691508211;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:reply-to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9drBRg+ZkVz9pBlKy/QPjM+D8SReHpnOyKvUtQFdiQs=;
        b=goaRMFaP19g6l2wDl4Rbk8HZJJdAFods+CVscsBZJwjJq3DEvY6GVqcuGLskzkSZPC
         vMIRky+NTYy6g/sXW/D1dKi+1/9izsSIy/CRGV6ZEzZsRJW+Vn8UD4t1Kso4/f1GQ7XQ
         Ao7Kd8r9QWwsPj+RiUuXRSYVXVV/FtftRHNf5ZiEsuG2FOROTvX3YGcm/ixvdDQ3kUYX
         Bu8DyJmmY+14EDB0pbkEoPG8t1ibr21rgvC91XS+HKsD7GKzxcv+Qf1LnSbpnT+lBudk
         G0jS1EGhgpanka6e9Lz47tmoS7/9/WTPMtpa3ZE0axL8Dv8/PbaNed8FucnbWEJKWSkw
         y3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690903411; x=1691508211;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:reply-to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9drBRg+ZkVz9pBlKy/QPjM+D8SReHpnOyKvUtQFdiQs=;
        b=Ed3muEGbyyBTVbAINM0AGdIyd2ixX7iykA2SPMEp1N7vr+L9iOJeBnhPvqMsdoTN4r
         OX87m8r5ywxfKFVF0CSnRAuzJmUFhhHbpSXDdJPLkCnWhWEGj8gjEVGc5mYbmxOLGGAs
         8SI6T7LMrBaGxBe6JlYQreZMfSs4Gjb5MXL6WHJSymC45IeczzOA+1vmaY/2rqgtXCOS
         PP0Oy7sLvd9iYe0Skd7Y5ovwkbDX/xVWhq9t+zgz/PtkhoTzz/tuoxAPJ9s9hs6LgFvA
         ocLsnfHJ3im73rrGw0t2U1PE4PTC4/+38W1GJGWk6K+66zRk0QAZY29csaQDalh2e7eV
         SFTg==
X-Gm-Message-State: ABy/qLadpLTHdmV57QLEZb9ZmOHzqVeYa85CJwmvTTlt3RSqbdh1Yleb
	DvrvtLiDyL8GbiC1XeO9PJFw2c+9O2wWWw==
X-Google-Smtp-Source: APBJJlGKpgBaFq7Hx94WBFyLFN7FrwbFMfe++CUXbcfhapOyCq1UdgLTqZsgrVLzp/FJt9Gr/2oaog==
X-Received: by 2002:a05:6358:52cc:b0:135:92f0:fa6a with SMTP id z12-20020a05635852cc00b0013592f0fa6amr4566133rwz.1.1690903411453;
        Tue, 01 Aug 2023 08:23:31 -0700 (PDT)
Received: from [192.168.3.131] ([69.61.231.90])
        by smtp.gmail.com with ESMTPSA id e16-20020a0caa50000000b0063d3dbf77f8sm4632841qvb.51.2023.08.01.08.23.31
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 08:23:31 -0700 (PDT)
Message-ID: <43525c71dfe96b322e8219e9b12c1da2fe7d37cf.camel@gmail.com>
Subject: Re: mtd-utils flash_erase progress
From: eric <eric.kenny@gmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 01 Aug 2023 11:23:30 -0400
In-Reply-To: <f66aa05a-8cf9-4b06-68ae-9511a978a8f4@huawei.com>
References: <CAKj80Vd-DPPfSmZCeXd4OV9nqETYW7RNw-02fd33Yh+xQ2ucvA@mail.gmail.com>
	 <f66aa05a-8cf9-4b06-68ae-9511a978a8f4@huawei.com>
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_082334_384764_BEFAE030 
X-CRM114-Status: GOOD (  13.15  )
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
Reply-To: eric.kenny@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2023-08-01 at 10:31 +0800, Zhihao Cheng wrote:
> 
> The flash_erase tool will display progress in default, unless user
> adds 
> '-q' or '--silent'.
> 
> BTW, I can't apply the patch:
> git apply mtd-utils-flash_erase-progress.patch
> error: corrupt patch at line 159
> 

Apologies.  What I would like to propose is that when erasing the full
chip with mtd_erase_multi, flash_erase should not pretend that it is
going to give progress updates.  It makes it appear that it isn't
functioning correctly.  Suggested patch:


diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index 49a880f..192d1b6 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -236,7 +236,6 @@ int main(int argc, char *argv[])
 		erase_chip = false;
 
 	if (erase_chip) {
-		show_progress(0, eb_start, eb_start, eb_cnt,
mtd.size);
 
 		if (unlock) {
 			if (mtd_unlock_multi(&mtd, fd, eb_start,
eb_cnt) != 0) {
@@ -254,9 +253,6 @@ int main(int argc, char *argv[])
 			goto erase_each_sector;
 		}
 
-		show_progress(0, eb_start + eb_cnt, eb_start,
-			      eb_cnt, mtd.size);
-
 		if (!jffs2)
 			goto out;
 









______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
