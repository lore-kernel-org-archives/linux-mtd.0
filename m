Received: from e31.co.us.ibm.com ([32.97.110.129])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CqWIF-0004KG-TT
	for linux-mtd@lists.infradead.org; Mon, 17 Jan 2005 07:47:41 -0500
Received: from westrelay03.boulder.ibm.com (westrelay03.boulder.ibm.com
	[9.17.195.12])
	by e31.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j0HClVm4107028
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2005 07:47:31 -0500
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by westrelay03.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0HClVaD357902
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2005 05:47:31 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j0HClVdg027081
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2005 05:47:31 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0501141618070.32614@localhost.localdomain>
References: <Pine.LNX.4.61.0501141618070.32614@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1105966050.5668.3.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 17 Jan 2005 06:47:31 -0600
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: what's up with JFFS3?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-14 at 15:19, Robert P. J. Day wrote:
>   i just CVS checked out the latest mtd/ stuff from infradead.org, and
> noticed (for the first time), the small amount of jffs3 stuff in
> there.  what's that all about?  just preliminary content in
> preparation?  is there a web page on JFFS3 anywhere one might go to
> get educated?  thanks.

It's a JFFS2 clone, with some debug output changes, and a patch that
speeds up mounting time (aka the Summary Patch).

It was forked to allow some new features to be developed, etc.  No
webpage for education, since there really isn't much to be educated on
yet.  The TODO in that dir has some proposed goals.  Other than that,
"Use the Source, Luke" :).

josh
