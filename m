Received: from ns1.idleaire.net ([65.220.16.2] helo=iasrv1.idleaire.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jmUF-0000Yw-KX
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 22:03:23 +0100
From: Dave Dillow <dave@thedillows.org>
To: Zachi Friedman <zachi.friedman@m-sys.com>
In-Reply-To: <97303ED3C472254E8888E5F74A783471045BD2@msu-ex01.corp.m-sys.com>
References: <97303ED3C472254E8888E5F74A783471045BD2@msu-ex01.corp.m-sys.com>
Message-Id: <1060030962.14549.8.camel@dillow.idleaire.com>
Mime-Version: 1.0
Date: 04 Aug 2003 17:02:42 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: dwmw2@infradead.org
cc: linux-mtd@lists.infradead.org
Subject: RE: Problems with 128MB DoC 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-08-04 at 14:17, Zachi Friedman wrote:
> Dave,
> 
> I have just grabbed one of those MD2202-D128, and ran some tests on it.
> It is built out of 2 flash devices, 64MB each. They seem to be Samsung
> KM29V512000, and their flash chip ID is EC 76.
> 
> It seems you have a problem if you get C6 C6... It is definitely not the
> correct flash ID.

Care to venture a guess as to the problem? It's working just fine under
DOS/Windows on the same hardware...

Is there any chance of my obtaining programming information for this
part? I'd like to help get it working.

Any further tests I should run? So far, I've been trying 2.4.21 + MTD
CVS.

Thanks for any light you can shed.

-- 
Dave Dillow <dave@thedillows.org>
