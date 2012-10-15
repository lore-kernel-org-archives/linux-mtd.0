Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNksH-0006GJ-1R
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 13:38:29 +0000
In-Reply-To: <1350307723.5769.1.camel@sauron.fi.intel.com>
References: <1349429064-10241-1-git-send-email-Joakim.Tjernlund@transmode.se>	
 <OF69AFCA95.D74167D3-ONC1257A8E.003A3DD7-C1257A91.002E54A0@rohde-schwarz.com>
 <OFDA2AD2F6.2BD9C5E0-ONC1257A91.003021EB-C1257A91.003058E4@transmode.se>
 <1350307723.5769.1.camel@sauron.fi.intel.com>
To: dedekind1@gmail.com
MIME-Version: 1.0
Subject: Re: [PATCH] jffs2: Fix lock acquisition order bug in jffs2_write_begin
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OFB4C05C90.BA76062E-ONC1257A98.004AC00B-C1257A98.004AECCB@transmode.se>
Date: Mon, 15 Oct 2012 15:38:23 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Thomas.Betker@rohde-schwarz.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2012/10/15 15:28:43:
> 
> On Mon, 2012-10-08 at 10:48 +0200, Joakim Tjernlund wrote:
> > > And "be be" in the first comment should probably read "be done".
> > 
> > Agreed on all above points, thanks.
> 
> So would someone send the final patch with the commit message,
> Signed-off-by, etc? Should there be Cc: stable@vger.kernel.org?

Thomas already did, he fixed it up and sent it to the ML. I acked it.

 Jocke
