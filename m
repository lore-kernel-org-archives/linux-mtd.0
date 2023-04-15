Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E66BC77B70
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Apr 2023 18:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLm97HDeCE3vks8jWfyvWlSL2lwr3bQnsniVjWYDXb8=; b=yjtmzMX0G6OQx6
	DuLCX5xhMffItGBibf7RsKYakcMCneE4eiVtOoX3ZBDFPBvqNCQjGK8aeR18AQXznSNsJO4s0JylP
	s/pd8gud1jn1pAiJgWr0AGBA08q210mReKCxLDzzIZSmengxAh1KkN7aPCmxtSXBBun6xj8YayGLx
	GRuqZqd9RWKqOfA8tGxuqB6kqXRMYuvBh84RngM/E51cOQvuBpnYjRHQOO2sxlG3OfMm9yXJhHLBu
	0WhslVhC467gWINy5Ktbgj7JMQHn2P7U3/GedfM0pMHXp8wRCrVkXKcpLzhMrJtHgya7WBbh+YIS8
	v8Gwba3oU0YISYanTrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkk2-00CbfZ-1B;
	Sat, 15 Apr 2023 18:35:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkjy-00Cbf4-3A
	for linux-mtd@lists.infradead.org;
	Sat, 15 Apr 2023 18:35:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3372660919;
	Sat, 15 Apr 2023 18:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40650C433EF;
	Sat, 15 Apr 2023 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681583712;
	bh=s6DtTj1DrMd0tN2/E2PvAPkgoaCLFuSXLjxP2BgPvwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=toy5hTogmFa158ceZQGhUyj83ts0RU3KnO1cNqTSVRe0/TJ/6ZNYZt7KVdNNqf6Iw
	 YBXLkEbFe8T7K5aovnKYPx/5lqnU6ujzcXM3OFVVCCiy2QvNLfJbkl4uLPOESmH5Xc
	 o5N256EJXSe37ZW7OtBNTpbdG5Y5awO37Pfz6xUw=
Date: Sat, 15 Apr 2023 20:35:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard Weinberger <richard@nod.at>
Cc: Daniel Golle <daniel@makrotopia.org>, stable <stable@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	chengzhihao1 <chengzhihao1@huawei.com>,
	Nicolas Schichan <nschichan@freebox.fr>,
	George Kennedy <george.kennedy@oracle.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	yi zhang <yi.zhang@huawei.com>
Subject: Re: Request to pick "ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size"
Message-ID: <2023041544-unending-glowing-e5ce@gregkh>
References: <ZDrmsnX5BHxtBNwf@makrotopia.org>
 <288240559.69421.1681583177740.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <288240559.69421.1681583177740.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_113515_084303_937B6B56 
X-CRM114-Status: GOOD (  11.08  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Apr 15, 2023 at 08:26:17PM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Daniel Golle" <daniel@makrotopia.org>
> > An: "stable" <stable@vger.kernel.org>, "linux-mtd" <linux-mtd@lists.inf=
radead.org>
> > CC: "Hauke Mehrtens" <hauke@hauke-m.de>, "richard" <richard@nod.at>, "M=
iquel Raynal" <miquel.raynal@bootlin.com>,
> > "chengzhihao1" <chengzhihao1@huawei.com>, "Nicolas Schichan" <nschichan=
@freebox.fr>, "George Kennedy"
> > <george.kennedy@oracle.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "=
yi zhang" <yi.zhang@huawei.com>
> > Gesendet: Samstag, 15. April 2023 20:02:26
> > Betreff: Request to pick "ubi: Fix failure attaching when vid_hdr offse=
t equals to (sub)page size"
> =

> > Hi,
> > =

> > please pick
> > =

> > 1e020e1b96afd ("ubi: Fix failure attaching when vid_hdr offset equals to
> > (sub)page size")
> > =

> > from linux-next to stable trees.
> =

> FYI, the fix is not yet in Linus' master. But I guess it will be very soo=
n.
> The pull request is on the mailinglist.

Any specific reason why it wasn't tagged cc: stable@ if it was known to
be fixing a regression so that we would pick it up automatically?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
