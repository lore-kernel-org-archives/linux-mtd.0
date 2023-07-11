Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F4CEB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3b/jESMMXWsUOmxdPR0YP+LTf38YVuB1pFZBM0fmkF4=; b=Z/3Xkm7KBjH0/5
	bA1xKEiAreADKabCupn2zuR8Up8N/Nis5SNcmkWu/lgQUGU+9mW1NurinTDGE+swUDclH4AVA/COW
	m3cmXjJq2wd0R25kwZq9YlUBvVwfFfT1J0ARFpTU/x86cRzVVMYioXChp1cIXaEgYIfXph0oufq/M
	vmVH0u05234tPDemCSwTNlHJL9e3GktP7b5CycEBxH0yX9m19vpfFBumsmTzibDVRpp+oO5nK6yNn
	FN5VLhL9Du7C0xHbe45ecSBKvJOeM3qc8mpH4ztS7wjhF+DznUO7hDgxIAxYxOq2WtcNhZV0sQ3bY
	WDjfmYDlVtD2KscL71pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGmD-00FTEl-1m;
	Tue, 11 Jul 2023 17:03:49 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGm9-00FTEM-2W
	for linux-mtd@lists.infradead.org;
	Tue, 11 Jul 2023 17:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689095003; x=1689699803; i=markus.elfring@web.de;
 bh=zPw/6sBeU4GG0fjwIO6avkm9UYX13IMdVQkUiFeoQtI=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=c2HU1nENWr8p/vYsIRV54UCVmbvogsO5HgFO30xJdSre6VcAtwjMMf/SgTLPTOzj0I9tjZX
 YhpAGKy9CyASB5aab/aMQqkidJX+Jr4kYVzCnTqRtNGqGDhWd69hEZ2TVVpaUgLaGehfYQBvP
 bVHVT5EIOaoumLesUjqHcJRlTo2lcgR7UTK7SedecZctaNwnkr5vs4FPfwii+cMit/fVL56JL
 +YaPIUBzc8H/Ogs3Uqh0Ql8Ko/RJqS2I4xazIHM/k+H4bN1h1ibMRrswiSfDafAeDMu7ywdca
 31ZywRzAfzwwT4rJdVfAu83UtvUm/pWzC2yJubcXJFlP4OS72ZQg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkVwo-1pYPhd1C2A-00mEUS; Tue, 11
 Jul 2023 19:03:23 +0200
Message-ID: <287e1e44-6fdf-3e9b-6fc0-a323706e3d2a@web.de>
Date: Tue, 11 Jul 2023 19:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Yang Rong <yangrong@vivo.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: opensource.kernel@vivo.com, LKML <linux-kernel@vger.kernel.org>,
 Lu Hongfei <luhongfei@vivo.com>
References: <20230711020752.2344-1-yangrong@vivo.com>
Subject: Re: [PATCH v3] mtd: core: Fix resource leak in a
 for_each_child_of_node() loop
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230711020752.2344-1-yangrong@vivo.com>
X-Provags-ID: V03:K1:3+G0NIuKpPjrVOTQR8E1HgS9Wc6ZbN+bLueGA6nxvJTTIWZLo+U
 suAWTgCcokbcPCNAPogp7x/HWpVWYUv7iUfxOUzVBjgdOOTH9MWQxhGHfFh4QJYf6HD5rKn
 1mvwexYYM2Sgrt8MHAodzlFDsycAudHvQ/hy/tLeSdZX/v5U4Y2VUveDUV1YY1wdgdMt6M8
 T8/ee0ebDjroxNl93xNxg==
UI-OutboundReport: notjunk:1;M01:P0:+NWvolpzgl4=;csOyFsQDYCzQ46oklgdW/jrhaCD
 EPjuMtX1lQuxcucRCOZNhmWMCUV1FT1DPqtSFToib+3PTGR7XU9L1tsihy3b+pYoR6pyMYVA1
 k6WYtGE8cc+iFKFFrw4cply/ZFq9XjfBUuh2zxeY8Hdim5CVeT/EG9YiISWnBCpxCjJJESQLg
 sHy7A796YTeYgVm0UWZpXPCk0quWO3Vr0d1tHlrgDgZz//8SY9fkCgcBMf1MBPSDfXT7Dwn+q
 vBYKvbFEqpv1q7VkNSLXYQlQCtfFv/mJJXO3Oq/OxjlCjh3v6oaQRln+mFGEm45iLxLK3WaPO
 QWVmZ06CcUJdEd2VcG6d4d3ciiE43e7bmSfsaEjbng0GBdW+J7fzJwvgnzr2PIyhPBS7CgPf1
 eh+v8BQPFm0AcwmpadzejkcQoyDTIDD3PEwI2+nAx7MXi+fmsKxmjH9/H8orTacay43YTY6g9
 vuVZ2u9OlE3SCeu8x6+C71qop/PlyO1YIfpVqqRSgtoVSmfV0EN+z57J1BnpgvPWZ+jyh+Hn6
 3cxYMseSYU853I4PWJ98OwNpeJDrIJBpToG5P4leR7LYTZzSg6b00qVB5zByRSCgNt3p9mh3Z
 7KK0IbiY2wgYJz1nzI5KJSkclihbP7QJJohKAXIzCjbe3sPq2j8VNGMnle6H8ayMMfYLyI7iy
 v0/ESptTdcbICqgkbhisBv/X/Re0bYFo1nmVHP7KOG5K62Ye3UBLqvd0e8o19DaQ7AmWvtuq5
 vs77nyZC7rCalIHztrUJk/AFln4pq13VklQGo9ozlcU4aFJvtJbco4/AVUp5TxzOT5iXcfAjf
 r3qzt5WqjE+GIhotO1zQAzSDbaYrYmLLk+aR+rYMXucF/urlEpM69pbxbpB7KCbqgOXiHlDgE
 F6oGD2YLHZxJdTWYNR3KOYd2KhVkmKbY3ax6HLl4pysEsy9dpqdKZPZvCfEaU0b9X/rMiZd/u
 pqvF+A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_100346_102554_33F75478 
X-CRM114-Status: UNSURE (   6.37  )
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

>  1 file changed, 1 insertion(+)
>  mode change 100644 => 100755 drivers/mtd/mtdcore.c

I find this information suspicious.
Is such a modification really required?

Regards,
Markus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
