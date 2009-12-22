Received: from [88.191.21.22] (helo=island.wyplay.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NMzr9-0004n2-Tv
	for linux-mtd@lists.infradead.org; Tue, 22 Dec 2009 08:12:40 +0000
Message-ID: <4B307E68.90901@wyplay.com>
Date: Tue, 22 Dec 2009 09:08:08 +0100
From: Lauren Del Giudice <lauren@wyplay.com>
MIME-Version: 1.0
To: Darwin Rambo <drambo@broadcom.com>
Subject: Re: UBI - exclude bootloader blocks from wear levelling
References: <4B2FA658.6010407@wyplay.com>
	<B125D8217ABC4B43826503DE00A2D44910DFC17584@SJEXCHCCR01.corp.ad.broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910DFC17584@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset=ISO-8859-1
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

Good news, thank you Darwin. May I suggest then to change the
sentence in the (excellent) documentation from:

"you may continuously write/erase only one logical eraseblock of an
UBI volume, but UBI will spread this to all physical eraseblocks of
the flash chip"
<http://www.linux-mtd.infradead.org/doc/ubi.html#L_overview>

to something more explicit/accurate?

Lauren.

Darwin Rambo wrote:
> Wear levelling is done across a "ubi device" (not the whole nand device) which is associated with a mtd partition. Your bootloader and kernel mtd partitions will not be wear levelled, only your ubi file system partitions. i.e. ubi doesn't know about non-ubi mtd partitions.
> 
> I think that's the gist of it.
> 
> Darwin
> 
> 
> 
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Lauren Del Giudice
> Sent: Monday, December 21, 2009 8:46 AM
> To: linux-mtd@lists.infradead.org
> Subject: UBI - exclude bootloader blocks from wear levelling
> 
> I'm new to UBI... I understood that static wear levelling is applied
> accross the whole device (a NAND device in my case); If so, how can
> I exclude blocks reserved for the bootloader from wear levelling?
> 
> Thanks for your help,
> Lauren.
> ----
> This message contains confidential information and may contain information that is legally privileged.  If you have received this message by mistake, please immediately notify us and delete the original message. Thank you.  
> 
> Ce message contient des informations confidentielles.  S'il vous est parvenu par erreur, merci de bien vouloir nous en aviser par retour, de n'en faire aucun usage et de n'en garder aucune copie.
> ----
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
----
This message contains confidential information and may contain information that is legally privileged.  If you have received this message by mistake, please immediately notify us and delete the original message. Thank you.  

Ce message contient des informations confidentielles.  S'il vous est parvenu par erreur, merci de bien vouloir nous en aviser par retour, de n'en faire aucun usage et de n'en garder aucune copie.
----
