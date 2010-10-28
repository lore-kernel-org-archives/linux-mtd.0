Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PBTve-0001w1-M5
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2010 14:58:11 +0000
Received: by fxm11 with SMTP id 11so1055606fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Oct 2010 07:58:09 -0700 (PDT)
Subject: Re: Preventing FS full
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <1288277530.2083.56.camel@localhost>
References: <OF2C2A2D93.9DE54A3F-ONC12577CA.004EC5B1-C12577CA.004F2498@transmode.se>
	<1288277530.2083.56.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Oct 2010 17:54:55 +0300
Message-ID: <1288277695.2083.58.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-28 at 17:52 +0300, Artem Bityutskiy wrote:
> On Thu, 2010-10-28 at 16:24 +0200, Joakim Tjernlund wrote:
> > Is there any way to temporarily lower the FS full limit(preferably on a process basis)
> > on JFFS2?
> > 
> > I want to safeguard the OS from FS full due to some process filling up the disk.
> 
> Mainstream FSes like ext3 can limit this on per-user or per-group basis,
> and we had a similar thing for JFFS2, do not remember if we upstreamed
> this, though. But I did send patches to the mtd ML.

Hmm, no, probably my memory is bad, but it seems ext3 only has the
reserve for root, see mkfs.ext3 -m option.

In UBIFS you can specify user ID or group ID of the owner of the
reserve. And we had done the same for JFFS2 long time ago.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
