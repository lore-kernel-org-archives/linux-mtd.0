Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D12C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 07:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkPvPk4gk0dWBcvV57QVtZvCaH/p+1alecVUvbq7zXs=; b=Hx+iU9bmQST08I
	c0p2xuXRbY/uYc9dDMgCDxz/HcVeQ+Wnv71RikW79xA7Jq42s7SwgiZ6hnD3AJSKG/tuTrQqB3Vy9
	RX0wR5ImgE4NT1tzaRCYd7RRFTL4HkuLY30A63K8G/48XV7ylwoD/FI5LvoKV+40KOI13P2fPRXGD
	iZA/tgb41slMefNmQ6Gb/6goIX4tv83A13aIjzAzA+vqIyXdrqOttUYhZUlL0ePyxCKbKnAfJNBBV
	GREVmOtdgLFY7o3zJP/XwhCMG/ZgSgN4Voh8me+ai7SpQ0ROoted+GAPOWIk61F2pd9psTzWzJ+Zx
	ON0g6OwKrLMJSy5qNViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghUM-007pbk-2v; Fri, 07 Oct 2022 07:09:42 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghUI-007pX9-Oz
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 07:09:40 +0000
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id E4E8E140E88;
	Fri,  7 Oct 2022 07:09:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id B10081A;
	Fri,  7 Oct 2022 07:09:18 +0000 (UTC)
Message-ID: <070d253e718c1a6d72fb52c1d2f02ec461d825a1.camel@perches.com>
Subject: Re: [PATCH v2 1/3] mtd: mtdoops: change printk() to counterpart pr_
 functions
From: Joe Perches <joe@perches.com>
To: Ray Zhang <sgzhang@google.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 07 Oct 2022 00:09:26 -0700
In-Reply-To: <20221007065042.700761-2-sgzhang@google.com>
References: <20221007065042.700761-1-sgzhang@google.com>
	 <20221007065042.700761-2-sgzhang@google.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: B10081A
X-Stat-Signature: qkebrjbky9z3nipsjqqg8geia3skbunk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+FNvk3gUfk70cxn43bf8wSIzJGdFCb53o=
X-HE-Tag: 1665126558-206398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_000938_902179_FA213796 
X-CRM114-Status: UNSURE (   8.99  )
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

On Fri, 2022-10-07 at 06:50 +0000, Ray Zhang wrote:
> To comply with latest kernel code requirement, change printk() to
> counterpart pr_ functions in mtdoops driver:
> - change printk(INFO) to pr_info()
> - change printk(DEBUG) to pr_debug()

There is a different behavior with printk(KERN_DEBUG to pr_debug(
as pr_debug is a no-op unless dynamic debugging is enabled or
DEBUG is defined.

And even with dynamic_debug, the output is default disabled unless
DEBUG is defined.

As is, printk(KERN_DEBUG is emitted unless the console level is low.

> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
[]
> @@ -120,8 +120,8 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
>  		return;
>  	}
>  
> -	printk(KERN_DEBUG "mtdoops: ready %d, %d (no erase)\n",
> -	       cxt->nextpage, cxt->nextcount);
> +	pr_debug("mtdoops: ready %d, %d (no erase)\n",
> +		 cxt->nextpage, cxt->nextcount);
>  }

etc...


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
