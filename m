Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cUl8-0002Dn-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 18:38:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <89DEFCC5DB33D411A27F00508BCF8A8205EE3C7D@ZCH07EXM05.corp.mot.com> 
References: <89DEFCC5DB33D411A27F00508BCF8A8205EE3C7D@ZCH07EXM05.corp.mot.com> 
To: Gu Susan-w15879 <w15879@motorola.com>
Cc: "Yuan, Cain" <cain.yuan@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: JFFS2 peoblems with K3 strata flash on Dalhart 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Aug 2002 18:38:00 +0100
Message-ID: <10839.1028741880@redhat.com>
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

w15879@motorola.com said:
> Does K3 (and Dalhart) be configured as "burst" read mode when system
> is reset?

Linux doesn't currently make use of burst reads from flash. To do so you'd 
need to either operate through the caches or use the 'read buffer' if you 
have an SA1110.

To use caches sanely, the best way is probably to implement the mechanism 
I've been planning for execute-in-place.

--
dwmw2
