Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cUmB-0002E2-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 18:39:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <957BD1C2BF3CD411B6C500A0C944CA2601499C3E@pdsmsx32.pd.intel.com> 
References: <957BD1C2BF3CD411B6C500A0C944CA2601499C3E@pdsmsx32.pd.intel.com> 
To: "Yuan, Cain" <cain.yuan@intel.com>
Cc: "'Gu Susan-w15879'" <w15879@motorola.com>,
    "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 peoblems with K3 strata flash on Dalhart 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Aug 2002 18:39:11 +0100
Message-ID: <10931.1028741951@redhat.com>
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

cain.yuan@intel.com said:
> No,  but if we don't configure it as" burst" mode,  It will always
> fail with write??? Thanks for your useful  information. 

It shouldn't, no -- and if it did I don't see why the flash driver wouldn't
return an _error_ instead of returning status zero but 'written bytes zero'.

--
dwmw2
