Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh09k-0006gv-31
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 12:34:32 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 427E425989F
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Feb 2010 13:34:26 +0100 (CET)
In-Reply-To: <OF8328EA8B.384612F6-ONC12576C5.0061F0C9-C12576C5.00626376@LocalDomain>
References: <OF8328EA8B.384612F6-ONC12576C5.0061F0C9-C12576C5.00626376@LocalDomain>
Subject: Re: JFFS2 on NAND and when is file on media?
Cc: linux-mtd@lists.infradead.org
Message-ID: <OF4B25913E.44D637F1-ONC12576CB.0044FF12-C12576CB.00450DD1@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 15 Feb 2010 13:34:15 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ping? Pretty please :)

Joakim Tjernlund/Transmode wrote on 2010/02/09 18:54:39:
> I have been using JFFS2 for many years on NOR flash but never on NAND.
> I wonder if NAND has the same guaranties as NOR as to when one
> can expect file contents to be safely on media so one can pull the power
> without loss of data?
> Is the the whole file safe once close(2) returns? If not, what do
> I have to do flush all outstanding data to media?
>
>  Jocke
