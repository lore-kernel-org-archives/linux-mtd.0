Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ooki-0004B3-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2001 17:20:09 +0100
Date: Wed, 3 Oct 2001 18:29:04 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Cc: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Subject: Re: JFFS2_RESERVED_BLOCKS_*
Message-ID: <20011003182904.C21578@wohnheim.fh-wedel.de>
References: <20011002091421.A15650@recycle.lbl.gov> <30731.1002040544@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30731.1002040544@redhat.com>; from dwmw2@infradead.org on Tue, Oct 02, 2001 at 05:35:44PM +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

> Theoretical minimum is one block, not five. Give me formal proof that 
> this is also the _practical_ minimum, and we can drop the 
> overly-conservative limits.

Formal proof is a tough one. But the difference between theoretical
and practical minimum should be a couple of bugs, that might be found
with a bigger userbase.
What wheel do I have to turn, to lower the limit myself?

Jörn

-- 
To solve an interesting problem, 
start by finding a problem that is interesting to you.
