Received: from smtp-4.orange.nl ([193.252.22.249])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J2OfN-0005pd-Qq
	for linux-mtd@lists.infradead.org; Wed, 12 Dec 2007 10:18:20 +0000
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf6301.orange.nl (SMTP Server) with ESMTP id F30E17000085
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Dec 2007 11:18:10 +0100 (CET)
Received: from wwinf6302 (wwinf6302 [10.232.3.29])
	by mwinf6301.orange.nl (SMTP Server) with ESMTP id F0EEA7000084
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Dec 2007 11:18:10 +0100 (CET)
From: Gerrit Binnenmars <gerritbinnenmars@wanadoo.nl>
To: linux-mtd@lists.infradead.org
Message-ID: <22241437.21981197454690980.JavaMail.www@wwinf6302>
Subject: AMD S29GL512 lock sectors
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Dec 2007 11:18:10 +0100 (CET)
Reply-To: gerritbinnenmars@wanadoo.nl
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I noticed that the mtd lock/unlock are not supported for the cfi_cmdset_0002 of AMD.
I also noticed that there was a cfi_amdstd_lock_varsize implementation in the past.
Why is it removed?
Is it possible to get sector lock protection with this chip.

What other options do I have to protect my flash. I have used the MTD_WRITABLE option 
in the mapping driver but then I can never write to the mtd partition?

Any help is appreciated.

Greetings Gerrit Binnenmars
