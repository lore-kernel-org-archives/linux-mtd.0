Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159n6m-0000tz-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 13:17:20 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B25FEB8.A00FCE03@inventel.fr> 
References: <3B25FEB8.A00FCE03@inventel.fr>  <3B24EC1B.7F920021@inventel.fr> <991934470.27485.0.camel@timmy> <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com> <2667.992333648@redhat.com> <3B25DE97.D2041C9@inventel.fr> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: unable to mount jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Jun 2001 13:19:39 +0100
Message-ID: <3161.992348379@redhat.com>
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


xde@inventel.fr said:
> jffs2_scan_empty(): Empty block at 0x0000fffc ends at 0x00010000 (with
> 0xe0021985)! Marking dirty

Those are harmless messages telling you that you passed an incorrect '-e' 
option (or no '-e' option) to mkfs.jffs2.

They have no bearing on the failure to mount. What else happened?

--
dwmw2
