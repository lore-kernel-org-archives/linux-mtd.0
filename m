Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKUib-0002s5-4L
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 12:42:29 +0000
Received: by bkat2 with SMTP id t2so137064bka.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 05:42:27 -0700 (PDT)
Subject: Re: [PATCH 1/3] Add the snappy-c compressor to lib
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Date: Sun, 30 Oct 2011 14:42:23 +0200
In-Reply-To: <1319978255.2126.33.camel@koala>
References: <1319978255.2126.33.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1319978545.2126.37.camel@koala>
Mime-Version: 1.0
Cc: Andi Kleen <ak@linux.intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-10-30 at 14:37 +0200, Artem Bityutskiy wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> This is a C port of the google snappy compressor. It has roughly
> comparable compression to LZO, but is significantly faster on many file
> types. For example it beats all other compressors on already
> compressed data.

Sounds cool, thanks Andi! Is any UBIFS user interested to try this out?
I think this stuff needs some real users to make it go into mainline
smoothly.

Artem.
