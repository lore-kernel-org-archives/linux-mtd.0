Received: from mailout02.ims-firmen.de ([213.174.32.97])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0LXz-00068D-Mv
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 10:48:18 -0400
From: "Jochen Karrer" <j.karrer@lightmaze.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Thu, 26 Aug 2004 16:48:12 +0200
Message-ID: <MKELJOLMMOHJCMIPKLJKOEMOCAAA.j.karrer@lightmaze.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1093529549.3777.1767.camel@imladris.demon.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-08-26 at 15:11 +0200, Jochen Karrer wrote:

Hi,
> > jffs2 did not work in linux-2.6.8.1 because single word writes at the
end
> > of a buffer write are done with the wrong address:

> Thanks. If this is needed though -- don't we _also_ need the same fix a
> few lines up?

Its not required because for the first write "ofs + chipnum <<
cfi->chipshift"
should be the same like "to". "ofs" is not yet incremented. But may its
better
style.

Jochen
