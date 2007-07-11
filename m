Received: from mga09.intel.com ([134.134.136.24])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8fHz-0002Op-JK
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 12:43:44 -0400
Message-ID: <469508B5.3080509@intel.com>
Date: Wed, 11 Jul 2007 20:43:33 +0400
From: akorolev <alexey.korolev@intel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Why the alignemt to 4 bytes is necessary in jffs2_commit_write
	function
References: <46950472.7000103@intel.com>
	<1184171758.31598.12.camel@pmac.infradead.org>
In-Reply-To: <1184171758.31598.12.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Aghh I see.
Thank you very much!

> On Wed, 2007-07-11 at 20:25 +0400, akorolev wrote:
>   
>> If I properly understand the aligned_start is not related to offset of
>> the fragment it is just offset within the file.  (Frag offset is
>> aligned) File offset is not necessary to keep aligned - so why not to
>> kick off it. (I tried and didn't find anything wrong in tests).
>>     
>
> Consider:
> 	while (1)
> 		write(fd, "x", 1);
>
> This is fairly much worst-case behaviour for JFFS2, and you end up with
> a _large_ number of data nodes. One thing we've done to improve
> behaviour in this situation is rewrite the entire page when we write the
> last byte in a page -- but that doesn't fix _all_ cases.
>
> Since data nodes _are_ aligned to 4 bytes, it doesn't hurt us at all to
> write a full 4 bytes instead of only 1 byte. So you'll have a maximum of
> 1024 data nodes for a given 4KiB page even if you don't manage to
> trigger the code which rewrites the page.
>
>   
