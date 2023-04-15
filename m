Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBB2C77B70
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Apr 2023 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emN1ppzo8DKm4B86C9nTPpEJ+iaGGxXKn/1lACEkmgs=; b=zAO+2GZJei3G89
	XgjNLhKSfHIqpFK1Z5Tnv50ZhmKgGoL6zAcioak/k94pDy7FUXYF/fgXffhMZjUdFTYxkM0HdBza3
	Dutelm3YwZpDYlV8LKS5mrBVZftsOTVicQBKkl3iINgEZY9xPIMsKJACz2mfNc0HhDtdQ3ZQFkV/w
	3OhVKXDaa4A4T5qSOlbDlaEluAAiG6pY7xDud23/Qry/Xd1nSoY8HLOGNESWRxy5A1PgcdYa4Jqtm
	T3/eQEYOO5jbhpCMP5qYgW1QU87pCrfU6Z+6tbZrByTOMwjIQyw0Zsta0jOyDTJNy+woEjLnHwZTa
	KtQi61GN4WIW3s4UBctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkZN-00Caqz-2G;
	Sat, 15 Apr 2023 18:24:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkZK-00CaqV-2C
	for linux-mtd@lists.infradead.org;
	Sat, 15 Apr 2023 18:24:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F84A60AEC;
	Sat, 15 Apr 2023 18:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E03C433D2;
	Sat, 15 Apr 2023 18:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681583051;
	bh=YF72SfoF2pTzrbXRltpXexbRMU/SGC3inSWNoNP0npw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2U1e5EcjDh1nVnWsiufxZSUgcSW0h0oOztc1dQ9mAdqWX0eA/rqFhUVEdjtU8xOUV
	 ZmUiLM6TLXXBOba6iWUqESujkiMWhmk0BiF29An0b2yYHiY9HMbp104a/aW6zXWjwP
	 dGVQEDnU5+kLyYrZUgQVqS76R6NcZ06GpbUo9Cgk=
Date: Sat, 15 Apr 2023 20:24:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: stable@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	chengzhihao1 <chengzhihao1@huawei.com>,
	Nicolas Schichan <nschichan@freebox.fr>,
	George Kennedy <george.kennedy@oracle.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	yi zhang <yi.zhang@huawei.com>
Subject: Re: Request to pick "ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size"
Message-ID: <2023041516-delegate-usual-5880@gregkh>
References: <ZDrmsnX5BHxtBNwf@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZDrmsnX5BHxtBNwf@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_112414_771190_83478425 
X-CRM114-Status: GOOD (  10.30  )
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

On Sat, Apr 15, 2023 at 07:02:26PM +0100, Daniel Golle wrote:
> Hi,
> 
> please pick
> 
>  1e020e1b96afd ("ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size")
> 
> from linux-next to stable trees.

We need to have it hit Linus's tree first.  Any reason why it isn't
there yet?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
