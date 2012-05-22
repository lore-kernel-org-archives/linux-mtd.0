Received: from mail.thb.de ([62.225.75.172] helo=mail.bury.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWimX-0005QD-Qe
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 06:41:22 +0000
Received: from [172.20.150.66] (port=40968)
 by mail.bury.com with esmtp (Exim 4.76)
 (envelope-from <homann@bury.com>) id 1SWimM-0003yn-1Y
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 08:41:10 +0200
Message-ID: <4FBB3506.3020904@bury.com>
Date: Tue, 22 May 2012 08:41:10 +0200
From: Robert Homann <homann@bury.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Resizing of an existing UBIFS
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a short question: Is it possible to expand the size of a UBIFS
without creating a new image file or reformatting from scratch?

Suppose you have a UBIFS whose --max-leb-cnt has been set so to limit
its size to 100 MiB. Now suppose this UBIFS lives in a dynamic UBI
volume which gets expanded to a size of the whole partition, say,
150 MiB. Being limited by the --max-leb-cnt parameter, the contained
UBIFS is expanded to only 100 MiB, and the rest of the space in the
volume is wasted. Is it possible to resize the UBIFS so that it can make
use of the now wasted space?

Best regards,
Robert Homann
