Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c1HB-0005sV-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 11:09:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200208050819.40628.rjb@ayrnetworks.com> 
References: <200208050819.40628.rjb@ayrnetworks.com> 
To: "Richard J. Broberg" <rjb@ayrnetworks.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Is there any interest in providing a query lock to go with lock and unlock? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Aug 2002 11:09:09 +0100
Message-ID: <14180.1028628549@redhat.com>
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

rjb@ayrnetworks.com said:
> We have a parochial need which I have met in a heavy handed way by
> adding a mtd vector and an ioctl.

That makes sense. Change the name to something like test_lock() or 
is_locked(), and perhaps declare that it shall only take an 'offset' 
argument which must be the start of a block, rather than doing all the 
range stuff -- the users can do that themselves if they need it, can't they?

--
dwmw2
