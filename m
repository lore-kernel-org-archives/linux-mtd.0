Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnu4Q-0007Yx-Vb
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:34:03 +0000
Received: by wyf22 with SMTP id 22so2415476wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:34:01 -0800 (PST)
Subject: Re: mount ubi volume fails: No such device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lh_post@yahoo.com>
In-Reply-To: <771706.3446.qm@web30204.mail.mud.yahoo.com>
References: <771706.3446.qm@web30204.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 16:32:51 +0200
Message-ID: <1297434771.2760.33.camel@localhost>
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

On Wed, 2011-02-09 at 04:34 -0800, Lars Michael wrote:
> I formatted and wrote the image again. ubiattach _sometimes_ completes
> without the error code -22. In this case the mount went ok. But mount
> sometimes fails completely (structure needs cleaning), other times
> errors are reported but successfully recovered. So it seems to work,
> but no in
> a reliable way. Any suggestions on how to improve it? My kernel is
> 2.6.29 so perhaps some patches are needed?

You really need to make the subpage test work. You can ask UBI to not
use sub-pages using the 'vid_hdr_offs' parameter of the 'ubi.ko' module.
I cannot tell you the exact value because you did not provide enough
information about your flash. Ideally, reporters should read these
instructions:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
http://www.linux-mtd.infradead.org/doc/ubi.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
