Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15sqOQ-0003yz-00
	for <linux-mtd@lists.infradead.org>; Sun, 14 Oct 2001 19:53:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <7C0E66E1B97BD5119B120002A50A63D22E4195@hasmsx101.iil.intel.com> 
References: <7C0E66E1B97BD5119B120002A50A63D22E4195@hasmsx101.iil.intel.com> 
To: "Kremer, Alex" <alex.kremer@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: linux/completion.h 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 14 Oct 2001 20:02:57 +0100
Message-ID: <17473.1003086177@redhat.com>
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

alex.kremer@intel.com said:
>  What is the right way to do it? 

Don't define it in compatmac.h, and surround the case BLKGETSIZE64 with 
#ifdef BLKGETSIZE64. I was given a patch to do this but haven't yet merged 
it.

--
dwmw2
