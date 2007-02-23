Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HKVQl-00008F-Fd
	for linux-mtd@lists.infradead.org; Fri, 23 Feb 2007 03:05:30 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l1N818OM031109
	for <linux-mtd@lists.infradead.org>; Fri, 23 Feb 2007 10:01:35 +0200
Message-ID: <45DEA001.9060202@nokia.com>
Date: Fri, 23 Feb 2007 10:04:17 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: OneNAND: Rate of write errors
References: <e167438e0702220835gbc5562fl4dc0bc4bd879f649@mail.gmail.com>
In-Reply-To: <e167438e0702220835gbc5562fl4dc0bc4bd879f649@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Julianne C. wrote:
> This does verify the suspicion that the buffer was corrupted before it
> was committed.  Does anyone have any idea how or why the data in the
> bufferram might be corrupted?

This is outside my experience but as far as I know there is little that
OneNAND can control aside from latency and size of synchronous burst
reads/writes.  The rest is controlled by other hardware
e.g. a memory controller of some sort
