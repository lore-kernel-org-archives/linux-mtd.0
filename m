Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AFEC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9E6P1xkkG1mu6Uklesf/bwocwj22bOFim0ybHhg2zw=; b=kG6aw523XYSgGG
	MOrsjpZ+EIXaRRBtdC3nvOQi05DbfADqG2JT6dEAu1PLgzNgToZeHw77oVexFlpndLdB/jZ6xiFlx
	DyNDmQH0N6KqEmEDurybTZdpSUoANZEEpHd8o07p40z51pwjCy5/2imqce2CLI29OP+L6E7pn4far
	yMNAmuEtm1YdDvCeO8nkXnrgVB1GiM6IsYyUDJfoeF+VBel/SL6TJKwp3wC0uJNCbiZOHOFGiQMXr
	cZpLuvoTwfiIvqFsZInY3oeqnLgjYHST3icqMDzXjk3q92nsYtsEuilDAk+me6IgUVdBiYwLPQ43o
	JN4pXWq0BU5+wUZv8sTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYjm-001tB8-CP; Tue, 20 Sep 2022 08:36:14 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhY-001rEx-BC
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:33:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 81B704001B;
	Tue, 20 Sep 2022 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTNKFIz45ZPZj71J12Gcu1Bo9Rngcq86HefzYguO+wY=;
	b=HTVawlf/jkZs3RU6DVLQGRhmAlS+dk7QQFr/Xk24zml/INT/C5h2UNfWVkE56g1wWXKReR
	Xni6XcfOM2TlhNcC+BD/V0gknYvL4uaSZtxIHzAo00qq++PgRDTDCML/TwLX+2DAA9D6rb
	50iPOct+g6I91VHAoOMSZBh3ah36paTeAEMvIyf4M0+ZcgTfK81Qbj1P3VEQ+cO90MTnpE
	yzPXob3Nn+5nLyJTl6gE2YehxNPQebA6rn2lNVwoH6kKa9gxLwHnUGhHNS8smBsZ3jCLuM
	gmONxjSEoQbdy5YE+6v3KazQs46/Sf9NogIf2fqDLQ0dVDgwnzjOFgc/4NJ7og==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: cgel.zte@gmail.com,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	yangyingliang@huawei.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] mtd: rawnand: Remove the unneeded result variable
Date: Tue, 20 Sep 2022 10:33:50 +0200
Message-Id: <20220920083350.601092-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901074555.313266-1-ye.xingchen@zte.com.cn>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'15a3269417459c09215c64c1d18441cb0727ef28'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013356_666270_980D960A 
X-CRM114-Status: UNSURE (   5.63  )
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

On Thu, 2022-09-01 at 07:45:54 UTC, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value cadence_nand_set_access_width16() directly instead of
> storing it in another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
