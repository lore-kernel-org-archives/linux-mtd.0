Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B59C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 17:30:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09D660231
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 17:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E09D660231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYei1dUstLK+HrU9044qM2sUttsLDl7wcrUgrearZMc=; b=OW0q6lKRzHwm/l
	2fskt3IGkafSA0LZmfDsAu1O6VgTHX3HJJGFNeLikNNn6IEBeHhMp3grB6zyTiqC3kFENfT8SLP4C
	jRKnPFJ8gvcQ+i6uljPcsBdtxhhrQqdk7M4O/Dx9hv6KeojTyCnuyyPeCKwCLjbxnSJTUxw4BOaEI
	EW6vcSvZDydz2nWhltyxitHJQzXOE9CEdyhkOnt8sNAnx9QfH3pgQBWS9vidhtvZyi6A5+fHOS3wz
	n+jmThmERHEtYVTpt/4Qa+RDLhLUromzmeZdKgZT3dfZtaHxrBlhk5y+PElBtIqNWtfTXf1G0U7ke
	Fo6nZUhdkocwjf3v7DtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG2uT-0038kH-O3; Tue, 17 Aug 2021 17:29:57 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG2uO-0038ju-Mo
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 17:29:56 +0000
Received: from skn-laptop (_gateway [172.25.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id 00493440D69;
 Tue, 17 Aug 2021 17:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1629221387; bh=FPnsNEknMW51PjerbPw5J1Vc/K/EFlv5JT8sE/sLHfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=FocYJlrLLN/FjgC7UEIOSvuWXLQkzlYHJxyZ0kHjHEjEbDL8Yipr6SsDANKazVLzt
 fkTyu23e5djs4hobO31ztzJD9a7vqqKYgEx9tcrOqXo+pJO4HVphBVX+rB1TbZ5WDM
 bxvNJW7BOBLFfQs36n77xGq4HdzEsNsikHHt9h8LDPpsQfoDFrRfhgNNpuSoCH1f/u
 VRCfZJ0ndeFJn43kMniI+72vvES/E8rNia8la4NdmvJ6/Grkz/zsraE1z9AE78pF4Q
 J/kP9pYVlOmdcBq1c1gTbDXJorEW1y4nxtA39lpj5XfHWt12yZ7OqMu5Jl/H6DmFVi
 AA/LI5XfsaxAA==
Date: Tue, 17 Aug 2021 19:29:45 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: s.hauer@pengutronix.de, miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-pm@vger.kernel.org, han.xu@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [BUG RESEND] unsuspend failure under load
Message-ID: <20210817172945.pr26wnoum7y5d7px@skn-laptop>
References: <20210705065833.2ezlhaspkkju4bh7@skn-laptop>
 <20210706093541.f4kjxqrkft7fqbcx@skn-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706093541.f4kjxqrkft7fqbcx@skn-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_102952_940553_DABB38CD 
X-CRM114-Status: GOOD (  22.25  )
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

On Tue, Jul 06, 2021 at 11:35:44AM +0200, Sean Nyekjaer wrote:
> On Mon, Jul 05, 2021 at 08:58:38AM +0200, Sean Nyekjaer wrote:
> > Hi Miquel and Sascha,
> + Richard + linux-pm
> > 
> > We are having some trouble when our i.MX6 unsuspends while writes to
> > ubifs is in progess. In the log it looks like it syncing the filesystem
> > before suspend.
> > 
> > The SoC a i.MX6ul/ull, the issue is (lucky for us) quite easy to reproduce.
> > The reproduce script: [0]
> > Kernel log when it happens: [1]
> > 
> > I have bisected the bug to: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
> > 
> > Any idea to where I should start looking? or to what happens?
> > 
> > Esben have posted to patches that relates to suspend/unsuspend but it
> > doesn't seem to releated to this issue.
> > 5bc6bb603b4d ("mtd: rawnand: gpmi: Fix suspend/resume problem")
> > d70486668cdf ("mtd: rawnand: gpmi: Restore nfc timing setup after suspend/resume")
> > 
> > /Sean
> 
> nand_resume() is called some time after ubi_io_write tries to write. Thats why
> mtd_write() is returning -EBUSY.
> 
> I have tried patch [3], and it seems to fix it.
> I think it would be okay to add the retry option, but the mdelay is not
> obviously a nogo.
> 
> Any idea to how we could wait here for the nand_resume() to be called?
> 
> @linux-pm:
> I have noticed "Filsystems sync" happens before "Freezing user space
> processes".
> If I apply patch [4] (without [3]), it would also fix our issue. But I
> don't have en insight in to what impact the change might have.
> 
> /Sean
> 

Ping Miquel + Sascha,

Have you had time to take a look at this?

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
