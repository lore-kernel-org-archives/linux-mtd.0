Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuPSn-000832-R9
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 13:50:22 +0000
Received: by iyf13 with SMTP id 13so5753296iyf.16
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 06:50:20 -0700 (PDT)
Subject: mtd-utils-1.4.6 is out
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>, linux-mtd
	<linux-mtd@lists.infradead.org>
Date: Fri, 19 Aug 2011 16:52:06 +0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313761930.6607.64.camel@sauron>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've just tagged and released mtd-utils-1.4.6 - it is identical to
mtd-utils-1.4.5 except of 1 single patch from Brian Norris which fixes
the mtdinfo utility:

http://git.infradead.org/mtd-utils.git/commit/baafd8ace3301e9d2ba314a376bad008314b34ff

IOW, this is just a bug-fix release.

Thanks to Brians and Mike for reporting/fixing/reviewing the fix.

The tarball should be available at the usual place.

-- 
Best Regards,
Artem Bityutskiy
