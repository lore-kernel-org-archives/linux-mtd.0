Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15joi8-0003TI-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2001 22:16:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002a01c14150$66554d20$26e8b2c6@hawk> 
References: <002a01c14150$66554d20$26e8b2c6@hawk> 
To: "Mike Hill" <mhill@bustech.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: RO permission on odd numbered MTD devices? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 19 Sep 2001 22:22:56 +0100
Message-ID: <7492.1000934576@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

mhill@bustech.com said:
> Can anyone tell me why the odd numbered MTD character devices are
> ReadOnly?

> I see the code in MTDCHAR.C, but I have no idea what it was setup this
> way. 

grep --context=3 mtdr0 /usr/src/linux/Documentation/devices.txt

--
dwmw2
