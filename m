Received: from [2002:d556:63ea::1] (helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rdqL-0008N9-FZ
	for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2003 14:26:41 +0100
Received: from [213.86.99.237] (helo=executor.cambridge.redhat.com)
	by phoenix.infradead.org with esmtp (Exim 4.22)
	id 19rdpy-0006nC-JN
	for linux-mtd@lists.infradead.org; Tue, 26 Aug 2003 14:26:18 +0100
From: David Woodhouse <dwmw2@redhat.com>
To: Gleb Natapov <gleb@nbase.co.il>
In-Reply-To: <20030826131657.GD26520@nbase.co.il>
References: <20030826130146.GC26520@nbase.co.il>
	 <1061903112.8465.24.camel@hades.cambridge.redhat.com>
	 <20030826131657.GD26520@nbase.co.il>
Message-Id: <1061904372.8465.43.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 26 Aug 2003 14:26:12 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Support for multiple physical mappings for MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-08-26 at 16:16 +0300, Gleb Natapov wrote:
> My own map driver will mostly be the cut and paste copy of physmap driver.
> But if this is by design I can live with it.

It is indeed by design -- but there's a lot less duplication in the
newer versions.

-- 
dwmw2
