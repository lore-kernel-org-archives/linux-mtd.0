Received: from opersys.com ([64.40.108.71] helo=www.opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJisW-0000bi-EY
	for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2003 00:29:00 +0000
Message-ID: <3FB17F30.7090006@opersys.com>
Date: Tue, 11 Nov 2003 19:30:40 -0500
From: Karim Yaghmour <karim@opersys.com>
MIME-Version: 1.0
To: Linux-MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Problems with NFTL in 2.4.22
Reply-To: karim@opersys.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I haven't seen anything in the archives about this, so here goes:

I've had quite a few problems trying to interface with an 8MB DOC with
2.4.22. The system would simply freeze when I tried doing things like
mount, unmount, mke2fs, cat fs image to device, etc. No oops no nothing,
just the tools would not return to the command line and I'd have to
hard-reset the system. I tried a few variations in the commands to try
to get the same results, but nothing really got it working. I eventually
gave up and tried 2.4.21 instead, and then everything I was trying to
do before just worked fine ...

I cannot say exactly what's the problem, and I don't have the time
to track it down, but I can say that 2.4.22 has a problem with handling
at least the 8MB DOC.

HTH,

Karim
-- 
Author, Speaker, Developer, Consultant
Pushing Embedded and Real-Time Linux Systems Beyond the Limits
http://www.opersys.com || karim@opersys.com || 514-812-4145
