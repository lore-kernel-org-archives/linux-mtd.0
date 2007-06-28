Received: from rgminet01.oracle.com ([148.87.113.118])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3mIo-0008DA-Qp
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2007 01:12:24 -0400
Message-ID: <4683437E.50109@oracle.com>
Date: Wed, 27 Jun 2007 22:13:34 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH -mm] UBI: one less BUG usage
References: <20070626153027.cbe757f0.randy.dunlap@oracle.com>
	<Pine.LNX.4.64.0706272244470.22935@pentafluge.infradead.org>
In-Reply-To: <Pine.LNX.4.64.0706272244470.22935@pentafluge.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: akpm <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Tue, 26 Jun 2007, Randy Dunlap wrote:
> 
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> Eliminate one BUG() usage.  The callers of major_to_device() already
>> handle and report errors.  This is just another error to return.
> 
> Why is this just an error? It must never happen unles there is a bug in 
> the code. Or is there a campaign against BUG() calls?
> 
> Artem.

There's always a campaign against unneeded BUG() calls.
However, if you say this one is needed, then so be it.

However(2), ubi_cdev_ioctl() calls major_to_device() and allows it
to return an error [although major_to_device() currently cannot
return such an error]:

	ubi = major_to_device(imajor(inode));
	if (IS_ERR(ubi))
		return PTR_ERR(ubi);

so part of cdev.c allows and handles error returns from major_to_device().

All my patch does is allow and handle error returns from major_to_device()
in vol_cdev_open().  vol_cdev_open() already handles errors by returning
the error to its caller.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
