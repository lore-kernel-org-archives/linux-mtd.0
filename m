Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1667wi-0001Zg-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2001 10:16:04 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001b01c17166$6af4de40$0100a8c0@secret.org.uk> 
References: <001b01c17166$6af4de40$0100a8c0@secret.org.uk>  <1006107094.1391.46.camel@gromit.house> <2915.1006111512@redhat.com> 
To: "Si" <spse@secret.org.uk>
Cc: "Michael Rothwell" <rothwell@holly-springs.nc.us>,
    linux-mtd@lists.infradead.org
Subject: Re: second "mount" hangs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 20 Nov 2001 10:26:01 +0000
Message-ID: <22772.1006251961@redhat.com>
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


spse@secret.org.uk said:
>  This is reproducible on both blkmtd and mtdram (and probably others)
> - this is from stock 2.4.14

You're right - sorry for the misplaced blame. Fixed in v1.50 of mtdblock.c.

--
dwmw2
