Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lAZw-0000dv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 15:22:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000f01c1caa0$8cdd3550$0101a8c0@dellc800> 
References: <000f01c1caa0$8cdd3550$0101a8c0@dellc800>  <002201c1ca2b$00ca7fc0$0101a8c0@dellc800> <AEA9DCA73595D411A6D4009027DE9C5E019BFA74@MSI-EX6> <4513.1015976946@redhat.com> <6602.1015982029@redhat.com> 
To: "Mark Meade" <mark@lakeshoremicro.com>
Cc: "Vadim Khmelnitsky" <VadimK@m-sys.com>,
    linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Mar 2002 15:33:37 +0000
Message-ID: <20430.1016033617@redhat.com>
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

mark@lakeshoremicro.com said:
> <0>Kernel panic: unknown: request list destroyed 

Weird. Can you revert to the older version, just remove the check for 
UnitSizeFactor and see if it exhibits the same behaviour? Maybe I broke 
something else in the process?

--
dwmw2
