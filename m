Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H8uow-0005yR-5k
	for linux-mtd@lists.infradead.org; Mon, 22 Jan 2007 03:46:32 -0500
Message-ID: <45B4798F.8030809@nokia.com>
Date: Mon, 22 Jan 2007 10:45:03 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
Subject: Re: OneNAND: Check first or second pages for bad block information
References: <3686708.94231169451196140.JavaMail.weblogic@ep_ml23>
In-Reply-To: <3686708.94231169451196140.JavaMail.weblogic@ep_ml23>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> I'm not sure we have to check 2nd page. Yes, Spec. says we will check 1st and 2nd ones.
> 
> It increase the boot time even though it's smaller one than others.

My experience is that the OneNAND bad block scanning time is very small (i.e. insignicant) compared with overall boot time.
For example:
	2048 blocks x 2 pages x 30 microseconds per page = 0.12 seconds

> Let me think, when we check 2nd page case.
> In initial bad, no need to check 2nd page.
> In runtime bad, it is only happend when first page write failed. But during write it has non-0xFF value. so next time it will be detected as invalid.
> 
> How do you think about it?

I cannot comment on how OneNAND actually works.  Also I do not have any experience of encountering bad blocks.  So I would follow the specification.

The specification says:

	Check "FFFFh" at the 1st word of sector 0
	of spare area in 1st and 2nd page

Based on the specification, I would presume that if a bad block goes un-noticed, it could be erased and written without error and only produce errors when the data is read back, by which time it is too late.

If you can guarantee that we never need to read the 2nd page to detect bad blocks, then the specification should be changed accordingly.
