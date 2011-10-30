Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKUrW-0002yd-HS
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 12:51:43 +0000
Received: by bkat2 with SMTP id t2so141304bka.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 05:51:40 -0700 (PDT)
Subject: Re: Security enhancement for UBIFS with secure erase feature
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <reardonj@inf.ethz.ch>
Date: Sun, 30 Oct 2011 14:51:36 +0200
In-Reply-To: <loom.20111027T111843-772@post.gmane.org>
References: <02855DE82B1CA94A9115CCD637A1325643CD9EC4A3@goemail-server.goerlitz.int>
	<1315747360.18731.57.camel@sauron>
	<loom.20111027T111843-772@post.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319979098.2126.45.camel@koala>
Mime-Version: 1.0
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

Hi Joel,

On Thu, 2011-10-27 at 09:33 +0000, Joel Reardon wrote:
> So coincidentally I've been working on a secure deletion patch for UBIFS. (I'm a
> grad student researching secure deletion here in Zurich.) I'm mostly finished
> implementing it and the results are really good. It works by encrypting each
> data node individually with a different key, storing the keys in a (logically)
> fixed area, and then periodically atomically updating the key blocks to purge
> the old
> unwanted keys.

Sounds like a clever solution! It is curious to see how you made sure
that all this is power-cut safe.

> I have a couple questions to ask the main developer, mostly about orphans for
> which I found the documentation not quite clear. I'm quite keen to get
> this integrated into UBIFS, however this will be the first time I've
> contributed to the kernel so in this regard I'm unsure of the best practices
> and so forth.

Well, ask questions, send patches. This sounds very interesting.
However, I do not know if anyone will use this, hopefully yes!

Artem.
