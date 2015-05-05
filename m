Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ypf1p-0005Dc-5z
 for linux-mtd@lists.infradead.org; Tue, 05 May 2015 15:45:02 +0000
Message-ID: <5548E560.5090106@nod.at>
Date: Tue, 05 May 2015 17:44:32 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Marcin Adamski <mass85@tlen.pl>
Subject: Re: File in JFFS2 corrupted after power loss during removal of other
 files
References: <553983c4.1e577cd2.5547694c.c00cd@tlen.pl>
 <CAFLxGvx31ey877oxXawEPwnyf+NHFxqzh6LhU09KeJzfRDz_BQ@mail.gmail.com>
 <5b5133fc.589863a5.5548ddf5.c47c7@tlen.pl>
In-Reply-To: <5b5133fc.589863a5.5548ddf5.c47c7@tlen.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.05.2015 um 17:12 schrieb Marcin Adamski:
> On Mon, May 5, 2015 at 16:35,  Richard Weinberger <richard.weinberger@gmail.com> wrote:
>> I'd say "it's complicated". :)
>>
>> UBIFS was created to deal with such situations.
>> If you want to be on the safe side, use it.
>>
> 
> I'm afraid it is too late for me to use UBIFS, as I need to perform upgrade of my devices in the field and migration from JFFS2 to UBIFS seems impossible (at least without some additional free space in flash).
> 
> I concluded that JFFS2 should also handle this kind of scenarios after reading about CRC failures in http://www.linux-mtd.infradead.org/faq/jffs2.html#L_messages

AFAIK it depends on the corruption. But JFFS2 predates me. :)
Usually in such situations I inspect the corrupt image by hand.
Maybe it is also an hardware issue. Is this NAND flash?

Thanks,
//richard
