Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta01.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177yk8-0001vB-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 14:23:00 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Wed, 15 May 2002 06:22:53 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: ales.makarov@wolfhill.cz
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: MTD+JFFS2 on DragonBall VZ
Reply-To: zeusj@firstlinux.net
Message-Id: <20020515132253.B581E36F9@sitemail.everyone.net>
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
>Hi,
>>Till now I needed MTD with only one chip. But I want use MTD also on the
>second chip (with partitioning). Do I have to write my own mapper for
>our board?

You have to write your own mtd_partition structure

_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
