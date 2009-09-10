Received: from mail-ew0-f210.google.com ([209.85.219.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MliHD-0004CF-JP
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 11:57:28 +0000
Received: by ewy6 with SMTP id 6so29398ewy.27
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Sep 2009 04:57:21 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH] Kconfig: MTD_DATAFLASH_WRITE_VERIFY ->
	MTD_DATAFLASH_VERIFY_WRITE
References: <alpine.LFD.2.00.0909100716440.19313@localhost>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Sep 2009 13:57:19 +0200
In-Reply-To: <alpine.LFD.2.00.0909100716440.19313@localhost> (Robert P. J.
	Day's message of "Thu\, 10 Sep 2009 07\:19\:11 -0400 \(EDT\)")
Message-ID: <877hw7vwps.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Robert" == Robert P J Day <rpjday@crashcourse.ca> writes:

 Robert> Fix the misspelled Kconfig variable "MTD_DATAFLASH_WRITE_VERIFY" so
 Robert> that it matches the spelling here:

 Robert> drivers/mtd/devices/mtd_dataflash.c:#ifdef CONFIG_MTD_DATAFLASH_VERIFY_WRITE
 Robert> drivers/mtd/devices/mtd_dataflash.c:#endif	/* CONFIG_MTD_DATAFLASH_VERIFY_WRITE */

 Robert> -config MTD_DATAFLASH_WRITE_VERIFY
 Robert> +config MTD_DATAFLASH_VERIFY_WRITE

It probably makes more sense to change the .c file instead of Kconfig,
to not bother/confuse people and simply make it "just work".

-- 
Bye, Peter Korsgaard
