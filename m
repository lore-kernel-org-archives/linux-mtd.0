Received: from e34.co.us.ibm.com ([32.97.110.152])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1IqIiI-00052G-CE
	for linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 20:31:21 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id lA91V0FT015855
	for <linux-mtd@lists.infradead.org>; Thu, 8 Nov 2007 20:31:00 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	lA91V0ZH126320
	for <linux-mtd@lists.infradead.org>; Thu, 8 Nov 2007 18:31:00 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	lA91UxRm027875
	for <linux-mtd@lists.infradead.org>; Thu, 8 Nov 2007 18:30:59 -0700
Date: Thu, 8 Nov 2007 19:30:51 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
Message-ID: <20071108193051.5a69cd60@zod.rchland.ibm.com>
In-Reply-To: <752503.63551.qm@web43139.mail.sp1.yahoo.com>
References: <752503.63551.qm@web43139.mail.sp1.yahoo.com>
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

On Thu, 8 Nov 2007 16:03:40 -0800 (PST)
Justin Treon <justin_treon@yahoo.com> wrote:

> Adding the ability to unlocking all Intel flash that is locked on power up. 
> Currently only Intel P30 flash is unlocked.  All Intel flash is locked on power up.

Um, it most certainly is not.

josh
