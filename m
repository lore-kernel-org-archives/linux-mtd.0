Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFoOM-0003Ut-Q2
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 20:04:55 +0000
Subject: Re: [PATCH v2] ubi: Make recover_peb power cut aware
To: =?UTF-8?B?SsO2cmcgUGbDpGhsZXI=?= <pfaehler@isse.de>
References: <1466461910-18858-1-git-send-email-richard@nod.at>
 <2124396.xJgUrQUc0H@pfaehler-pc>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com, stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <576AEF50.2090704@nod.at>
Date: Wed, 22 Jun 2016 22:04:32 +0200
MIME-Version: 1.0
In-Reply-To: <2124396.xJgUrQUc0H@pfaehler-pc>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.06.2016 um 16:44 schrieb Jörg Pfähler:
> Reviewed-by: Jörg Pfähler <pfaehler@isse.de>
> 
> Am Dienstag, 21. Juni 2016, 00:31:50 CEST schrieb Richard Weinberger:
>> recover_peb() was never power cut aware,
>> if a power cut happened right after writing the VID header
>> upon next attach UBI would blindly use the new partial written
>> PEB and all data from the old PEB is lost.
>>
>> In order to make recover_peb() power cut aware, write the new
>> VID with a proper crc and copy_flag set such that the UBI attach
>> process will detect whether the new PEB is completely written
>> or not.
>> We cannot directly use ubi_eba_atomic_leb_change() since we'd
>> have to unlock the LEB which is facing a write error.
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: Jörg Pfähler <pfaehler@isse.de>
>> Signed-off-by: Richard Weinberger <richard@nod.at>

Applied and pushed into linux-next.

Thanks,
//richard
