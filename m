Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AGd4P-0004E8-5I
	for <linux-mtd@lists.infradead.org>; Mon, 03 Nov 2003 11:40:31 +0000
From: Ian Campbell <icampbell@arcom.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <1067858096.3423.431.camel@hades.cambridge.redhat.com>
References: <1067856319.11251.47.camel@linuxdev.icampbell.arcom.cc>
	 <1067858096.3423.431.camel@hades.cambridge.redhat.com>
Message-Id: <1067859524.11241.58.camel@linuxdev.icampbell.arcom.cc>
Mime-Version: 1.0
Date: Mon, 03 Nov 2003 11:38:45 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: ilookup used in fs/jffs2/gc.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I just added ilookup-2.4.23.patch to the CVS tree, which contains both
> the ilookup() implementation and another race fix which is required for
> 2.4. 

Thank you very much! The patch applied (with fuzz) to 2.4.19-rmk7-pxa2
(+ my stuff) as well. I've just booted it and it seems fine (time will
tell, but I don't expect any problems with it).

Cheers
Ian.

-- 
Ian Campbell, Senior Design Engineer

Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.

This message has been checked for all viruses by MessageLabs Virus Control Centre.
