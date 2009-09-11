Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MmBCS-0003gT-DZ
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 18:50:28 +0000
Received: by ewy23 with SMTP id 23so1261031ewy.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Sep 2009 11:50:21 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH] MTD: Correct misspelled Kconfig var
	CONFIG_MTD_DATAFLASH_VERIFY_WRITE
References: <alpine.LFD.2.00.0909110543410.11692@localhost>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Sep 2009 20:50:19 +0200
In-Reply-To: <alpine.LFD.2.00.0909110543410.11692@localhost> (Robert P. J.
	Day's message of "Fri\, 11 Sep 2009 05\:44\:50 -0400 \(EDT\)")
Message-ID: <878wgltixg.fsf@macbook.be.48ers.dk>
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

 Robert> Make the source file correction CONFIG_MTD_DATAFLASH_VERIFY_WRITE ->
 Robert> CONFIG_MTD_DATAFLASH_WRITE_VERIFY to match the Kconfig variable in
 Robert> drivers/mtd/devices/Kconfig.

 Robert> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Acked-by: Peter Korsgaard <jacmet@sunsite.dk>

-- 
Bye, Peter Korsgaard
