Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PBTt1-0001Vx-0J
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2010 14:55:27 +0000
Received: by ewy19 with SMTP id 19so1130210ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Oct 2010 07:55:25 -0700 (PDT)
Subject: Re: Preventing FS full
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF2C2A2D93.9DE54A3F-ONC12577CA.004EC5B1-C12577CA.004F2498@transmode.se>
References: <OF2C2A2D93.9DE54A3F-ONC12577CA.004EC5B1-C12577CA.004F2498@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Oct 2010 17:52:10 +0300
Message-ID: <1288277530.2083.56.camel@localhost>
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

On Thu, 2010-10-28 at 16:24 +0200, Joakim Tjernlund wrote:
> Is there any way to temporarily lower the FS full limit(preferably on a process basis)
> on JFFS2?
> 
> I want to safeguard the OS from FS full due to some process filling up the disk.

Mainstream FSes like ext3 can limit this on per-user or per-group basis,
and we had a similar thing for JFFS2, do not remember if we upstreamed
this, though. But I did send patches to the mtd ML.

FS has not idea about processes - the information about them is not
stored on the media, and it is very dynamic and unpredictable. I think
it is disaster to try to limit anything in the FS on per-process basis,
just makes little sense for me.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
