Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181hwT-0000Os-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 07:46:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F83tYwlib4g3Sv0YKpD000000ec@hotmail.com> 
References: <F83tYwlib4g3Sv0YKpD000000ec@hotmail.com> 
To: "vijay vijay" <vijay_peshkar@hotmail.com>
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: mtd and cramfs on PC target?. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 16 Oct 2002 07:45:52 +0100
Message-ID: <13861.1034750752@passion.cambridge.redhat.com>
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

vijay_peshkar@hotmail.com said:
> Getting hold of a real board is diffcult and hence want to try out on
> a PC  target. Is it possible?. How to tell cramfs and mtd to use PC
> resources instead of  flash?. 

Use the 'mtdram' device.

--
dwmw2
