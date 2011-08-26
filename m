From: Tanmay Upadhyay <tanmay.upadhyay@einfochips.com>
To: dwmw2@infradead.org
Subject: mtd: Replace DEBUG with MTD_DBG
Date: Fri, 26 Aug 2011 10:46:14 +0530
Message-Id: <1314335775-3384-1-git-send-email-tanmay.upadhyay@einfochips.com>
In-Reply-To: <CAMPhdO_qVn8JaX6orfnHHXjmi8pTQFb1SzMe2RQM9xMdTvimaQ@mail.gmail.com>
References: <CAMPhdO_qVn8JaX6orfnHHXjmi8pTQFb1SzMe2RQM9xMdTvimaQ@mail.gmail.com>
Cc: eric.y.miao@gmail.com, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, jason.chagas@marvell.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I came across this when I got compilation errors in USB host driver. I found
the errors were because of 'DEBUG' macro in 'mtd.h'. 'mtd.h' was included in
SoC specific common header. Unlike MTD, USB subsystem expects DEBUG to be a
boolean - be defined or undefined - to on/off DEBUG code. I guess this is
common practice in other subsystems as well.

To solve this I thought to replace DEBUG to with MTD_DBG. I am not sure if
this is a proper way to do this or not. I am more than willing to change
if this can be achieved in a better way.

Thanks,
Tanmay

PS: This patch involves changes in some 'quite old' files, which has code
indented with spaces instead of tab. So, checkpatch.pl throws white space
errors for a few files.
