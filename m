Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16zzg5-0005F0-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Apr 2002 13:45:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <UTC200204222031.g3MKVZq07564.aeb@smtp.cwi.nl> 
References: <UTC200204222031.g3MKVZq07564.aeb@smtp.cwi.nl> 
To: Andries.Brouwer@cwi.nl
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
    mdharm-usb@one-eyed-alien.net
Subject: Re: Flash device IDs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 Apr 2002 13:45:42 +0100
Message-ID: <25728.1019565942@redhat.com>
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

Andries.Brouwer@cwi.nl said:
>  No, I am afraid this thing doesn't let me talk to raw flash, or if it
> does, I have not yet discovered how. 

Ok... so when you issue write commands, you're pretending it's a normal 
SCSI hard drive and issuing requests with the _logical_ block numbers? You 
don't have to grok the SmartMedia format and issue _physical_ addresses on 
the flash, handle ECC, the block chains, etc.?

--
dwmw2
