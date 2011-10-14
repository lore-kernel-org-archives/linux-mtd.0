Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REdrn-0001db-RM
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 09:15:48 +0000
Received: by wwg9 with SMTP id 9so569518wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 02:15:46 -0700 (PDT)
Subject: Re: erase block < 8KiB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: angelo <angelo70@gmail.com>
Date: Fri, 14 Oct 2011 12:15:15 +0300
In-Reply-To: <4E97F7C2.1050803@gmail.com>
References: <4E8977DF.1030808@gmail.com> <1318581933.12351.70.camel@sauron>
	<4E97F7C2.1050803@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318583721.12351.80.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-10-14 at 10:50 +0200, angelo wrote:
> I already done this, and posted the patch for 64 KB sector.
> 
> But i none here still answered to the question :
> why the cfi_cmdset_0002 selects for this flash the 4KB sector instead of 
> the 64KB  ? In this way, the non-working of jffs2 is guaranteed, since 
> the minimal block size is 4K + some bytes.

I do not know CFI, sorry, but you probably should do this on a higher
level than CFI, something between JFFS2 and MTD.

-- 
Best Regards,
Artem Bityutskiy
