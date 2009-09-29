Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Msavk-0008UG-Ou
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 11:31:45 +0000
Message-ID: <4AC1F018.5000207@nokia.com>
Date: Tue, 29 Sep 2009 14:31:36 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Lambert <dave@lambsys.com>
Subject: Re: Long attach times attaching MTD to UBI
References: <4AC113E8.2030405@lambsys.com>
In-Reply-To: <4AC113E8.2030405@lambsys.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Lambert wrote:
> Please excuse me if this is a naive question as I am a newbie to MTD and 
> flash file systems.
> 
> I am attempting to enable UBIFS on an Atmel AT91RM9200 using kernel 
> version 2.6.30.1. One of the attractions was fast mount times compared 
> to JFFS2 etc. Unfortunately I am running into VERY long attach times as 
> witnessed below. Obviously I must be doing something very wrong as the 
> documentation indicates that attaching a 1G partition should take around 
> 2 seconds, but mine is over 8 minutes!

Is your NAND slow?  Have you configured UBI debugging checks turned on?
