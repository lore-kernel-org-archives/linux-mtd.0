Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNQ8F-0007hh-DV
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 13:52:48 +0000
Received: by ewy3 with SMTP id 3so1404933ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 06:52:45 -0700 (PDT)
Subject: Re: power cut resiliency - ubifs vs. jffs2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1105201357010.15966@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1105201357010.15966@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 16:48:54 +0300
Message-ID: <1305899334.2630.146.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-20 at 13:59 +0200, Ricard Wanderlof wrote:
> I'm trying to get some grip on how jffs2 fares in comparison with ubifs 
> when it comes to managing unexpected power cuts when the system is 
> operating. What I've found in the UBIFS FAQ is encouraging, but I was 
> wondering if anyone has any practical experience comparing the two in a 
> real system?

UBIFS is very stable WRT to power cuts. But the unstable bits problem is
still not solved.

Cannot say anything about JFFS2 - it has not been maintained very well
lately, but I believe the unstable bits problem is there as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
