Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22ACCEDD97
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGengJ9HaaAFeGvThRqkJUsKfs11tlRQGxiPYmXx2qU=; b=vHOrJ//8nNYB73
	k6eh118mUUVEyCJOlFo4T6v9dthxf6Cns+y+22box82KJond+F7wy0U0KMWx9IeOPdOktUNHTAuEe
	TXVqzN9zGP2Qw0DSw0EdoKf3ltD48S8piMM/xsztyBMhpK9DKXxlQW71TEr7lyoT9xieW0+74uttP
	zjfi55+2sNDzbEUSTKPA+iZtuP571uUoer9ZfeVcMDppohZ3xEXrtZvbl2gkWzJHUVYTvFUIR3v+6
	sgu7Ru2f/oxD35WG1bxc73dl1EczD0KP98jOQnsNNDioIRuhsYvaNIYVkbOAoSshukqBeA3Wa1Dph
	K0lE4YQ4bmMMJh0NhFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMZi-00000000YFo-3cu4;
	Tue, 18 Nov 2025 14:20:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMZg-00000000YFA-3VjS
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 14:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5403C44600;
	Tue, 18 Nov 2025 14:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E111BC4CEF5;
	Tue, 18 Nov 2025 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763475650;
	bh=3jd00Ac/FJwEeTf9v0otEGFSOiyjK5LXbL8h3GvK+RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNphNOqTp68eZzSpU3NxCCVdNfO/nPD3v+1lV3TD8qoh8QhGcVchZQ8Spv5RCrFnD
	 AOas3xHW33tihYyqSiI+uFzqITQ+OOwoGWbvVEmt+D+qdyUIPIQmQDJB5oUFnhEuR+
	 9KdUZQtmMPj2JYzrfxYnjGy4vrl7A5yAMoLzhuE0=
Date: Tue, 18 Nov 2025 09:20:48 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Jakub Czapiga <czapiga@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konrad Adamczyk <konrada@google.com>, Adeel Arshad <adeel.arshad@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Kornel Duleba <korneld@google.com>
Subject: Re: [PATCH v2] mtd: spi-nor: core: Check read CR support
Message-ID: <20251118-stereotyped-quizzical-dolphin-9a7bb4@lemur>
References: <20250919181547.2172319-1-czapiga@google.com>
 <mafs0v7j74iz0.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mafs0v7j74iz0.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_062052_931959_6F644068 
X-CRM114-Status: UNSURE (   5.42  )
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

On Tue, Nov 18, 2025 at 01:34:59PM +0100, Pratyush Yadav wrote:
> BTW, b4 complains that DKIM fails on your email. Please check.

This is due to Google's policy of setting very short expiration dates in their
DKIM headers:

    t=1758305794; x=1758910594;

It's set to invalidate after 1 week:

    $ date -d '@1758305794'
    Fri 19 Sep 2025 02:16:34 PM EDT
    $ date -d '@1758910594'
    Fri 26 Sep 2025 02:16:34 PM EDT

-K

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
