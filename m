Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgUI3-0007Ak-Jj
 for linux-mtd@lists.infradead.org; Fri, 10 Apr 2015 08:27:52 +0000
From: =?iso-2022-jp?B?UWkgV2FuZyAbJEIyJjUvGyhCIChxaXdhbmcp?=
 <qiwang@micron.com>
To: "rnd4@dave-tech.it" <rnd4@dave-tech.it>
Subject: [MLC NAND]: data pattern sensivity
Date: Fri, 10 Apr 2015 08:27:15 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A9DF4228E@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrea,

On Thu, 2015-04-09 at 22:19 +0200, Andrea Scian wrote:
>Il 07/04/2015 19:45, Jeff Lauruhn (jlauruhn) ha scritto:
>> I read back through the posts and I think we are talking about 2
>separate things, random read time and randomization.
>>
>> Rand Read (tR) assumes you are doing a single read of a page (worst
>case), but most data is stored in blocks sequentially, so data output can
>be improve significantly by read by taking advantage of commands like
>READ PAGE CACHE SEQUENTIAL which copies the next sequential page from the
>NAND Flash array to the data register.
>>
>> Randomization is a relatively new feature, I'm no expert, but it's in
>general we know there are some distributions that are worse than others,
>and by randomizing the data we can avoid worst case and improve endurance.

Yes, Randomization can avoid worst case and improve endurance

>
>Definitely here I'm speaking about the latter.
>By looking inside the datasheet (hynix, micron and so on) I have I've
>found no MLC part that explicitly required such a implementation, apart
>the one pointed out by Boris.

For Micron MLC part, we already implement this function inside of our MLC,
so external randomization isn't needed at all.

Thanks

--
Qi Wang
