Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TNksj-0006RR-I5
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 13:38:58 +0000
In-Reply-To: <1350307723.5769.1.camel@sauron.fi.intel.com>
References: <1349429064-10241-1-git-send-email-Joakim.Tjernlund@transmode.se>	
 <OF69AFCA95.D74167D3-ONC1257A8E.003A3DD7-C1257A91.002E54A0@rohde-schwarz.com>
 <OFDA2AD2F6.2BD9C5E0-ONC1257A91.003021EB-C1257A91.003058E4@transmode.se>
 <1350307723.5769.1.camel@sauron.fi.intel.com>
To: dedekind1@gmail.com
MIME-Version: 1.0
Subject: Re: [PATCH] jffs2: Fix lock acquisition order bug in jffs2_write_begin
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF84E7FB15.5972B59F-ONC1257A98.004A2925-C1257A98.004AF802@rohde-schwarz.com>
Date: Mon, 15 Oct 2012 15:38:50 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem:

> So would someone send the final patch with the commit message,
> Signed-off-by, etc? Should there be Cc: stable@vger.kernel.org?

I sent a "PATCH RESEND" message to the list, with the same topic; please 
use that one (sorry if I caused a confusion).

Cc: stable@vger.kernel.org makes sense -- can you add it? Does stable 
cover 3.4 as well?

Best regards,
Thomas
