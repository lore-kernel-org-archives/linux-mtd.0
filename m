Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nQg7-0007rs-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 22:30:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002501c255eb$35c56680$0200a8c0@telia.com> 
References: <002501c255eb$35c56680$0200a8c0@telia.com>  <3D78F4A1.4060304@redswitch.com> <3D77C812.3080108@redswitch.com> <1031314138.28700.167.camel@spawn> <3D78E270.6020203@redswitch.com> <20020906174829.GA3885@wohnheim.fh-wedel.de> <29521.1031338455@redhat.com> 
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>,
    "Jörn Engel" <joern@wohnheim.fh-wedel.de>,
    "Kenneth Johansson" <kenneth.johansson@etx.ericsson.se>,
    "Mtd" <linux-mtd@lists.infradead.org>
Subject: Re: writing to jffs2 is so slow? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 06 Sep 2002 22:30:05 +0100
Message-ID: <8193.1031347805@redhat.com>
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

Joakim.Tjernlund@lumentis.se said:
>  I think that can be fixed(or at least better). Instead of eraseing
> all blocks first and then write cleanmarker to those blocks, make it
> erase one block and write cleanmarker erase the next block and write
> it's cleanmarker and so on.

> That way you will free up erase blocks as they become ready and you
> don't have to watch the use % in df slowly raise to 100% and the
> suddenly drop to the real usage.

Agreed.

--
dwmw2
