Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL90c-0007OA-Ij
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 08:48:19 +0000
In-Reply-To: <OF69AFCA95.D74167D3-ONC1257A8E.003A3DD7-C1257A91.002E54A0@rohde-schwarz.com>
References: <1349429064-10241-1-git-send-email-Joakim.Tjernlund@transmode.se>
 <OF69AFCA95.D74167D3-ONC1257A8E.003A3DD7-C1257A91.002E54A0@rohde-schwarz.com>
Subject: Re: [PATCH] jffs2: Fix lock acquisition order bug in jffs2_write_begin
To: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFDA2AD2F6.2BD9C5E0-ONC1257A91.003021EB-C1257A91.003058E4@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 8 Oct 2012 10:48:04 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Hello Joakim,
>
> I am not sure if it is okay to call jffs2_complete_reservation() without a
> previous jffs2_reserve_space(), so I have avoided that in my own patch.
>
> Also, I am not happy with using ret to check if
> jffs2_complete_reservation() was done; I am using alloc_len for that.
>
> "jffs2_dbg(1, "%s()\n", __func__);" comes a bit late.
>
> And "be be" in the first comment should probably read "be done".

Agreed on all above points, thanks.

>
> I am attaching my own patch for comparison (sorry, I haven't found yet a
> way to send the patch inline); the tests are running this morning.

Right, I don't send inline paches with Notes, I use git send-email

 Jocke
