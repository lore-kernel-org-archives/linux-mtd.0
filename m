Return-Path: <SRS0=JW0y=I5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFBEC433C1
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Mar 2021 00:01:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA6AC619D3
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Mar 2021 00:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA6AC619D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2beGLMpZoQ0BZY2zSZdItKSA1zEXQg+gSda0g33ih9k=; b=Ia+UPoG9YI7uPqDAzvz3qkyaY
	R9bAZ7tzGv3yse4igFGNQ/lMlLyr8wrj1Thfs5GV11d682bgjeusuSOes0sOur+ovjZ+iFNr/Oqfp
	A1X1xAlvI0QIbYmdkmqXhy3VFhP84ndAWK+fqw2J0iUPreiMjxHAXapQpl9Xcj8AQD55By8fC0vFZ
	XaJ/UqSWu1ydqbskgxabnN7t0ZMSenPuTKXlDi4lIBAF5lJNitVIY+UVvbPxvTAEdYbs5fZUN+Bmt
	unh9Csm3J+XN5tvOAvB+K7UNjw6Z1oenxl7RYZb2J7FTqyAnasOKPvj8WZIN8VrTKZfopIIBq9wGk
	2U+TnYOtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lROHb-0059ag-ME; Wed, 31 Mar 2021 00:00:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lROHM-0059Y2-VP
 for linux-mtd@lists.infradead.org; Wed, 31 Mar 2021 00:00:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B050619D7;
 Wed, 31 Mar 2021 00:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617148811;
 bh=ysOe6gV6VLVY/dAxzArYun+ymQ/xTKzYhzoq2I0b7ZA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GUHx+9enHBcPboBFsqMeROxBsZDrztZWphS/QWzotm4t6PymL1JVfkEMME30Xpmyn
 g16hMNrBb6yX1aelq3wYjHKsQqRMHNPbiHAEH5QorFe0QtppS4n+3mKiy5urMe+8yU
 1GAVh7PeyFULyFpeO9scl894T+9XUZi43uMDU2ms34M4ZdKqVfKWPPWhl8/Iy+nQQ+
 dRe1VobZ/vbEL3zA527cszGOAk56/t6yhxFM7yRkgTqFhCT+jK4wRXkjDQZcsAa5Zs
 5XYnVt9+a/t8NpzvkB/0F4D0a4wq8R+wjKQbAAI1OvRJKkpec+Ezvo5W1CAAS5ndx7
 G9mVp25a4iisg==
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] Clean up obsolete TODO files
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161714881133.29090.6649016688836045626.git-patchwork-notify@kernel.org>
Date: Wed, 31 Mar 2021 00:00:11 +0000
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
To: Wang Qing <wangqing@vivo.com>
Cc: tsbogend@alpha.franken.de, aacraid@microsemi.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, luisbg@kernel.org, salah.triki@gmail.com,
 dwmw2@infradead.org, richard@nod.at, ralf@linux-mips.org,
 davem@davemloft.net, kuba@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
 gregkh@linuxfoundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_010014_548675_0EA0FB06 
X-CRM114-Status: UNSURE (   9.22  )
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

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Tue, 30 Mar 2021 15:02:43 +0800 you wrote:
> It is mentioned in the official documents of the Linux Foundation and WIKI
> that you can participate in its development according to the TODO files of
> each module.
> 
> But the TODO files here has not been updated for 15 years, and the function
> development described in the file have been implemented or abandoned.
> 
> [...]

Here is the summary with links:
  - [1/6] mips/sgi-ip27: Delete obsolete TODO file
    https://git.kernel.org/netdev/net-next/c/0f1b2a4912b2
  - [2/6] scsi/aacraid: Delete obsolete TODO file
    https://git.kernel.org/netdev/net-next/c/ef843f261b88
  - [3/6] fs/befs: Delete obsolete TODO file
    https://git.kernel.org/netdev/net-next/c/22612b4e6039
  - [4/6] fs/jffs2: Delete obsolete TODO file
    https://git.kernel.org/netdev/net-next/c/ab36ba4f3a81
  - [5/6] net/ax25: Delete obsolete TODO file
    https://git.kernel.org/netdev/net-next/c/8d9e5bbf5c68
  - [6/6] net/decnet: Delete obsolete TODO file
    https://git.kernel.org/netdev/net-next/c/b9aa074b896b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
