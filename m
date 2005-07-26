Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxOd2-0006Es-S9
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 08:33:56 -0400
Message-ID: <42E62E9E.8020207@inf.u-szeged.hu>
Date: Tue, 26 Jul 2005 14:37:50 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>	<20050722115939.GA941@wohnheim.fh-wedel.de>	<42E0E2C8.7090304@yandex.ru>	<42E5E816.5090500@inf.u-szeged.hu>	<20050726074440.GB15903@wohnheim.fh-wedel.de>	<42E5ECE5.4010901@inf.u-szeged.hu>	<42E5F474.7020003@imc-berlin.de>	<20050726093624.GE15903@wohnheim.fh-wedel.de>	<42E60A81.7070508@inf.u-szeged.hu>
	<42E6159D.10302@imc-berlin.de>
In-Reply-To: <42E6159D.10302@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Steven!

> But then: what is the status of CS? For NOR?

Now it seems to be stable enough (at least the version which uses the
first erase block seems to store reference pointer) thanks to an active
user (realmsys). It is even more faster than EBS, but now it is still
working with NAND. And I think there are also things that should make
nicer in our code similar to EBS.

Bye,
Ferenc
