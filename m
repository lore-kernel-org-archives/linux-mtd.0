Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mXps-0000YR-00
	for <linux-mtd@lists.infradead.org>; Sun, 17 Mar 2002 10:24:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020315200923.J6821@ayrnetworks.com> 
References: <20020315200923.J6821@ayrnetworks.com> 
To: William Jhun <wjhun@ayrnetworks.com>
Cc: linux-mtd@lists.infradead.org,
    Kasparek Tomas <xkaspa06@stud.fee.vutbr.cz>
Subject: Re: "Kernel panic: mtdblock: request list destroyed" with recent changes 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 17 Mar 2002 10:35:37 +0000
Message-ID: <29539.1016361337@redhat.com>
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

> Kernel panic: mtdblock: request list destroyed

Russell pointed out to me that this was because of the bogus definition of 
QUEUE_EMPTY in compatmac.h. I've reverted that. 

/me stares hard at Kasparek... :)

--
dwmw2
