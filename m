Received: from web56701.mail.re3.yahoo.com ([66.196.97.60])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GtqND-0003Si-UX
	for linux-mtd@lists.infradead.org; Mon, 11 Dec 2006 13:59:40 -0500
Date: Mon, 11 Dec 2006 10:52:32 -0800 (PST)
From: Jianlin Zeng <jianlinz_2000@yahoo.com>
Subject: Re: reboot problem with jffs2
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1165751682.5253.488.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <753100.94917.qm@web56701.mail.re3.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dave,

Thanks for your information! It appears that I need to
set all flash sectors to read mode before reboot,
otherwise the CPU won't be able to read any boot code
from the flash after reboot. Don't know the reason
behind it but once I did that the reboot works fine.

Regards,
Jianlin


--- David Woodhouse <dwmw2@infradead.org> wrote:

> On Fri, 2006-12-08 at 16:24 -0800, Jianlin Zeng
> wrote:
> > I have a MPC8248 based board running linux 2.6.11.
> I
> > mounted jffs2 FS on a NOR flash partition. The
> jffs2
> > FS works fine. But if I modify any files in the
> jffs2
> > FS and then soft reboot the board, the reboot
> hangs.
> > If I don't modify any files in jffs2 FS and just
> do
> > flashcp to a MTD char device, the soft reboot
> works
> > fine. 
> 
> Check you hardware. I suspect the flash chip isn't
> being properly reset
> when the CPU restarts.
> 
> -- 
> dwmw2
> 
> 



 
____________________________________________________________________________________
Need a quick answer? Get one in minutes from people who know.
Ask your question on www.Answers.yahoo.com
