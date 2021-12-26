Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E036AC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Dec 2021 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UNnH3zhXkxrs2PieLM37dWimg5nYPY+/8xOklxaWyM0=; b=g32G1M0c8uMHke
	f6T7pY+VvLaWXLZ56MLgP2FOh+W7V0/dYTzVAI0a8ilqgEy3rCUBOLw4eZORIlRDLmBFb0ecRk6Nb
	RJRBGMcVBc8FBwceqI3cnTLPAbfawO/cVqnuIJnNh2ntEQzbCRmXNrLZDKrRdK09iYmkLzfM7m/kp
	5dM0auw0RsMdUrJ5jM7wZf6rVVqVAI97OTMAv5QnbBEcYEPBjHgWuSViRMCRB9WS10X6bHOa9NLyH
	3HwWp+OyDd6PqWmRH1+Rgp6VTyEqcyowktpSWRX+kC9NNNi6xIqAMeVTmCKU2zhyAT7r47vvgVCJJ
	RhB1TJ5G/oh3JsKWY4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1Pqp-00FPZ8-7O; Sun, 26 Dec 2021 09:29:59 +0000
Received: from slot0.jllresort.com ([62.197.136.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1Pqg-00FPWN-Fr
 for linux-mtd@lists.infradead.org; Sun, 26 Dec 2021 09:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=jllresort.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=ele.mon@jllresort.com; bh=uxkHHwH/13+v35QJoKx48Pnu5Ys=;
 b=WH5lw0KT0dHKrK/oNqS3okuFECRo34PPkro5j8TH91p51K9Wnmf38B2L94tj56rElE/R/bs0EPrg
 j+YEly8cXQjxjTapOmfjN5eTAH8GaanNe9i0zj/UCw/sBXwfBzv/ZGRh3FNLb7BJEqCzNTTUmjdO
 fcrPSUALb+Zm2zCtn+xhZKG3K6TcS1CZkF6qYzdVjqbqvbwcSgYNqDLv+Kv9nrj6AmiLyfaOhhMk
 RUwz3BBn22uB6t0dNE7e8m/xVI9PRiN7jcV52PJBbzsCx9gIFEO4uBnDk7QMD71/A/nSXRDnhppc
 +4+QeOPsiD/Q/blmn7cPf3o/WULJeiK6dGaM8A==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=jllresort.com;
 b=MmWb4liRlu2S57vVSgXXx/Dy73KbjLYp2q/ny9dXtKhcyj/2ZP0wPAy0DhnK4qql+bMAcmjwOfYg
 +90YErZi7DjlzadRMU2F9S9gUJlQDjoNBhp0VvpFhRAFFHUw37aFb1PaKbUAs3w26lTL3XiVm7TX
 902/hXBfMib73Glu7CYnOQBpZ2lU+ipR7E034JT4olW3L0CVPJ+ZzoLU7fLvw9VNZ6hK9rNJK4fp
 LFYVvWNQf/4PziwDLbMHmhtNvMgB2Qi9HnZ2zBhoaxz/2M85U9T2xJLN6ScnElbrnIEIwQqCRsp4
 lSrhcCLIdKS2qtOwLviU6XiGQszfS40viHHcgA==;
From: ele.mon@jllresort.com
To: linux-mtd@lists.infradead.org
Subject: Happy Weekend:
Date: 26 Dec 2021 10:29:27 +0100
Message-ID: <20211226102855.34834A02B6B218FF@jllresort.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_012950_785660_362100DA 
X-CRM114-Status: UNSURE (  -1.11  )
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
Reply-To: mustafa.ayvaz@ayvazburosu.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Greetings to you linux-mtd,

I was wondering if you got my previous email? I have been trying 
to reach you by email linux-mtd@lists.infradead.org, kindly get 
back to me swiftly, it is very important and urgent.

Thanks
Mustafa Ayvaz
Email: mustafa.ayvaz@ayvazburosu.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
