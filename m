Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8xKD-00041t-R7
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 13:03:46 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m5ID3bQd029413
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 09:03:37 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id
	m5ID3ViG205740
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 09:03:31 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m5ID3VVe008658
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2008 09:03:31 -0400
Date: Wed, 18 Jun 2008 09:01:24 -0400
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Grant Erickson <gerickson@nuovations.com>
Subject: Re: [PATCH] [MTD-UTILS] Makefile: Add Optional ZLIB and LZO CFLAGS
	and LDFLAGS
Message-ID: <20080618090124.327efe45@zod.rchland.ibm.com>
In-Reply-To: <1213371980-23414-1-git-send-email-gerickson@nuovations.com>
References: <1213371980-23414-1-git-send-email-gerickson@nuovations.com>
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

On Fri, 13 Jun 2008 08:46:20 -0700
Grant Erickson <gerickson@nuovations.com> wrote:

> This adds support for allowing the specification of unique CFLAGS and 
> LDFLAGS for both LZO and ZLIB. In addition, it allows for independently 
> specifying both PREFIX and EXEC_PREFIX.
> 
> The former is useful in some cross-compilation environments where the 
> LZO and ZLIB versions being built against are not those installed in the 
> standard locations.
> 
> The latter is useful when installing mtd-utils in a multi-architecture 
> installation area.

I like this, but due to my ineptitude I committed Mike's CFLAGS rework
patch first so this no longer applies.  Could you rework this based on
today's latest Makefile?

josh
