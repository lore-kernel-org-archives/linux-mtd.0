Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0mH-00027S-GR
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 16:04:02 +0000
Received: by bwz5 with SMTP id 5so2044417bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 08:04:00 -0800 (PST)
Subject: Re: change in how ubiformat works
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTi=rE+u0OiGXj=HxGYRB9F4p228GpHzGadJm+982@mail.gmail.com>
References: <AANLkTi=rE+u0OiGXj=HxGYRB9F4p228GpHzGadJm+982@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 18:03:28 +0200
Message-ID: <1290787408.2552.28.camel@localhost>
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

On Fri, 2010-11-12 at 13:47 -0500, twebb wrote:
> I use a sequence as follows: " flash_erase - ubiformat - nanddump -
> verify " to confirm that a UBI image was properly stored in NAND
> flash.  I realize that flash_erase is not recommended because it
> destroys erase counters, but this is only done on virgin flash so
> should not be an issue.
> 
> However, I recently upgraded the mtd-utils, and particularly ubiformat
> from 1.4 to 1.5, and now I see that what I read back (via nanddump)
> does not match the original UBI image.  Can anyone confirm whether
> ubiformat.c changes sometime between 1.4 and 1.5 would result in this
> behavior?  I have looked at ubiformat.c changes and am wondering if it
> has to do with image sequence number support.


Ok, just define your own sequence number. Use, say, --image-seq=100 both
with ubinize and ubiformat.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
