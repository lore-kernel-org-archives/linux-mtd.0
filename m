Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta01.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178W6B-0004V7-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 01:59:59 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Thu, 16 May 2002 17:59:57 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: ales.makarov@wolfhill.cz,
	all in MTD mailinglist <linux-mtd@lists.infradead.org>
Cc: "Ales  Makarov" <ales.makarov@wolfhill.cz>
Subject: Re: MTD+JFFS2 on DragonBall VZ
Reply-To: zeusj@firstlinux.net
Message-Id: <20020517005957.F227B2756@sitemail.everyone.net>
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


--- Ales Makarov <ales.makarov@wolfhill.cz> wrote:
>I've written my mtd_partition structure.
>
>Should I add the mtd_device first and then mtd_partitions? (I don't need
>the whole device access)
>
>  flash0_mtd->module = THIS_MODULE;
>  add_mtd_device(flash0_mtd);
>  add_mtd_partitions(flash0_mtd, flash0_parts, FLASH0_PARTS);
>

NO ,I believe you need to add the mtd_partitions only.



Jim Zeus

_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
