Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wjl8-0005bP-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2001 13:37:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <5.1.0.14.2.20011025083606.00a8d7b0@mail.psu.edu> 
References: <5.1.0.14.2.20011025083606.00a8d7b0@mail.psu.edu> 
To: Bill Seisler <wrs122@psu.edu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Boot DOC2000 readonly... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Oct 2001 13:46:04 +0100
Message-ID: <30742.1004013964@redhat.com>
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

Take a look at what the iPAQ does. Basically a linuxrc which mounts a ramfs 
filesystem then lets the normal init run.

--
dwmw2
