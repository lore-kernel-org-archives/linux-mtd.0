Received: from ns2.arlut.utexas.edu ([146.6.211.1])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aj0e5-0006r6-Az
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 18:30:37 +0000
From: "Matthew S. McClintock" <mattsm@arlut.utexas.edu>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1074622975.7885.15.camel@hades.cambridge.redhat.com>
References: <000d01c3df7f$e8685c60$6e01a8c0@solarwave>
	 <1074622804.4726.0.camel@chuck.arlut.utexas.edu>
	 <1074622975.7885.15.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1074623299.4726.2.camel@chuck.arlut.utexas.edu>
Mime-Version: 1.0
Date: Tue, 20 Jan 2004 12:28:20 -0600
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-20 at 12:22, David Woodhouse wrote:

> Bizarre. It's a define_bool, which is relatively new -- but not so new
> it's not in 2.4.24, I thought. As you're only interested in the
> DiskOnChip drivers, you're right that it doesn't affect you (assuming
> that's what you meant:)

I'm using the linuxppc_2_4_devel tree if that helps any.

-- 
Matthew S. McClintock <mattsm@arlut.utexas.edu>
