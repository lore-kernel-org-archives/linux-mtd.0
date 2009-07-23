Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MU4bQ-0002vH-Px
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 20:09:24 +0000
Message-ID: <4A68C329.5040808@nokia.com>
Date: Thu, 23 Jul 2009 23:08:09 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "erno@gulp.u--3.com" <erno@gulp.u--3.com>
Subject: Re: UBIFS fails & crashes on SheevaPlug
References: <20090723185928.GA1612@gulp.u--3.com>
In-Reply-To: <20090723185928.GA1612@gulp.u--3.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "debian-arm@lists.debian.org" <debian-arm@lists.debian.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

erno@gulp.u--3.com wrote:
> Hello,
> 
> I installed Debian on my SheevaPlug following instructions at 
> <http://www.cyrius.com/debian/kirkwood/sheevaplug/> and everything 
> seemed to work fine until...
> 
> I wanted to try UBIFS on the built-in flash and followed
> the instructions for formatting the internal flash
> at http://www.plugcomputer.org/plugwiki/index.php/Enabling_UBIFS
> except I made an empty image (no -r parameter for mkfs.ubifs).

Isn't the -r parameter mandatory.  For an empty image, use an empty
directory for the -r parameter.
