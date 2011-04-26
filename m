Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEcul-0007Hc-7I
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:42:31 +0000
Received: by ewy3 with SMTP id 3so116111ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 00:42:28 -0700 (PDT)
Subject: Re: Actual number of writes to a MTD device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kartik Nagar <kartik.n.nagar@gmail.com>
In-Reply-To: <loom.20110423T144945-306@post.gmane.org>
References: <loom.20110423T144945-306@post.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Apr 2011 10:38:54 +0300
Message-ID: <1303803534.2778.23.camel@localhost>
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

On Sat, 2011-04-23 at 12:55 +0000, Kartik Nagar wrote:
> Hi,
> 
> I am using UBIFS on top of UBI on top of a MTD partition and then running some
> workloads on the UBIFS filesystem. I actually want to determine the write
> amplification factor for the workload, for which i need the actual number of
> writes going to the MTD device. Do UBIFS/MTD systems record such statistics, or
> will I have to make changes to the source code to obtain the statistics?

These statistics has to be done on MTD level, not in UBIFS. MTD does not
do this AFAIK.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
