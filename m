Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2C0C61DA4
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Mar 2023 08:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmJ9QcUTuiA1eLkq900dAcNOM1viGAj5n0GdlDZIagQ=; b=dG24Hp4MY30dVb
	yDeNcqVT2HWax6aR+O1LJycOck8P57vJMA2iNjtfKLxXP9gDQFn+H9PAXZd0hAEzuZV0DMlcrgMcm
	cwEGboxuNI2OabLGwToQZ/QSdtjSSIX15RvA2tx79xqY8vpd8/oRRC962589BarWbCCJRsD/rBPIZ
	dqg0SJQ87TnC3pa2cj41EWuVvm+V53SIyWBfX/oNK6u0rnLADb3JpnOgcP3J5lvpthoHQ0XQZM2lI
	pro8AdOXscq3Ysj+lRgmaxuYBT8K8BL6FLks/1YwPbPlIkxFDG+bbryUsc1079HooDzu7BlC/nyb1
	mRaNaf+zwj3ZAj8cswoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pauNa-00HTcN-K1; Sat, 11 Mar 2023 08:15:02 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pauNV-00HTb4-HH
	for linux-mtd@lists.infradead.org; Sat, 11 Mar 2023 08:14:59 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2969968AA6; Sat, 11 Mar 2023 09:14:47 +0100 (CET)
Date: Sat, 11 Mar 2023 09:14:46 +0100
From: hch <hch@lst.de>
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>,
	Daniel Palmer <daniel@0x0f.com>, hch <hch@lst.de>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS updates for v6.3-rc1
Message-ID: <20230311081446.GA17461@lst.de>
References: <1115586887.187161.1677658022188.JavaMail.zimbra@nod.at> <CAFr9PXktRBm66vgVjOnwTeucBD36OuPjDVNd9cH1F8u0nesKrA@mail.gmail.com> <CAHk-=wi29bbBNh3RqJKu3PxzpjDN5D5K17gEVtXrb7-6bfrnMQ@mail.gmail.com> <349964589.230468.1678469537890.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <349964589.230468.1678469537890.JavaMail.zimbra@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_001457_750761_C3A469B7 
X-CRM114-Status: UNSURE (   8.16  )
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

On Fri, Mar 10, 2023 at 06:32:17PM +0100, Richard Weinberger wrote:
> Indeed, I'm able to reproduce the problem and adding blk_mq_end_request()
> back fixes it.

Yes, that was my braino about failures from ->queue_req being handled
by the block layer by doing completions, but successful I/O of course
is not. 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
