Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhbLM-0004u9-45
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 13:57:48 +0000
From: Richard Weinberger <richard@nod.at>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [EXT] Re: UBIFS file has zeroes at the end after an unclean reboot
Date: Mon, 23 Jul 2018 15:57:30 +0200
Message-ID: <7190735.ucvf7OJQ7J@blindfold>
In-Reply-To: <2d969635723b4aa3abf59b2d5da7ab3e@SIWEX5A.sing.micron.com>
References: <8f54ca9aee0947d49e7e99dd11f33a74@SIWEX5A.sing.micron.com>
 <1929018.rLX3MmPisr@blindfold>
 <2d969635723b4aa3abf59b2d5da7ab3e@SIWEX5A.sing.micron.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am Montag, 23. Juli 2018, 15:25:49 CEST schrieb Bean Huo (beanhuo):
> Hi,Richard
> Thanks.  
> it is Async mode ubifs  mounted. After random powerloss testing, found that there is one file contains huge zeroes data.
> But UBIFS didn't crash and no ECC/CRC error.

Well, if the application changed the file while the power-cut happens, such situation can happen on all
kind of filesystems.
That's why I asked whether the application does the right thing. :)

Thanks,
//richard
