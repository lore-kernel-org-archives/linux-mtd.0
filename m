Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab6CO-0004th-OT
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 12:48:18 +0000
Subject: Re: [PATCH 1/1] mtd: mtdram: Add parameter for setting writebuf size
To: Alexander Stein <alexander.stein@systec-electronic.com>
References: <1456911954-12929-1-git-send-email-alexander.stein@systec-electronic.com>
 <CAFLxGvzbrqmeepS_kK3KOun+x7XTTN=PL0WO_BH-VOVYXxJddw@mail.gmail.com>
 <2781096.oJXdWOB4df@ws-stein>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56D6E0F6.8070905@nod.at>
Date: Wed, 2 Mar 2016 13:47:50 +0100
MIME-Version: 1.0
In-Reply-To: <2781096.oJXdWOB4df@ws-stein>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.03.2016 um 11:41 schrieb Alexander Stein:
> On Wednesday 02 March 2016 11:23:59, Richard Weinberger wrote:
>> On Wed, Mar 2, 2016 at 10:45 AM, Alexander Stein
>> <alexander.stein@systec-electronic.com> wrote:
>>> ubifs uses the write buffer size in recovery algorithm. When inspecting
>>> an unclean ubifs recovery fails with writebuf size 64 in mtdram while
>>> recovery on actual mtd device with writebuf size of 1024 succeeds.
>>> So add a parameter for setting this property.
>>
>> Can it be that you've tested an NAND image on mtdram?
> 
> Nope. We copied that image within barebox from device /dev/nor0 (the whole 128MiB NOR flash) and used that in mtdram.
> Unfortunately mounting that "broken" ubifs in barebox suffers from essentially the same problem: using a different writebuf size for recovery results in failure. But that's another issue.
> The apparently important changes in linux are the commits:
> 428ff9d2e37d3a82af0f56b476f70c244cf550d1 ("UBIFS: remove dead code")
> 2765df7da540687c4d57ca840182122f074c5b9c ("UBIFS: use max_write_size during recovery")
> With those two the writebuf size gets used by ubifs.

Makes sense to me!
One minor nitpick, the comment "Mimic CFI NOR flashes" is no longer valid then.
Maybe you can note in Kconfig that the default value 64 mimics CFI NOR...

Beside of that:
Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
