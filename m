Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Wdf9-00075a-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 13:23:31 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1012561603.21481.4.camel@pcjonashg> 
References: <1012561603.21481.4.camel@pcjonashg> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: chip drivers 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Feb 2002 13:34:30 +0000
Message-ID: <29597.1012570470@redhat.com>
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

jonas.holmberg@axis.com said:
> I need to use different flash chips (AMD compatible, mixed CFI and
> non-CFI, mixed geometry etc) at the same time :). I think I will need
> to change the cfi drivers and the cfi- and jedec-probe to accomplish
> this.  

Why do you think this? They should be fine. Just set up as many map 
structures as you require and call the appropriate probe functions.

--
dwmw2
