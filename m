Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16TmZ5-0001pD-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 16:17:27 +0000
Received: from hhlstryder ([10.70.0.100])
	by hermes.mvista.com (8.11.0/8.11.0) with SMTP id g0OGQvB26279
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 08:26:57 -0800
Reply-To: <sikenaga@mvista.com>
From: "Scott Ikenaga" <sikenaga@mvista.com>
To: <linux-mtd@lists.infradead.org>
Subject: Space Loss in JFFS on an EST-SBC8260
Date: Thu, 24 Jan 2002 10:28:30 -0600
Message-ID: <FFEBJPOLADLDEDEKEOGFKEJCCIAA.sikenaga@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

We are using JFFS on EST-SBC8260. The problem we are facing now is that
the space can't be reclaimed after files being deleted. So we are
running out of space as shown by "du".

Questions:
(1)Is this a known problem? If so, is there a fix?
(2)Could this contribute to another problem where the system becomes
   very sluggish?
