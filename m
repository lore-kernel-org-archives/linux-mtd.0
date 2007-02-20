Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJW6Z-0001nc-EJ
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 09:36:34 -0500
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l1KEXFs9019716
	for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2007 16:33:33 +0200
Message-ID: <45DB0727.6050800@nokia.com>
Date: Tue, 20 Feb 2007 16:35:19 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: OneNAND: Enabling ECC in main area
References: <e167438e0702191510v2f68036bt20af6f6db6d13bed@mail.gmail.com>
In-Reply-To: <e167438e0702191510v2f68036bt20af6f6db6d13bed@mail.gmail.com>
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
> Also, if the ECC is working correctly, should we see non FF bytes in
> the spare area in bytes 8 to 10 of each 16 byte portion of the OOB
> when we do a dump of the data?

Yes.  We have ECC enabled and that is what we see.
