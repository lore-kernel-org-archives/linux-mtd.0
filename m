Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181LDh-0006d8-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 07:30:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000e01c27400$f0766c30$80d1a8c0@synso.com.tw> 
References: <000e01c27400$f0766c30$80d1a8c0@synso.com.tw> 
To: "Steve Tsai" <startec@ms11.hinet.net>
Cc: "'Russ Dill'" <Russ.Dill@asu.edu>,
    "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: Memory usage? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Oct 2002 07:28:03 +0100
Message-ID: <32372.1034663283@passion.cambridge.redhat.com>
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

startec@ms11.hinet.net said:
> It does not include cache and buffer. I know the most memory becomes
> the cache, but I am using uClinux and the lower MemFree will cause
> system crash when I am loading program. I need to prevent the case. 

grep jffs2 /proc/slabinfo

--
dwmw2
