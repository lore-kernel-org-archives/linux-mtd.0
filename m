Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D85C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 09:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5AD4218D0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 09:15:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nH3NANbw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yTlEjUbt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5AD4218D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2HOBTm3NLR6wVuSWv04e7CwpfDD72By3iIZpT1XWdk=; b=nH3NANbwmE094I
	d8Xv6WbFHbfA/FZU/N/olo0LwBhN3qGX5/4U7ymFpzv6kngpOL4qu0+oDaD7IS59qZOs7YtKPyp6R
	L8fE3/BcUeoxG4jRYit07pFuAiUa0W2NFU39cqRJtmAakCWV7knZyHMiAzDyT7zgV9opwFGxkUlNX
	FIXO1tH6Ecd+xR6jDENh5i+9s1YJafhcf+HbnLbulpzxh8KShctfzko3K7GOUkOAvVZSTVnaF6fZ8
	Fw+efIt7B6C97YDbKipuZI9kd1G9kfSdXqzDJhKEs++90+Ny5nMcUbiKpWL6lx9zX6K8ki5wMLMNA
	Cl6hf1UgTSHq/U6a9njw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmxaP-00040A-5I; Fri, 25 Jan 2019 09:15:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmxaM-0003zi-5q
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 09:15:39 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD6A2218D0;
 Fri, 25 Jan 2019 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548407734;
 bh=lgDP1t7nkfB1KzYnJTwdGbN0cSeYEmf9nUjUYEc+PJw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=yTlEjUbtiUs4UMLnYdN25qy/4P4yW863A3ms8c0GVR1aSvR7vbOcJ7GqnBiB3vYSU
 v0d5x+FsKt3p6BqrsD16+7jMYVuazM1HThaxyxEBjIy1KoAWPvYKPIonYTwS3iLt7h
 mpM+otAKKwU5PY3UBuytkx11I4SIeMTu+k6TyD2g=
Date: Fri, 25 Jan 2019 10:15:24 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [Question] should {read,write}_page hooks moved to
 nand_controller_ops ?
Message-ID: <20190125101508.57f39514@bbrezillon>
In-Reply-To: <CAK7LNAStZip5agGJZg8o_-k2re9zHuh0xHx8XiZVz3ixUmgXMg@mail.gmail.com>
References: <CAK7LNAStZip5agGJZg8o_-k2re9zHuh0xHx8XiZVz3ixUmgXMg@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_011538_273208_96C809D9 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Masahiro,

On Fri, 25 Jan 2019 17:23:28 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hello.
> 
> 
> Many hooks in nand_ecc_ctrl, such as read_page, write_page, etc.
> look controller-specific instead of per-chip.
> 
> Will they be moved to nand_controller_op or somewhere
> in the future?

Not exactly :-). I don't know if I should say it, but Miquel is working
on a generic NAND ECC engine framework which we'll try to re-use at the
raw NAND layer. The idea is to dissociate the ECC engine concept from
the NAND controller one. I imagine something like this:

	ecc_engine->prepare_page_io_req(nand, ioreq);
	nand_controller->do_page_io(nand, ioreq);
	ecc_engine->finish_page_io_req(nand, ioreq);

If we go for this approach, the nand controller should only have one
hook: ->do_page_io(), and this hook would indeed be placed in
nand_controller_ops. Once we have that in place, we can deprecate the
ecc field in nand_chip (by moving it to nand_legacy).

Of course, this implies making the raw NAND framework use the generic
NAND layer (which I started to work on here [1]).

> 
> Boris and Miquel are doing a great job
> for the NAND framework improvement.

Thanks.

> So, maybe it is already in their TODO list.

It is, but, given the amount of work needed, it's unlikely to pop up in
a near future.

Regards,

Boris

[1]https://github.com/bbrezillon/linux/commits/nand/cleanup

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
