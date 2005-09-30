Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELLhL-0003KF-W7
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 10:17:38 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j8UEHBRA007054
	for <linux-mtd@lists.infradead.org>; Fri, 30 Sep 2005 10:17:11 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j8UEHBZQ092572
	for <linux-mtd@lists.infradead.org>; Fri, 30 Sep 2005 10:17:11 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j8UEHAia002804
	for <linux-mtd@lists.infradead.org>; Fri, 30 Sep 2005 10:17:10 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <433D482A.1000708@ru.mvista.com>
References: <20050930121741.GA5506@elf.ucw.cz> <433D482A.1000708@ru.mvista.com>
Content-Type: text/plain
Date: Fri, 30 Sep 2005 09:17:07 -0500
Message-Id: <1128089827.3111.2.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	kernel list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [patch] switch mtd to new driver model & cleanups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-09-30 at 18:14 +0400, Vitaly Wool wrote:
> Hi Pavel,
> 
> it looks like your patch is not against the latest linux-mtd CVS sources 
> since there's no such things as mtd_pm_dev in the current one. Please 
> correct me if I'm mistaken.

I'm assuming Pavel is just fixing up what's in the mainline kernel.
This happens quite often, since MTD doesn't sync all too much for
various reasons.

When a sync is done, stuff like this usually gets picked up in some form
for the MTD CVS tree.  See the commit messages that say things like
"Merge with upstream".

josh
