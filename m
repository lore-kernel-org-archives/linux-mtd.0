Received: from e36.co.us.ibm.com ([32.97.110.154])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jt40E-0008La-Mi
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 16:57:29 +0000
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m45GvM4C002301
	for <linux-mtd@lists.infradead.org>; Mon, 5 May 2008 12:57:22 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m45GvMuC211934
	for <linux-mtd@lists.infradead.org>; Mon, 5 May 2008 10:57:22 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m45GvLmp004548
	for <linux-mtd@lists.infradead.org>; Mon, 5 May 2008 10:57:22 -0600
Date: Mon, 5 May 2008 11:56:22 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: "Yigal Sadgat" <YSadgat1@gcte.com>
Subject: Re: Compact Flash Questions
Message-ID: <20080505115622.37dd45d4@zod.rchland.ibm.com>
In-Reply-To: <004701c8aec5$c1aed530$6401a8c0@techwriter>
References: <004701c8aec5$c1aed530$6401a8c0@techwriter>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 5 May 2008 08:36:15 -0700
"Yigal Sadgat" <YSadgat1@gcte.com> wrote:

> Is this the right place to discuss CF low-level questions like Kernel 
> drivers?

Sorry, no.  Compact Flash presents itself as an IDE device, and does
not allow access to the raw flash contained within.  MTD is used for
accessing raw flash.

You might try posting your questions on the linux kernel mailing list.

josh
