Received: from smtp6.mindspring.com ([207.69.200.110])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ko4b-0002eN-JX
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 17:57:09 +0100
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Thu, 7 Aug 2003 12:56:56 -0400
Message-ID: <IIEEICKJLNEPBBDJICNGOEHCDMAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
In-Reply-To: <1060273956.25209.267.camel@passion.cambridge.redhat.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DOC filesystem questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

> We _must_ retain the bad block table which was on the device when it
> arrived from the factory. 

OK I see.  Would it be valuable then to have a Linux command-line
utility which captures the BBT before calling nftl_format, then 
is used to restore the BBT after calling nftl_format but before
nftl tries to mount any partitions (via 'insmod nftl' or whatever)?

Since nftl_format can be called with an offset, I believe the utility
would not necessarily put the BBT back at the exact device offset
from which it was read.  For instance, when reading the initial BBT
we might find the media headers in the first 2 blocks on the device,
and read/save the BBT from there.  However, if nftl_format is called
with an offset, we would need to write the saved BBT back to the
device at the blocks with media headers written beyond that offset
by nftl_format.

Does such a utility for the Linux command line sound like it would
preserve the BBT correctly?

Thanks,
Chuck
