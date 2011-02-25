Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsvDj-0002rq-RR
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 10:48:24 +0000
Received: by wyf23 with SMTP id 23so1518959wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 02:48:22 -0800 (PST)
Subject: Re: [PATCH] jffs2reader fix
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Benedikt Heinz <zn000h@gmail.com>
In-Reply-To: <AANLkTinNObFTNzS6PPuiZc+cS_Hh-WKY6+=Nxama7=yc@mail.gmail.com>
References: <AANLkTinNObFTNzS6PPuiZc+cS_Hh-WKY6+=Nxama7=yc@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 12:47:00 +0200
Message-ID: <1298630820.2798.47.camel@localhost>
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

On Fri, 2011-02-18 at 14:29 +0100, Benedikt Heinz wrote:
> Hi!
> 
> I changed the jffs2reader.c so it'll compile again.
> Seems to work - I successfully tested it on a few jffs2 images.
> 
> Attached you'll find the patch and the full file.
> 
> Reply directly to me as I'm not on the list.

Would you please split your patch on several smaller patches, add proper
comment and send them as a nice series of patches?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
