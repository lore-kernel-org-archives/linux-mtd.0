Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KVPvD-0004Ai-N5
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 12:02:47 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m7JBxsYt009951
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2008 07:59:54 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id
	m7JBxnHA241584
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2008 07:59:49 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m7JBxmWt030292
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2008 07:59:49 -0400
Date: Tue, 19 Aug 2008 07:59:48 -0400
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
Subject: Re: mkfs.ubifs was moved to mtd-utils
Message-ID: <20080819075948.7411a7f4@zod.rchland.ibm.com>
In-Reply-To: <1219135603.18027.15.camel@sauron>
References: <1219135603.18027.15.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 19 Aug 2008 11:46:43 +0300
Artem Bityutskiy <dedekind@infradead.org> wrote:

> Hi,
> 
> since UBIFS is in mainline now, the mkfs.ubifs utility has been
> moved to mtd-utils.git repository.
> 
> Josh, I am not sure how you do this, but could you please tag
> a new release of mtd-utils and may be make Fedora/Debian update
> their corresponding rpm/deb? Thanks.

David has done the tagging in the past, as he also uploads a tarball at
the same time.

I can handle updating Fedora (once Fedora is back).  I have no ties to
Debian though.

josh
