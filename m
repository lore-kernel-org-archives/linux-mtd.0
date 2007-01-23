Received: from over.co.us.ibm.com ([32.97.110.157])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H9CFp-0004qF-3z
	for linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 22:23:29 -0500
Received: from e2.ny.us.ibm.com (e2.pok.ibm.com [9.56.232.142])
	by bldfb.esmtp.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0N390VO011195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 22 Jan 2007 22:09:01 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id l0N2xrjc031691
	for <linux-mtd@lists.infradead.org>; Mon, 22 Jan 2007 21:59:53 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l0N2xrhP242336
	for <linux-mtd@lists.infradead.org>; Mon, 22 Jan 2007 21:59:53 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l0N2xrHr009453
	for <linux-mtd@lists.infradead.org>; Mon, 22 Jan 2007 21:59:53 -0500
Subject: Re: [PATCH][UBI] remove __exit on functions referenced in '.text'
	or '.init.text'
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Benedikt Spranger <b.spranger@linutronix.de>
In-Reply-To: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
References: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
Content-Type: text/plain
Date: Mon, 22 Jan 2007 21:00:38 -0600
Message-Id: <1169521238.6706.20.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
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

On Mon, 2007-01-22 at 23:09 +0100, Benedikt Spranger wrote:
> Hello,
> 
> linking the current ubi-2.6 git tree results in tons of "`.exit.text'
> referenced in section `.text'" or ".init.text". Solution is simple:
> remove all __exit in referenced function.

Could you post the error messages, config file, and gcc version you
used?  I tried compiling this evening and had no errors compiling both
in-kernel and as a module.

josh
