Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTomW-0001yw-AH
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 05:24:48 +0000
Received: by fxm14 with SMTP id 14so4187647fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 22:24:46 -0700 (PDT)
MIME-Version: 1.0
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 7 Jun 2011 01:24:26 -0400
Message-ID: <BANLkTi=EFZfoDAK7g-+8RMck5vneCOoKhA@mail.gmail.com>
Subject: region info exposed via sysfs ?
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i see that while MEMGETINFO and MEMGETREGIONCOUNT are accessible via
sysfs, i cant find the equivalent for MEMGETREGIONINFO.  but i also
dont have any devices here that have numeraseregions > 0 as both my
physmap nor flashes and nand flashes all report numeraseregions == 0.

is it exposed via sysfs and i'm just not seeing it ?  or is this info
only available via the ioctl ?
-mike
