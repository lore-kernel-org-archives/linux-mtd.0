Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbCM5-0003YU-IG
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 18:18:10 +0000
Message-ID: <55144D47.3000203@nod.at>
Date: Thu, 26 Mar 2015 19:17:43 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Morand, Guy" <Guy.Morand@comet.ch>
Subject: Re: UBIFS corruption and UBI + unstable bit questions
References: <68AC191B3EB2874F99C36CD9CA3A6D42195CB0@cgpmbx01.comet.ch>
 <CAFLxGvzqfmFqRLts5Swa-tintZzJksb6PsRXaNBX9KaRBpXMvg@mail.gmail.com>
 <68AC191B3EB2874F99C36CD9CA3A6D42195ED8@cgpmbx01.comet.ch>
In-Reply-To: <68AC191B3EB2874F99C36CD9CA3A6D42195ED8@cgpmbx01.comet.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 26.03.2015 um 18:18 schrieb Morand, Guy:
>> Can you please be more specific.
>> What exactly do you mean by "only the partition"?
>> Also what do you mean by "corrupted"?
> 
> Sorry, nomenclature problem ... I mean by a volume the layer on top of the MTD 
> device (UBI):
> ubiformat /dev/mtd1
> ubiattach /dev/ubi_ctrl -m 1
> 
> By partition, I mean actually a volume on top of UBI (UBIFS):
> ubimkvol /dev/ubi0 -N partition1 -s 64MiB
> ubimkvol /dev/ubi0 -N partition2 -m

So, an UBI volume. :-)

> Then if there is a "unstable bit" on partition1, is also the partition2 
> corrupted? This means there is nothing I can do to restore it.

No, UBI tries hard to preserve data.
But it depends on the type of the corruption.

>> UBI/FS is not a magic bullet. People who *really* care about power cut safety
>> attack the problem also with their hardware.
> Yieah right, I understand... I've seen some hardware with super caps that gives 
> some time to Linux to shutdown correctly, I really love it!

It is not really Linux which needs time to shutdown, mostly other hardware components.
People who care know exactly which components need some time, the NAND chip is only one of them.
Also they don't only care about a plain power cut. You also need to take care of voltage variations
during a power cut.

>> Are you able to trigger this problem?
> No, I'm just thinking about a nice partitioning strategy on my platform to 
> avoid as much corruptions as possible with the hardware I have in hands!

Okay. That's what I thought. I've never seen the issue on serious hardware.

Thanks,
//richard
