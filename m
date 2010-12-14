Received: from mail-ew0-f43.google.com ([209.85.215.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSXzy-0007LY-IB
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:45:11 +0000
Received: by ewy22 with SMTP id 22so488694ewy.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 08:45:09 -0800 (PST)
Subject: Re: Please teach UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tarosa <tarosa.y@gmail.com>
In-Reply-To: <4D0264BF.6060904@gmail.com>
References: <4D0264BF.6060904@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 18:44:36 +0200
Message-ID: <1292345076.2538.95.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-12-11 at 02:34 +0900, Tarosa wrote:
> Hello.
> 
> Because I do not usually use English, unknown sentences might be written.
> 
> It is a basic question.
> UBI is an array of the initial of "Unsorted block images". Please teach the
> meaning of this "Unsorted block images".

Well, you can consider physical erase blocks to be sorted. Then when you
put UBI on top, you have logical eraseblocks (LEBs). Each LEB contains
an "image" (data), and it is mapped to a PEB (block), and and UBI makes
these images to be unsorted in physical level.

So
1. block = physical eraseblock
2. block image - the contents of a physical eraseblocks.

Without UBI, "block images" are sorted.

With UBI, they become "unsorted", in a sense that UBI adds logical layer
with mapping, so on the physical level the "block images" become
unsorted.

Hence the name. It also means "where" in Latin. IBM guys invented it,
not me, so my understanding can be wrong.

> Was there a filesystem of "Sorted block images" in the past?

In physical eraseblocks.

> What after the filesystem is different as for not sorting block images?

UBI is not file-system at all. It is a layer between MTD and
file-system. UBIFS is a file-system which relies on UBI. It name comes
from UBI + FS = UBIFS.

> Where of UBI is unsorted block images?
> I do not understand. Please tell me.
> 
> There are another and a question.
> It is defined that CONFIG_MTD_UBI_WL_THRESHOLD is 4096. It is thought this is to
> mean WL is done as difference between a maximum  and a minimum  of the value of
> erace counter of PEBs are always in the range of 4096*2(=8192).

Not 8192, but 4096.

> Why is it 8192 ?
> In a value that is bigger than 8192, isn't it good? Or, isn't it good in a
> narrower range?

This is just a default. For modern flash you may need lower value, this
is configurable.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
