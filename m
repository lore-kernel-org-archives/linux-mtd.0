Received: from pd9503046.dip.t-dialin.net ([217.80.48.70] helo=splash)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15EoNf-000663-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 09:39:32 +0100
Date: Tue, 26 Jun 2001 10:46:15 +0200
From: Jochen Schaeuble <psionic@psionic.de>
To: linux-mtd@lists.infradead.org
Subject: mtd-utilities automake/autoconf
Message-ID: <20010626104615.A10582@psionic.de>
Reply-To: psionic@psionic.de
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Today I checked in automake/autoconf files to ease the make-process of the
utilities (no more symbolic linking or copying required). I also added a short
description to the README file. As soon I'm ready I will also check in a rpm
spec file.

If there are any problems with these files please send me an email. I also
plan to add a configure-switch "--wich-endianess" to select the default
endianess used by mkfs.jffs,...

jochen
